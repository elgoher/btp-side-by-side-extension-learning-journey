namespace cld200.caseStudy;

using {sap.common as common, Currency} from '@sap/cds/common';

entity Vendor
{
    key VendorUUID : UUID
        @Core.Computed;
    VendorID : Integer;
    name : String;
    country : String;
    city : String;
    street : String;
    zip : String;
    state : String;
    email : String;
    phone : String;
    to_Order : Composition of many Order on to_Order.to_Vendor = $self;
}

entity Order
{
    key OrderUUID : UUID
        @Core.Computed;
    OrderID : Integer;
    price_total : Decimal;
    currency : Currency;
    to_Vendor : Association to one Vendor;
    to_orderItem : Composition of many OrderItem on to_orderItem.to_Order = $self;
}

entity Delivery
{
    key DeliveryUUID : UUID
        @Core.Computed;
    DeliveryID : Integer;
    status : String;
    no_packets : Integer;
    date : Date;
    to_Order : Association to one Order;
}

entity OrderItem
{
    key OrderItemUUID : UUID
        @Core.Computed;
    OrderItemID : Integer;
    name : String;
    quantity : Integer;
    price : Decimal;
    currency : Currency;
    price_total : Decimal;
    to_Order : Association to one Order;
}
