pageextension 50200 "C2 Customer Ext" extends "Customer Card"
{
    layout
    {
        // Add changes to page layout here
        addlast(General)
        {
            field(C2TaxPayerClassification; Rec.C2TaxPayerClassification)
            {
                ApplicationArea = All;

            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    trigger OnOpenPage()
    var
        cu: Record Customer;
        myenum: enum "C2 TaxPayer Classfication";
    begin


    end;

    var
        myInt: Integer;
}