use utf8;
package IC6::Schema::Result::CartProduct;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

IC6::Schema::Result::CartProduct

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<cart_products>

=cut

__PACKAGE__->table("cart_products");

=head1 ACCESSORS

=head2 carts_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 sku

  data_type: 'varchar'
  is_foreign_key: 1
  is_nullable: 0
  size: 32

=head2 cart_position

  data_type: 'integer'
  is_nullable: 0

=head2 quantity

  data_type: 'integer'
  default_value: 1
  is_nullable: 0

=head2 when_added

  data_type: 'timestamp'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "carts_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "sku",
  { data_type => "varchar", is_foreign_key => 1, is_nullable => 0, size => 32 },
  "cart_position",
  { data_type => "integer", is_nullable => 0 },
  "quantity",
  { data_type => "integer", default_value => 1, is_nullable => 0 },
  "when_added",
  { data_type => "timestamp", is_nullable => 0 },
);

=head1 RELATIONS

=head2 cart

Type: belongs_to

Related object: L<IC6::Schema::Result::Cart>

=cut

__PACKAGE__->belongs_to(
  "cart",
  "IC6::Schema::Result::Cart",
  { carts_id => "carts_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);

=head2 sku

Type: belongs_to

Related object: L<IC6::Schema::Result::Product>

=cut

__PACKAGE__->belongs_to(
  "sku",
  "IC6::Schema::Result::Product",
  { sku => "sku" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);


# Created by DBIx::Class::Schema::Loader v0.07025 @ 2013-11-08 09:31:06
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:XHZxLKJ/eQQ4CV3eu3PYUg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;