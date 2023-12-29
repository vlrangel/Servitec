/// <summary>
/// TableExtension CabVenta (ID 90106) extends Record Sales Header.
/// </summary>
tableextension 90106 CabVenta extends "Sales Header"
{
    fields
    {
        field(90023; "% IRPF"; Decimal) { }
        field(90000; "Clave tipo factura	"; Code[10]) { }
        field(90001; "Clave tipo factura rectific."; Code[10]) { }
        field(90002; "Descripción de la operación"; Text[100]) { }
        field(90003; "Fecha operación"; Date) { }
        field(90004; "Clave régimen esp. op. trans."; Code[10]) { }
        field(90005; "Esperar SIIME"; Boolean) { }
        field(90006; "Ventas o servicios"; Code[10]) { }
        field(90007; "Tipo factura rectificativa"; Code[10]) { }
        field(90008; "Tipo no exención"; Code[10]) { }
        field(90009; "Causa exención"; Code[10]) { }
        field(90010; "Tipo id. fiscal país residen."; Code[10]) { }
        field(90011; "Clave rég. esp. op. trans. ad1"; Code[10]) { }
        field(90012; "Clave rég. esp. op. trans. ad2"; Code[10]) { }
        field(90013; "Emitida por terceros"; Boolean) { }
        field(90014; "Ticket Inicial"; Code[20]) { }
        field(90015; "Ticket Final"; Code[20]) { }
        field(90016; "Factura sin identif. destinata"; Boolean) { }
        field(90017; "Fact. disp. adic. terc. y sext"; Boolean) { }
        field(90018; "Factura simplificada"; Boolean) { }
        field(90019; "Referencia Externa"; Text[250]) { }
        field(90020; "Entidad sucedida"; Text[50]) { }
        field(90021; "NIF Entidad sucedida"; Text[20]) { }
        field(90022; "Reg. Previo GGEE o REDEME"; Boolean) { }
    }
}
