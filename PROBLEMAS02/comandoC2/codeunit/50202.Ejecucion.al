codeunit 50202 "C2 Ejecucion"
{
    SingleInstance = true;

    trigger OnRun()
    var
        POSGUI: Codeunit "LSC POS GUI";
    begin
        POSGUI.PosMessage('Ejecucion exitosa C2')
    end;

    var
        myInt: Integer;
}