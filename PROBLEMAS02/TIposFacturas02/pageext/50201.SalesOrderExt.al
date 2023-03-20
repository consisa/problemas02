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

    trigger OnModifyRecord(): Boolean
    var
        mycustomer: Record Customer;
        myenum: Enum "C2 TaxPayer Classfication";
    begin

        if Rec."Sell-to Customer No." <> '' then begin
            mycustomer.Reset();
            mycustomer.Get(Rec."Sell-to Customer No.");
            if mycustomer.C2TaxPayerClassification = myenum::cf then begin
                Rec."Posting No. Series" := 'SVCF';
            end;

            if mycustomer.C2TaxPayerClassification = myenum::fex then begin
                Rec."Posting No. Series" := 'SVFEX';
            end;
            if mycustomer.C2TaxPayerClassification = myenum::fcf then begin
                Rec."Posting No. Series" := 'SVFCF';
            end;
            if mycustomer.C2TaxPayerClassification = myenum::empty then begin
                Rec."Posting No. Series" := 'SVFCF';
            end;
            Rec.Modify();
        end;
    end;

    var
        myInt: Integer;
}