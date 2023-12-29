/// <summary>
/// TableExtension HistLinvta (ID 90116) extends Record Sales Invoice Line.
/// </summary>
tableextension 90116 HistLinvta extends "Sales Invoice Line"
{
    fields
    {
        field(90002; "Situación inmueble"; Code[10]) { }
        field(90003; "Referencia catastral"; Text[30]) { }
    }
}
tableextension 90120 HistLincpa extends "Purch. Inv. Line"
{
    fields
    {
        field(90002; "Situación inmueble"; Code[10]) { }
        field(90003; "Referencia catastral"; Text[30]) { }
    }
}
tableextension 90121 HistLinabcpa extends "Purch. Cr. Memo Line"
{
    fields
    {
        field(90002; "Situación inmueble"; Code[10]) { }
        field(90003; "Referencia catastral"; Text[30]) { }
    }
}