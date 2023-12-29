/// <summary>
/// TableExtension MovContab (ID 90100) extends Record G/L Entry.
/// </summary>
tableextension 90100 MovContab extends "G/L Entry"
{
    fields
    {
        field(90000; "Sujeto IRPF"; Boolean)
        {
            ObsoleteState = Removed;
            Caption = 'Sujeto IRPF';
            DataClassification = ToBeClassified;
        }
        field(90001; "Saldo Servitec"; Decimal)
        {
            ObsoleteState = Removed;
            Caption = 'Saldo Servitec';
            DataClassification = ToBeClassified;
        }
    }
}
tableextension 90200 Contab extends "G/L Account"
{
    fields
    {
        field(90000; "Sujeto IRPF"; Boolean)
        {
            Caption = 'Sujeto IRPF';
            DataClassification = ToBeClassified;
        }
        field(90001; "Saldo Servitec"; Decimal)
        {
            Caption = 'Saldo Servitec';
            DataClassification = ToBeClassified;
        }
    }
}