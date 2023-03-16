pageextension 50201 "C2 Sales Order Ext" extends "Sales Order"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
    }

    trigger OnOpenPage()
    var
        cust: Record Customer;
        myenum: Enum "C2 TaxPayer Classfication";
    begin

        /* cust.Get(Rec."Sell-to Customer No.");
         if cust.C2TaxPayerClassification = myenum::fex then begin

             Message('%1', cust.C2TaxPayerClassification);
         end;*/
    end;


    var
        myInt: Integer;


}