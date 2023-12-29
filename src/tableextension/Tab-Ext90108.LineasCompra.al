/// <summary>
/// TableExtension LineasCompra (ID 90109) extends Record Purchase Line.
/// </summary>
tableextension 90109 LineasCompra extends "Purchase Line"
{
    fields
    {
        field(90000; "Linea Retencion"; Boolean) { }
        field(90001; "Sujeto IRPF"; Boolean) { }
        field(90002; "Situación inmueble"; Code[10]) { }
        field(90003; "Referencia catastral"; Text[30]) { }
    }
}
