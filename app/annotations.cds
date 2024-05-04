using { incidentReportingSrv } from '../srv/service.cds';

annotate incidentReportingSrv.Customers with @UI.DataPoint #customerName: {
  Value: customerName,
  Title: 'Customer Name',
};
annotate incidentReportingSrv.Customers with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#customerName', ID: 'CustomerName' }
];
annotate incidentReportingSrv.Customers with @UI.HeaderInfo: {
  TypeName: 'Customer',
  TypeNamePlural: 'Customers',
  Title: { Value: customerId }
};
annotate incidentReportingSrv.Customers with {
  ID @UI.Hidden
};
annotate incidentReportingSrv.Customers with @UI.Identification: [{ Value: customerId }];
annotate incidentReportingSrv.Customers with {
  customerId @Common.Label: 'Customer Id';
  customerName @Common.Label: 'Customer Name';
  Incidents @Common.Label: 'Incidents'
};
annotate incidentReportingSrv.Customers with {
  ID @Common.Text: { $value: customerId, ![@UI.TextArrangement]: #TextOnly };
};
annotate incidentReportingSrv.Customers with @UI.SelectionFields: [
  customerId
];
annotate incidentReportingSrv.Customers with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: ID },
    { $Type: 'UI.DataField', Value: customerId },
    { $Type: 'UI.DataField', Value: customerName }
];
annotate incidentReportingSrv.Customers with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: ID },
    { $Type: 'UI.DataField', Value: customerId },
    { $Type: 'UI.DataField', Value: customerName }
]};
annotate incidentReportingSrv.Customers with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];
annotate incidentReportingSrv.Incidents with {
  Customer @Common.ValueList: {
    CollectionPath: 'Customers',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: Customer_ID,
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'customerId'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'customerName'
      },
    ],
  }
};
annotate incidentReportingSrv.Incidents with @UI.DataPoint #incidentDescription: {
  Value: incidentDescription,
  Title: 'Incident Description',
};
annotate incidentReportingSrv.Incidents with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#incidentDescription', ID: 'IncidentDescription' }
];
annotate incidentReportingSrv.Incidents with @UI.HeaderInfo: {
  TypeName: 'Incident',
  TypeNamePlural: 'Incidents',
  Title: { Value: incidentId }
};
annotate incidentReportingSrv.Incidents with {
  ID @UI.Hidden
};
annotate incidentReportingSrv.Incidents with @UI.Identification: [{ Value: incidentId }];
annotate incidentReportingSrv.Incidents with {
  incidentId @Common.Label: 'Incident Id';
  incidentDescription @Common.Label: 'Incident Description';
  Customer @Common.Label: 'Customer';
  Replacements @Common.Label: 'Replacements'
};
annotate incidentReportingSrv.Incidents with {
  ID @Common.Text: { $value: incidentId, ![@UI.TextArrangement]: #TextOnly };
  Customer @Common.Text: { $value: Customer.customerId, ![@UI.TextArrangement]: #TextOnly };
};
annotate incidentReportingSrv.Incidents with @UI.SelectionFields: [
  Customer_ID
];
annotate incidentReportingSrv.Incidents with @UI.LineItem : [
    { $Type: 'UI.DataField', Value: incidentId },
    { $Type: 'UI.DataField', Value: incidentDescription },
    { $Type: 'UI.DataField', Value: Customer.customerId },
    { $Type: 'UI.DataField', Value: Customer.customerName }
];
annotate incidentReportingSrv.Incidents with @UI.FieldGroup #incidentDetails: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: incidentId },
    { $Type: 'UI.DataField', Value: incidentDescription }

  ]
};


annotate incidentReportingSrv.Incidents with @UI.FieldGroup #customerDetails: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: Customer.customerId },
    { $Type: 'UI.DataField', Value: Customer.customerName }

  ]
};


annotate incidentReportingSrv.Replacements with @UI.LineItem #replacements: [
    { $Type: 'UI.DataField', Value: replacementId }

  ];


