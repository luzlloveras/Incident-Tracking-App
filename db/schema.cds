namespace incidentReporting;

entity Customers {
  key ID: UUID;
  customerId: String(50) @assert.unique @mandatory;
  customerName: String(50);
  Incidents: Association to many Incidents on Incidents.Customer = $self;
}

entity Incidents {
  key ID: UUID;
  incidentId: String(50) @assert.unique @mandatory;
  incidentDescription: String;
  Customer: Association to Customers;
  Replacements: Association to many Replacements on Replacements.Incident = $self;
}

entity Replacements {
  key ID: UUID;
  replacementId: String(50) @assert.unique @mandatory;
  Incident: Association to Incidents;
  Product: Association to Products;
}

entity Products {
  key ID: UUID;
  productId: String(50) @assert.unique @mandatory;
  productName: String(50);
}
