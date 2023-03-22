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
            column(No_; "No.") { }
            column(Description; Description) { }


            dataitem(ILE; "Item Ledger Entry")
            {
                DataItemLinkReference = Item;
                DataItemLink = "Item No." = field("No.");

                column(Quantity; Quantity) { }
                column(Item_No_; "Item No.") { }
                column(SaldoInicial; SaldoInicial) { }
                column(Location_Code; "Location Code") { }
                column(Posting_Date; "Posting Date") { }
                column(Document_No_; "Document No.") { }
                column(volumen; volumen) { }

                trigger OnPreDataItem()
                var
                    myInt: Integer;
                    xd: Record "Item Attribute Value";
                begin
                    ILE.SetFilter("Location Code", bodegaCode);
                    ILE.SetFilter("Posting Date", '<%1', fehcaInicial);
                    if ILE.FindSet() then begin
                        ILE.CalcSums(Quantity);
                        SaldoInicial := ILE.Quantity;


                    end;
                    ILE.SetFilter("Posting Date", '>=%1', fehcaInicial);
                    cantidad := ILE.Count();
                end;

            }



            trigger OnPreDataItem()
            var

            begin
                Item.Reset();
                Item.SetFilter("No.", ItemCode);



            end;

            trigger OnAfterGetRecord()
            var
                mapping: Record "Item Attribute Value Mapping";
                Attribute: Record "Item Attribute Value";
            begin
                mapping.SetFilter("Table ID", '27');
                mapping.SetFilter("No.", ItemCode);



                if Attribute.FindSet() then begin
                    Evaluate(volumen, Attribute.Value);

                end;
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
                    field(ItemCode; ItemCode)
                    {
                        ApplicationArea = All;
                        TableRelation = Item."No.";
                        NotBlank = true;
                        Caption = 'Codigo Producto';
                        trigger OnValidate()
                        var
                        begin
                            if ItemCode = '' then
                                Error('xd');
                        end;
                    }
                    field(FechaInicial; fehcaInicial)
                    {
                        ApplicationArea = All;
                        NotBlank = true;
                        Caption = 'Fecha inicial';
                    }
                    field(bodegaCode; bodegaCode)
                    {
                        ApplicationArea = All;
                        TableRelation = Location;
                        NotBlank = true;
                        Caption = 'codigo bodega';

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
        fehcaInicial := 20230130D;
        ItemCode := '1001';
        bodegaCode := 'BLUE';
    end;

    trigger OnPreReport()
    var
        myInt: Integer;
    begin
        if ItemCode = '' then
            Error('rellene todos los campos');
    end;


    var
        ItemCode: Code[20];
        SaldoInicial: Decimal;
        fehcaInicial: Date;
        bodegaCode: Code[20];
        volumen: decimal;
        cantidad: Integer;

}