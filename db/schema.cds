namespace riskmanagement;

using
{
    managed,
    cuid
}
from '@sap/cds/common';

using { API_BUSINESS_PARTNER as external } from '../srv/external/API_BUSINESS_PARTNER.csn';

entity Risks : cuid, managed
{
    title : String(100);
    owner : String;
    prio : String(5);
    descr : String;
    impact : Integer;
    criticality : Integer;
    mitigations : Association to one Mitigations;
    bp : Association to one BusinessPartners;
}

entity Mitigations : cuid, managed
{
    descr : String;
    owner : String;
    timeline : String;
    risks : Association to many Risks on risks.mitigations = $self;
}

entity BusinessPartners as projection on external.A_BusinessPartner
{
    key BusinessPartner,
    FirstName,
    LastName,
};
