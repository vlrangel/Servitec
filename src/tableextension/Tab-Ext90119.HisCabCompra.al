/// <summary>
/// TableExtension HisCabCompra (ID 90119) extends Record Purch. Inv. Header.
/// </summary>
tableextension 90119 HisCabCompra extends "Purch. Inv. Header"
{
    fields
    {
        field(90210; "Reportado SII"; Boolean) { }
        field(90211; "OID"; Integer) { }
        field(90000; "Clave tipo factura"; Code[10]) { }
        field(90001; "Clave tipo factura rectific."; Code[10]) { }
        field(90002; "Descripción de la operación"; Text[100]) { }
        field(90003; "Fecha operación"; Date) { }
        field(90004; "Clave régimen esp. op. trans."; Code[10]) { }
        field(90005; "Esperar SIIME"; Boolean) { }
        field(90007; "Tipo factura rectificativa"; Code[10]) { }
        field(90008; "Tipo no exención"; Code[10]) { }
        field(90009; "Causa exención"; Code[10]) { }
        field(90010; "Tipo id. fiscal país residen."; Code[10]) { }
        field(90011; "Clave rég. esp. op. trans. ad1"; Code[10]) { }
        field(90012; "Clave rég. esp. op. trans. ad2"; Code[10]) { }
        field(90013; "Referencia Externa"; Text[250]) { }
        field(90014; "Entidad sucedida"; Text[50]) { }
        field(90015; "NIF Entidad sucedida"; Text[20]) { }
        field(90016; "Reg. Previo GGEE o REDEME"; Boolean) { }
        field(90100; "CSV AEAT"; Text[100]) { }
        field(90101; "Código error AEAT"; Text[30]) { }
        field(90102; "Descripción error AEAT"; Text[250]) { }
        field(90103; "Estado AEAT"; Text[30]) { }
        field(90104; "Fecha envío AEAT"; Date) { }
        field(90105; "Hora envío AEAT"; Time) { }
        field(90106; "Estado cuadre AEAT"; Code[10]) { }
    }
}
/// <summary>
/// TableExtension HisCabCompra (ID 90119) extends Record Purch. Inv. Header.
/// </summary>
tableextension 90122 HisCababoCompra extends "Purch. Cr. Memo Hdr."
{
    fields
    {
        field(90210; "Reportado SII"; Boolean) { }
        field(90211; "OID"; Integer) { }
        field(90000; "Clave tipo factura"; Code[10]) { }
        field(90001; "Clave tipo factura rectific."; Code[10]) { }
        field(90002; "Descripción de la operación"; Text[100]) { }
        field(90003; "Fecha operación"; Date) { }
        field(90004; "Clave régimen esp. op. trans."; Code[10]) { }
        field(90005; "Esperar SIIME"; Boolean) { }
        field(90007; "Tipo factura rectificativa"; Code[10]) { }
        field(90008; "Tipo no exención"; Code[10]) { }
        field(90009; "Causa exención"; Code[10]) { }
        field(90010; "Tipo id. fiscal país residen."; Code[10]) { }
        field(90011; "Clave rég. esp. op. trans. ad1"; Code[10]) { }
        field(90012; "Clave rég. esp. op. trans. ad2"; Code[10]) { }
        field(90013; "Referencia Externa"; Text[250]) { }
        field(90014; "Entidad sucedida"; Text[50]) { }
        field(90015; "NIF Entidad sucedida"; Text[20]) { }
        field(90016; "Reg. Previo GGEE o REDEME"; Boolean) { }
        field(90100; "CSV AEAT"; Text[100]) { }
        field(90101; "Código error AEAT"; Text[30]) { }
        field(90102; "Descripción error AEAT"; Text[250]) { }
        field(90103; "Estado AEAT"; Text[30]) { }
        field(90104; "Fecha envío AEAT"; Date) { }
        field(90105; "Hora envío AEAT"; Time) { }
        field(90106; "Estado cuadre AEAT"; Code[10]) { }
    }
}
