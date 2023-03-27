codeunit 50201 "C2 COMMAND"
{
    Subtype = Install;

    trigger OnInstallAppPerCompany()
    var
        addcommand: Codeunit "LSC POS Command Registration";
        ParameterType: Enum "LSC POS Command Parameter Type";
    begin
        addcommand.RegisterModule('LS Modulo C2', 'Modulo C2', Codeunit::"C2 Ejecucion");
        addcommand.RegisterExtCommand('C2COMMAND', 'comando perzonalizado c2', Codeunit::"C2 Ejecucion", ParameterType::" ", 'LS Modulo C2', false);
    end;


    var
        myInt: Integer;
}