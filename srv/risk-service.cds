using {
    riskmanagement as rm
}
from '../db/schema';

@path: 'service/risk'
service RiskService {

    @odata.draft.enabled
    entity Risks as
    projection on rm.Risks;

    @odata.draft.enabled
    entity Mitigations as
    projection on rm.Mitigations;

    @readonly entity BusinessPartners as projection on rm.BusinessPartners;

    @readonly
    entity CurrentWeather as projection on rm.Weather;
}