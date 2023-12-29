/// <summary>
/// TableExtension ConfVenta (ID 90126) extends Record Sales Receivables Setup.
/// </summary>
tableextension 90126 ConfVenta extends "Sales & Receivables Setup"
{
    fields
    {
        field(90001; "Cuenta ventas por defecto"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }
}
