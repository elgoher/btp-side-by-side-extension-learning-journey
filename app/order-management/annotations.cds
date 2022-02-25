using OrderService as service from '../../srv/order-service';

annotate service.Order with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'Order ID',
            Value : OrderID,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Price Total',
            Value : price_total,
        },
        {
            $Type : 'UI.DataField',
            Value : to_Vendor.name,
            Label : 'Vendor',
        },
    ]
);
annotate service.Order with @(
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'OrderID',
                Value : OrderID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'price_total',
                Value : price_total,
            },
            {
                $Type : 'UI.DataField',
                Value : currency_code,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.CollectionFacet',
            Label : 'Details',
            ID : 'Details',
            Facets : [
            {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup1',
        },
                {
            $Type : 'UI.ReferenceFacet',
            Label : 'Vendor Information',
            ID : 'VendorInformation',
            Target : '@UI.FieldGroup#VendorInformation',
        },
                ],
        },
        {
            $Type : 'UI.CollectionFacet',
            Label : 'Order Items',
            ID : 'OrderItems',
            Facets : [
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'Order Items',
                    ID : 'OrderItems1',
                    Target : 'to_orderItem/@UI.LineItem#OrderItems',
                },],
        },
    ]
);
annotate service.Order with @(
    UI.HeaderInfo : {
        TypeName : 'Order',
        TypeNamePlural : 'Orders',
        Description : {
            $Type : 'UI.DataField',
            Value : 'Order',
        },
        Title : {
            $Type : 'UI.DataField',
            Value : OrderID,
        },
    }
);
annotate service.Order with @(
    UI.FieldGroup #VendorInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : to_Vendor.name,
                Label : 'Vendor',
            },{
                $Type : 'UI.DataField',
                Value : to_Vendor.country,
                Label : 'Country',
            },{
                $Type : 'UI.DataField',
                Value : to_Vendor.city,
                Label : 'City',
            },{
                $Type : 'UI.DataField',
                Value : to_Vendor.street,
                Label : 'Street',
            },{
                $Type : 'UI.DataField',
                Value : to_Vendor.zip,
                Label : 'Zip',
            },{
                $Type : 'UI.DataField',
                Value : to_Vendor.state,
                Label : 'State',
            },{
                $Type : 'UI.DataField',
                Value : to_Vendor.email,
                Label : 'Email',
            },{
                $Type : 'UI.DataField',
                Value : to_Vendor.phone,
                Label : 'Phone',
            },],
    }
);
annotate service.OrderItem with @(
    UI.LineItem #OrderItems : [
        {
            $Type : 'UI.DataField',
            Value : OrderItemID,
            Label : 'Item ID',
        },{
            $Type : 'UI.DataField',
            Value : name,
            Label : 'Item',
        },{
            $Type : 'UI.DataField',
            Value : quantity,
            Label : 'Quantity',
        },{
            $Type : 'UI.DataField',
            Value : price,
            Label : 'Price',
        },{
            $Type : 'UI.DataField',
            Value : price_total,
            Label : 'price_total',
        },]
);
annotate service.OrderItem with {
    price @Measures.ISOCurrency : currency_code
};
annotate service.OrderItem with {
    price_total @Measures.ISOCurrency : currency_code
};
annotate service.Order with {
    price_total @Measures.ISOCurrency : currency_code
};

annotate service.OrderItem with @(
    UI.HeaderInfo : {
        TypeName : 'Order Item',
        TypeNamePlural : 'Order Items',
        Title : {
            $Type : 'UI.DataField',
            Value : name,
        },
    }
);
annotate service.OrderItem with @(
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Details',
            ID : 'Details',
            Target : '@UI.FieldGroup#Details',
        },
    ],
    UI.FieldGroup #Details : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : OrderItemID,
                Label : 'Item ID',
            },{
                $Type : 'UI.DataField',
                Value : name,
                Label : 'Name',
            },{
                $Type : 'UI.DataField',
                Value : quantity,
                Label : 'Quantity',
            },{
                $Type : 'UI.DataField',
                Value : price,
                Label : 'Price',
            },{
                $Type : 'UI.DataField',
                Value : currency_code,
            },{
                $Type : 'UI.DataField',
                Value : price_total,
                Label : 'Price Total',
            },],
    }
);
annotate service.Order with @(
    UI.Identification : [
    ]
);
