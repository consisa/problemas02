report 50200 "C2 Report Factura"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = '.\report\50200.ReportFactura.rdl';

    dataset
    {
        dataitem(SH; "Sales Header")
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


            dataitem(SL; "Sales Line")
            {
                DataItemLinkReference = SH;
                DataItemLink = "Document No." = field("No.");

                column(Amount; Amount) { }
                column(Amount_Including_VAT; "Amount Including VAT") { }
                column(VAT_Base_Amount; "VAT Base Amount") { }

                column(Unit_Price; "Unit Price") { }
                column(Description; Description) { }
                column(LineNo; "No.") { }
                column(Quantity; Quantity) { }



                dataitem(C; Customer)
                {
                    DataItemLinkReference = SH;
                    DataItemLink = "No." = field("Sell-to Customer No.");

                    column(C2TaxPayerClassification; C2TaxPayerClassification)
                    {

                    }
                    column(Name; Name) { }
                }

            }




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
                    field(dc; myInt)
                    {

                        TableRelation = "Sales Header"."No.";
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
        myInt: Code[20];

}