annotate incidentReportingSrv.Incidents with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'incidentDetails', Label: 'Incident Details', Target: '@UI.FieldGroup#incidentDetails' },
  { $Type: 'UI.ReferenceFacet', ID: 'customerDetails', Label: 'Customer Details', Target: '@UI.FieldGroup#customerDetails' },
  { $Type: 'UI.ReferenceFacet', ID: 'replacements', Label: 'Replacements', Target: 'Replacements/@UI.LineItem#replacements' }
];
annotate incidentReportingSrv.Replacements with {
  Incident @Common.ValueList: {
    CollectionPath: 'Incidents',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: Incident_ID,
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'incidentId'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'incidentDescription'
      },
    ],
  }
};
annotate incidentReportingSrv.Replacements with {
  Product @Common.ValueList: {
    CollectionPath: 'Products',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: Product_ID,
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'productId'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'productName'
      },
    ],
  }
};
annotate incidentReportingSrv.Replacements with @UI.HeaderInfo: {
  TypeName: 'Replacement',
  TypeNamePlural: 'Replacements',
  Title: { Value: replacementId }
};
annotate incidentReportingSrv.Replacements with {
  ID @UI.Hidden
};
annotate incidentReportingSrv.Replacements with @UI.Identification: [{ Value: replacementId }];
annotate incidentReportingSrv.Replacements with {
  replacementId @Common.Label: 'Replacement Id';
  Incident @Common.Label: 'Incident';
  Product @Common.Label: 'Product'
};
annotate incidentReportingSrv.Replacements with {
  ID @Common.Text: { $value: replacementId, ![@UI.TextArrangement]: #TextOnly };
  Incident @Common.Text: { $value: Incident.incidentId, ![@UI.TextArrangement]: #TextOnly };
  Product @Common.Text: { $value: Product.productId, ![@UI.TextArrangement]: #TextOnly };
};
annotate incidentReportingSrv.Replacements with @UI.SelectionFields: [
  Incident_ID,
  Product_ID
];
annotate incidentReportingSrv.Replacements with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: ID },
    { $Type: 'UI.DataField', Value: replacementId },
    { $Type: 'UI.DataField', Label: 'Incident', Value: Incident_ID },
    { $Type: 'UI.DataField', Label: 'Product', Value: Product_ID }
];
annotate incidentReportingSrv.Replacements with @UI.FieldGroup #replacementDetails: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: replacementId }

  ]
};


annotate incidentReportingSrv.Replacements with @UI.FieldGroup #incidentDetails: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: Incident.incidentId },
    { $Type: 'UI.DataField', Value: Incident.incidentDescription }

  ]
};


annotate incidentReportingSrv.Replacements with @UI.FieldGroup #productDetails: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: Product.productId },
    { $Type: 'UI.DataField', Value: Product.productName }

  ]
};


annotate incidentReportingSrv.Replacements with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'replacementDetails', Label: 'Replacement Details', Target: '@UI.FieldGroup#replacementDetails' },
  { $Type: 'UI.ReferenceFacet', ID: 'incidentDetails', Label: 'Incident Details', Target: '@UI.FieldGroup#incidentDetails' },
  { $Type: 'UI.ReferenceFacet', ID: 'productDetails', Label: 'Product Details', Target: '@UI.FieldGroup#productDetails' }
];
annotate incidentReportingSrv.Products with @UI.DataPoint #productName: {
  Value: productName,
  Title: 'Product Name',
};
annotate incidentReportingSrv.Products with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#productName', ID: 'ProductName' }
];
annotate incidentReportingSrv.Products with @UI.HeaderInfo: {
  TypeName: 'Product',
  TypeNamePlural: 'Products',
  Title: { Value: productId }
};
annotate incidentReportingSrv.Products with {
  ID @UI.Hidden
};
annotate incidentReportingSrv.Products with @UI.Identification: [{ Value: productId }];
annotate incidentReportingSrv.Products with {
  productId @Common.Label: 'Product Id';
  productName @Common.Label: 'Product Name'
};
annotate incidentReportingSrv.Products with {
  ID @Common.Text: { $value: productId, ![@UI.TextArrangement]: #TextOnly };
};
annotate incidentReportingSrv.Products with @UI.SelectionFields: [
  productId
];
annotate incidentReportingSrv.Products with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: ID },
    { $Type: 'UI.DataField', Value: productId },
    { $Type: 'UI.DataField', Value: productName }
];
annotate incidentReportingSrv.Products with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: ID },
    { $Type: 'UI.DataField', Value: productId },
    { $Type: 'UI.DataField', Value: productName }
]};
annotate incidentReportingSrv.Products with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];