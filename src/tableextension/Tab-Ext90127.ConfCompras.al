/// <summary>
/// TableExtension ConfCompras (ID 90127) extends Record Purchases  Payables Setup.
/// </summary>
tableextension 90127 ConfCompras extends "Purchases & Payables Setup"
{
    fields
    {
        field(91500; "Simplified Invoice Nos."; Code[10])
        {
            DataClassification = ToBeClassified;
        }
    }
}
