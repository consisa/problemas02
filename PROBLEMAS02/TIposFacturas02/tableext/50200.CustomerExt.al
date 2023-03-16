tableextension 50200 "C2 Customer Ext" extends Customer
{
    fields
    {
        // Add changes to table fields here
        field(50200; C2TaxPayerClassification; Enum "C2 TaxPayer Classfication")
        {
            Caption = 'C2 TaxPayer Classification';
        }
    }

    var
        myInt: Integer;
}