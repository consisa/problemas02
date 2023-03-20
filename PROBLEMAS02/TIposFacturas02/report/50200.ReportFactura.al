report 50200 "C2 Report Factura"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = '.\report\50200.ReportFactura.rdl';

    dataset
    {
        dataitem(SIH; "Sales Invoice Header")
        {

            column(Sell_to_Customer_Name; "Sell-to Customer Name") { }
            column(Sell_to_Customer_No_; "Sell-to Customer No.") { }
            column(Bill_to_Address; "Bill-to Address") { }
            column(Bill_to_City; "Bill-to City") { }
            column(Bill_to_County; "Bill-to County") { }
            column(No_; "No.") { }
            column(Salesperson_Code; "Salesperson Code") { }
            column(Order_Date; "Order Date") { }
            column(Sell_to_Phone_No_; "Sell-to Phone No.") { }
            column(No__Series; "No. Series") { }
            column(salesperson; salesperson) { }
            column(Amount_Including_VAT; "Amount Including VAT") { }




            dataitem(SIL; "Sales Invoice Line")
            {
                DataItemLinkReference = SIH;
                DataItemLink = "Document No." = field("No.");

                column(Amount; Amount) { }
                column(VAT_Base_Amount; "VAT Base Amount") { }
                column(Unit_Price; "Unit Price") { }
                column(Description; Description) { }
                column(LineNo; "No.") { }
                column(Quantity; Quantity) { }




                dataitem(C; Customer)
                {
                    DataItemLinkReference = SIH;
                    DataItemLink = "No." = field("Sell-to Customer No.");

                    column(C2TaxPayerClassification; C2TaxPayerClassification) { }
                    column(Name; Name) { }


                }

            }

            trigger OnAfterGetRecord()
            var
                SP: Record "Salesperson/Purchaser";
            begin
                sp.Reset();
                if (SP.Get("Salesperson Code")) then
                    salesperson := SP.Name else
                    salesperson := '***';

            end;

            trigger OnPreDataItem()
            begin
                SIH.Reset();
                SIH.SetFilter("No.", mycode);
            end;

        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                    field(mycode; mycode)
                    {
                        ApplicationArea = All;
                        Caption = 'Codigo Factura';
                        TableRelation = "Sales Invoice Header"."No.";
                    }
                }


            }


        }

        actions
        {
            area(processing)
            {
                action(ActionName)
                {
                    ApplicationArea = All;

                }
            }
        }
    }

    trigger OnInitReport()
    var

    begin

    end;

    var
        salesperson: Text[50];
        mycode: Code[20];

}