/// <summary>
/// TableExtension Proveedor (ID 90102) extends Record Vendor.
/// </summary>
tableextension 90102 Proveedor extends Vendor
{
    fields
    {

        field(90000; "% IRPF"; Decimal) { }
        field(90001; "Importe Retenciones"; Decimal) { }
        field(90010; "Saldo"; Decimal) { }
        field(90011; "Id Kuara"; Integer) { }
        field(90012; "Traspasado"; Boolean) { }
        field(90013; "Esperar SIIME"; Boolean) { }
        field(90014; "Tipo id. fiscal país residen."; Code[10]) { }
    }
}
