use utf8;
package IC6::Schema::Result::Product;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

IC6::Schema::Result::Product

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<products>

=cut

__PACKAGE__->table("products");

=head1 ACCESSORS

=head2 sku

  data_type: 'varchar'
  is_nullable: 0
  size: 32

=head2 sku_class

  data_type: 'varchar'
  is_foreign_key: 1
  is_nullable: 0
  size: 32

=head2 name

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 255

=head2 short_description

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 500

=head2 description

  data_type: 'text'
  default_value: (empty string)
  is_nullable: 0

=head2 price

  data_type: 'numeric'
  default_value: 0.0
  is_nullable: 0
  size: [10,2]

=head2 uri

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 255

=head2 weight

  data_type: 'numeric'
  default_value: 0.0
  is_nullable: 0

=head2 priority

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=head2 gtin

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 32

=head2 canonical_sku

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 32

=head2 active

  data_type: 'boolean'
  default_value: true
  is_nullable: 0

=head2 inventory_exempt

  data_type: 'boolean'
  default_value: false
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "sku",
  { data_type => "varchar", is_nullable => 0, size => 32 },
  "sku_class",
  { data_type => "varchar", is_foreign_key => 1, is_nullable => 0, size => 32 },
  "name",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 255 },
  "short_description",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 500 },
  "description",
  { data_type => "text", default_value => "", is_nullable => 0 },
  "price",
  {
    data_type => "numeric",
    default_value => "0.0",
    is_nullable => 0,
    size => [10, 2],
  },
  "uri",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 255 },
  "weight",
  { data_type => "numeric", default_value => "0.0", is_nullable => 0 },
  "priority",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "gtin",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 32 },
  "canonical_sku",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 32 },
  "active",
  { data_type => "boolean", default_value => \"true", is_nullable => 0 },
  "inventory_exempt",
  { data_type => "boolean", default_value => \"false", is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</sku>

=back

=cut

__PACKAGE__->set_primary_key("sku");

=head1 RELATIONS

=head2 cart_products

Type: has_many

Related object: L<IC6::Schema::Result::CartProduct>

=cut

__PACKAGE__->has_many(
  "cart_products",
  "IC6::Schema::Result::CartProduct",
  { "foreign.sku" => "self.sku" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 group_pricings

Type: has_many

Related object: L<IC6::Schema::Result::GroupPricing>

=cut

__PACKAGE__->has_many(
  "group_pricings",
  "IC6::Schema::Result::GroupPricing",
  { "foreign.sku" => "self.sku" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 inventory

Type: might_have

Related object: L<IC6::Schema::Result::Inventory>

=cut

__PACKAGE__->might_have(
  "inventory",
  "IC6::Schema::Result::Inventory",
  { "foreign.sku" => "self.sku" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 media_displays

Type: has_many

Related object: L<IC6::Schema::Result::MediaDisplay>

=cut

__PACKAGE__->has_many(
  "media_displays",
  "IC6::Schema::Result::MediaDisplay",
  { "foreign.sku" => "self.sku" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 media_products

Type: has_many

Related object: L<IC6::Schema::Result::MediaProduct>

=cut

__PACKAGE__->has_many(
  "media_products",
  "IC6::Schema::Result::MediaProduct",
  { "foreign.sku" => "self.sku" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 merchandising_products_skus

Type: has_many

Related object: L<IC6::Schema::Result::MerchandisingProduct>

=cut

__PACKAGE__->has_many(
  "merchandising_products_skus",
  "IC6::Schema::Result::MerchandisingProduct",
  { "foreign.sku" => "self.sku" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 merchandising_products_skus_related

Type: has_many

Related object: L<IC6::Schema::Result::MerchandisingProduct>

=cut

__PACKAGE__->has_many(
  "merchandising_products_skus_related",
  "IC6::Schema::Result::MerchandisingProduct",
  { "foreign.sku_related" => "self.sku" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 navigation_products

Type: has_many

Related object: L<IC6::Schema::Result::NavigationProduct>

=cut

__PACKAGE__->has_many(
  "navigation_products",
  "IC6::Schema::Result::NavigationProduct",
  { "foreign.sku" => "self.sku" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 orderlines

Type: has_many

Related object: L<IC6::Schema::Result::Orderline>

=cut

__PACKAGE__->has_many(
  "orderlines",
  "IC6::Schema::Result::Orderline",
  { "foreign.sku" => "self.sku" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 products_attributes

Type: has_many

Related object: L<IC6::Schema::Result::ProductAttributes>

=cut

__PACKAGE__->has_many(
  "products_attributes",
  "IC6::Schema::Result::ProductAttributes",
  { "foreign.sku" => "self.sku" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 sku_class

Type: belongs_to

Related object: L<IC6::Schema::Result::ProductClass>

=cut

__PACKAGE__->belongs_to(
  "sku_class",
  "IC6::Schema::Result::ProductClass",
  { sku_class => "sku_class" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);

=head2 product_attributes

Type: many_to_many

Composing rels: L</products_attributes> -> product_attribute

=cut

__PACKAGE__->many_to_many(
  "product_attributes",
  "products_attributes",
  "product_attribute",
);


# Created by DBIx::Class::Schema::Loader v0.07025 @ 2013-11-08 09:38:12
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:3/NTsOSzy7fqdEvwhVcdXQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
