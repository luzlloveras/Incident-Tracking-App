using { incidentReporting } from '../db/schema.cds';

service incidentReportingSrv {
  @odata.draft.enabled
  entity Customers as projection on incidentReporting.Customers;
  @odata.draft.enabled
  entity Incidents as projection on incidentReporting.Incidents;
  @odata.draft.enabled
  entity Replacements as projection on incidentReporting.Replacements;
  @odata.draft.enabled
  entity Products as projection on incidentReporting.Products;
}