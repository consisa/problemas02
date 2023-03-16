tableextension 50201 "C2 Sales Header Ext" extends "Sales Header"
{
    trigger OnBeforeInsert()
    var
        mysrs: Record "Sales & Receivables Setup";
        customer: Record Customer;
        myenum: enum "C2 TaxPayer Classfication";
    begin


    end;

}