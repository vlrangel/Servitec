/// <summary>
/// TableExtension MovContab (ID 90100) extends Record G/L Entry.
/// </summary>
tableextension 90100 MovContab extends "G/L Entry"
{
    fields
    {
        field(91500; "Sujeto IRPF"; Boolean)
        {
            ObsoleteState = Removed;
            Caption = 'Sujeto IRPF';
            DataClassification = ToBeClassified;
        }
        field(91501; "Saldo Servitec"; Decimal)
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
        field(91500; "Sujeto IRPF"; Boolean)
        {
            Caption = 'Sujeto IRPF';
            DataClassification = ToBeClassified;
        }
        field(91501; "Saldo Servitec"; Decimal)
        {
            Caption = 'Saldo Servitec';
            DataClassification = ToBeClassified;
        }
    }
}