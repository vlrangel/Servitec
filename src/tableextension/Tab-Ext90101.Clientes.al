/// <summary>
/// TableExtension Clientes (ID 90101) extends Record Customer.
/// </summary>
tableextension 90101 Clientes extends Customer
{
    fields
    {
        //  field(90000; "Show in Work Reports"; Boolean) { }
        field(90010; "Saldo"; Decimal) { }
        field(90011; "Id Kuara"; Integer) { }
        field(90012; "Traspasado"; Boolean) { }
        field(90013; "Esperar SIIME"; Boolean) { }
        field(90014; "Tipo id. fiscal país residen."; Code[10]) { }
    }
}
