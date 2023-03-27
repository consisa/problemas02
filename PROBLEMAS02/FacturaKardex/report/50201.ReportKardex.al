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
                begin
                    ILE.SetFilter("Location Code", bodegaCode);
                    ILE.SetFilter("Posting Date", '<%1', fehcaInicial);
                    if ILE.FindSet() then begin
                        ILE.CalcSums(Quantity);
                        SaldoInicial := ILE.Quantity;


                    end;
                    ILE.SetFilter("Posting Date", '>=%1', fehcaInicial);
                    if ILE.FindSet() then begin
                        ILE.CalcSums(Quantity);
                        cantidad := ILE.Quantity;
                        volumen := cantidad * width * depth * height;
                    end;


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
                mapping.Reset();
                mapping.SetRange("Table ID", 27);
                mapping.SetRange("No.", ItemCode);
                mapping.SetRange("Item Attribute ID", 2);
                if mapping.FindFirst() then begin
                    Attribute.Reset();
                    Attribute.SetRange("Attribute ID", 2);
                    Attribute.SetRange(ID, mapping."Item Attribute Value ID");
                    if Attribute.FindFirst() then begin
                        depth := Attribute."Numeric Value";
                    end;

                end;
                mapping.Reset();
                mapping.SetRange("Table ID", 27);
                mapping.SetRange("No.", ItemCode);
                mapping.SetRange("Item Attribute ID", 3);
                if mapping.FindFirst() then begin
                    Attribute.Reset();
                    Attribute.SetRange("Attribute ID", 3);
                    Attribute.SetRange(ID, mapping."Item Attribute Value ID");
                    if Attribute.FindFirst() then begin
                        height := Attribute."Numeric Value";
                    end;

                end;
                mapping.Reset();
                mapping.SetRange("Table ID", 27);
                mapping.SetRange("No.", ItemCode);
                mapping.SetRange("Item Attribute ID", 4);
                if mapping.FindFirst() then begin
                    Attribute.Reset();
                    Attribute.SetRange("Attribute ID", 4);
                    Attribute.SetRange(ID, mapping."Item Attribute Value ID");
                    if Attribute.FindFirst() then begin
                        width := Attribute."Numeric Value";
                    end;

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
                                Error('error');
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
        volumen: Decimal;
        cantidad: Decimal;
        width: Decimal;
        height: Decimal;
        depth: Decimal;


}