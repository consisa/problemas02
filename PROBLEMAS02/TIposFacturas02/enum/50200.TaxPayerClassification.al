enum 50200 "C2 TaxPayer Classfication"
{
    Extensible = true;

    value(0; empty)
    {
        Caption = '--please select--';
    }
    value(1; fcf)
    {
        Caption = 'consumidor final';
    }
    value(2; cf)
    {
        Caption = 'credito fiscal';
    }
    value(3; fex)
    {
        Caption = 'exportacion';
    }
}