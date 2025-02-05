namespace riskmanagement;

using {
    managed,
    cuid
}
from '@sap/cds/common';

using {
    API_BUSINESS_PARTNER as external
}
from '../srv/external/API_BUSINESS_PARTNER.csn';

using {
    ZARIBA_PURCHASE_ORDERS_SRV as S4H
}
from '../srv/external/ZARIBA_PURCHASE_ORDERS_SRV.csn';


entity Risks: cuid, managed {
    title: String(100);
    owner: String;
    prio: String(5);
    descr: String;
    impact: Integer;
    criticality: Integer;
    mitigations: Association to one Mitigations;
    bp: Association to one BusinessPartners;
}

entity Mitigations: cuid, managed {
    descr: String;
    owner: String;
    timeline: String;
    risks: Association to many Risks on risks.mitigations = $self;
}

entity BusinessPartners as projection on external.A_BusinessPartner {
    key BusinessPartner,
    FirstName,
    LastName,
};

entity ZARIBA_PURCHASE_ORDERSet as projection on S4H.ZARIBA_PURCHASE_ORDERSet {
    key Documentnumber,
    Suppliername,
    Poshiptocity,
    Poshiptocountry,
    Poshiptostate,
    Companycode,
    Disputeid,
    Status
};

type WeatherCondition: {
    description: String;
    temperature: Decimal(5, 2);
    humidity: Decimal(4, 1);
    windSpeed: Decimal(3, 1);
}

entity Weather {
    key id: Integer64;
    city: String;
    country: String;
    current: WeatherCondition
}