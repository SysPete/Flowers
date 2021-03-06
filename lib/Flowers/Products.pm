package Flowers::Products;

use strict;
use warnings;
use base 'Exporter';
use vars '@EXPORT_OK';

@EXPORT_OK = qw(product product_list);

use Dancer::Plugin::Interchange6;
use Dancer::Plugin::DBIC;

sub product {
    my ($path) = @_;
    my ($result);

    # check whether product is available
    my $rs = resultset('Product');
    $rs->result_class('DBIx::Class::ResultClass::HashRefInflator');
    $result = $rs->search(
        { sku => $path, 'me.active' => 1, },
        { prefetch => 'sku_class' },
    )->single();

    #warn 'product row: ', Data::Dumper->Dump(['product', $result->{_column_data}]), "\n";

    my $product = {
        (map { $_ => $result->$_ } qw(sku name short_description description price uri weight priority gtin canonical_sku active)),
        product_class => {
            map { $_ => $result->sku_class->$_ } qw(sku_class manufacturer name short_description uri active),
        },
    };
	return $product;
}

=head2 product_list

Returns a list of all products, ordered by priority.

=cut

sub product_list {
    my (%args) = @_;
    my ($order, $set);

    $args{sort} ||= 'priority';

    if ($args{sort} eq 'price') {
        $order = 'price ASC, priority ASC';
    }
    else {
        $order = 'priority ASC';
    }

    $set = shop_product->search({canonical_sku => undef,
                                 active => 1,
                             }, {
                                 page => 1,
                                 rows => 20,
                                 order_by => $order,
                             });

    return $set;
}

1;
