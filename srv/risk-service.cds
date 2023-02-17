using {
    riskmanagement as rm
}
from '../db/schema';

@path: 'service/risk'
service RiskService {

    entity Risks as
    projection on rm.Risks;

    @odata.draft.enabled
    entity Mitigations as
    projection on rm.Mitigations;
}