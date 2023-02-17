namespace riskmanagement;

using
{
    managed,
    cuid
}
from '@sap/cds/common';

entity Risks : cuid, managed
{
    title : String(100);
    owner : String;
    prio : String(5);
    descr : String;
    impact : Integer;
    criticality : Integer;
    mitigations : Association to one Mitigations;
}

entity Mitigations : cuid, managed
{
    descr : String;
    owner : String;
    timeline : String;
    risks : Composition of many Risks on risks.mitigations = $self;
}
