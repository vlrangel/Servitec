/// <summary>
/// TableExtension LineasCompra (ID 90109) extends Record Purchase Line.
/// </summary>
tableextension 90109 LineasCompra extends "Purchase Line"
{
    fields
    {
        field(91500; "Linea Retencion"; Boolean) { }
        field(91501; "Sujeto IRPF"; Boolean) { }
        field(91502; "Situación inmueble"; Code[10]) { }
        field(91503; "Referencia catastral"; Text[30]) { }
    }
}
