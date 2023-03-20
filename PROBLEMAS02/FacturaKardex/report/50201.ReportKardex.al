report 50201 "C2 Report Kardex"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = '.\report\50201.ReportFactura.rdl';

    dataset
    {
        dataitem(Item; Item)
        {
            column(No_; "No.")
            {

            }


            dataitem(ILE; "Item Ledger Entry")
            {
                DataItemLinkReference = Item;
                DataItemLink = "Item No." = field("No.");

                column(Quantity; Quantity) { }
                column(Item_No_; "Item No.") { }
                column(SaldoInicial; SaldoInicial) { }
                column(Location_Code; "Location Code") { }

                trigger OnPreDataItem()
                var
                    myInt: Integer;
                begin
                    ILE.Reset();
                    ILE.SetFilter("Location Code", 'RED');
                    ILE.FindSet();
                end;

            }



            trigger OnPreDataItem()
            var

            begin
                Item.Reset();
                Item.SetFilter("No.", '1000');


            end;

            trigger OnAfterGetRecord()
            var
                ILE: Record "Item Ledger Entry";
            begin
                /* ILE.Reset();
                 //ILE.SetFilter("Item No.", '1001');
                 // ILE.SetFilter("Posting Date", '<%1', 20230130D);
                 ILE.SetFilter("Location Code", 'RED');

                 if ILE.FindSet() then begin

                     ILE.CalcSums(Quantity);
                     SaldoInicial := ILE.Quantity;

                 end;*/
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
                    field(Name; myInt)
                    {
                        ApplicationArea = All;

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



    var
        myInt: Integer;
        SaldoInicial: Decimal;
}