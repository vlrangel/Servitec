/// <summary>
/// TableExtension Proveedor (ID 90102) extends Record Vendor.
/// </summary>
tableextension 90102 Proveedor extends Vendor
{
    fields
    {

        field(91500; "% IRPF"; Decimal) { }
        field(91501; "Importe Retenciones"; Decimal) { }
        field(91510; "Saldo"; Decimal) { }
        field(91511; "Id Kuara"; Integer) { }
        field(91512; "Traspasado"; Boolean) { }
        field(91513; "Esperar SIIME"; Boolean) { }
        field(91514; "Tipo id. fiscal país residen."; Code[10]) { }
    }
}
