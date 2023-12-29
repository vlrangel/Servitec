/// <summary>
/// TableExtension Banco (ID 90124) extends Record Bank Account.
/// </summary>
tableextension 90124 Banco extends "Bank Account"
{
    fields
    {
        field(90000; Saldo; Decimal)
        {
            Caption = 'Saldo';
            DataClassification = ToBeClassified;
        }
    }
}
