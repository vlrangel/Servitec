/// <summary>
/// TableExtension Clientes (ID 90101) extends Record Customer.
/// </summary>
tableextension 90101 Clientes extends Customer
{
    fields
    {
        //  field(91500; "Show in Work Reports"; Boolean) { }
        field(91510; "Saldo"; Decimal) { }
        field(91511; "Id Kuara"; Integer) { }
        field(91512; "Traspasado"; Boolean) { }
        field(91513; "Esperar SIIME"; Boolean) { }
        field(91514; "Tipo id. fiscal país residen."; Code[10]) { }
    }
}
