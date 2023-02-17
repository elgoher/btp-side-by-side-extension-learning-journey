using RiskService as service from '../../srv/risk-service';

annotate service.Mitigations with @(
    SelectionFields: [owner],
    Identification: [{
        Value: descr
    }],
    UI.Facets: [{
            $Type: 'UI.ReferenceFacet',
            Label: 'General Information',
            ID: 'GeneralInformation',
            Target: '@UI.FieldGroup#GeneralInformation',
        },
        {
            $Type: 'UI.ReferenceFacet',
            Label: 'Risks',
            ID: 'Risks',
            Target: 'risks/@UI.LineItem#Risks',
        }
    ],
    UI.FieldGroup #GeneralInformation: {
        $Type: 'UI.FieldGroupType',
        Data: [{
            $Type: 'UI.DataField',
            Value: descr,
        }, {
            $Type: 'UI.DataField',
            Value: owner,
        }, {
            $Type: 'UI.DataField',
            Value: timeline,
            Label: 'timeline',
        }, ],
    }
);
annotate service.Mitigations with @(
    UI.LineItem: [{
            $Type: 'UI.DataField',
            Value: descr,
        },
        {
            $Type: 'UI.DataField',
            Value: owner,
        },
        {
            $Type: 'UI.DataField',
            Value: timeline,
            Label: 'timeline',
        },
    ]
);
annotate service.Risks with @(
    UI.LineItem #Risks: [{
        $Type: 'UI.DataField',
        Value: descr,
    }, {
        $Type: 'UI.DataField',
        Value: impact,
    }, {
        $Type: 'UI.DataField',
        Value: owner,
    }, {
        $Type: 'UI.DataField',
        Value: prio,
    }]
);

annotate service.Mitigations with @(
    UI.HeaderInfo : {
        TypeName : 'Mitigation',
        TypeNamePlural : 'Mitigations',
        Title : {
            $Type : 'UI.DataField',
            Value : descr,
        },
    }
);
