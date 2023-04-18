using riskmanagement as rm from '../db/schema';

// Annotate Risk elements
annotate rm.Risks with {
   ID @title: 'Risk';
   title @title: 'Title';
   owner @title: 'Owner';
   prio @title: 'Priority';
   descr @title: 'Description';
   mitigations @title: 'Mitigation';
   bp @title: 'Business Partner';
   impact @title: 'Impact';
}

// Annotate BusinessPartners elements
annotate rm.BusinessPartners with {
   BusinessPartner @(
      UI.Hidden,
      Common: {
         Text: LastName
      }
   );
   LastName @title: 'Last Name';
   FirstName @title: 'First Name';
}

// Annotate Miti elements
annotate rm.Mitigations with {
   ID @(
      UI.Hidden,
      Common: {
         Text: descr
      }
   );
   owner @title: 'Owner';
   descr @title: 'Description';
}

annotate rm.Risks with {
   mitigations @(Common: {
      //show text, not id for mitigation in the context of risks
      Text: mitigations.descr,
      TextArrangement: #TextOnly,
      ValueList: {
         Label: 'Mitigations',
         CollectionPath: 'Mitigations',
         Parameters: [{
               $Type: 'Common.ValueListParameterInOut',
               LocalDataProperty: mitigations_ID,
               ValueListProperty: 'ID'
            },
            {
               $Type: 'Common.ValueListParameterDisplayOnly',
               ValueListProperty: 'descr'
            }
         ]
      }
   });
   bp @(Common: {
      Text: bp.LastName,
      TextArrangement: #TextOnly,
      ValueList: {
         Label: 'Business Partners',
         CollectionPath: 'BusinessPartners',
         Parameters: [{
               $Type: 'Common.ValueListParameterInOut',
               LocalDataProperty: bp_BusinessPartner,
               ValueListProperty: 'BusinessPartner'
            },
            {
               $Type: 'Common.ValueListParameterDisplayOnly',
               ValueListProperty: 'LastName'
            },
            {
               $Type: 'Common.ValueListParameterDisplayOnly',
               ValueListProperty: 'FirstName'
            }
         ]
      }
   })
}