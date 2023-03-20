codeunit 50200 "C2 Change Serie No"
{
    trigger OnRun()
    begin

    end;
    /*
        [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnBeforePostInvoice', '', true, true)]
        local procedure MyOnBeforePostInvoice(
            CommitIsSuppressed: Boolean;
            PreviewMode: Boolean;
            var CustLedgerEntry: Record "Cust. Ledger Entry";
            var GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line";
            var IsHandled: Boolean;
            var SalesHeader: Record "Sales Header"
        )
        var
            mycustomer: Record Customer;
            myenum: Enum "C2 TaxPayer Classfication";
        begin
            mycustomer.Reset();
            mycustomer.Get(SalesHeader."Sell-to Customer No.");

            if mycustomer.C2TaxPayerClassification = myenum::cf then begin

                SalesHeader."Posting No. Series" := 'SVCF';
                SalesHeader.Modify();
                Message(SalesHeader."Posting No. Series");
            end;

            if mycustomer.C2TaxPayerClassification = myenum::fex then begin
                SalesHeader."Posting No. Series" := 'SVFEX';
                SalesHeader.Modify();
            end
            else begin
                SalesHeader."Posting No. Series" := 'SVFCF';
                SalesHeader.Modify();
            end;


        end;
    */
    var
        myInt: Integer;
}