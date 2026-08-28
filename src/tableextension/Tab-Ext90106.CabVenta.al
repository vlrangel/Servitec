/// <summary>
/// TableExtension CabVenta (ID 90106) extends Record Sales Header.
/// </summary>
tableextension 90106 CabVenta extends "Sales Header"
{
    fields
    {
        field(91523; "% IRPF"; Decimal) { }
        field(91500; "Clave tipo factura	"; Code[10]) { }
        field(91501; "Clave tipo factura rectific."; Code[10]) { }
        field(91502; "Descripción de la operación"; Text[100]) { }
        field(91503; "Fecha operación"; Date) { }
        field(91504; "Clave régimen esp. op. trans."; Code[10]) { }
        field(91505; "Esperar SIIME"; Boolean) { }
        field(91506; "Ventas o servicios"; Code[10]) { }
        field(91507; "Tipo factura rectificativa"; Code[10]) { }
        field(91508; "Tipo no exención"; Code[10]) { }
        field(91509; "Causa exención"; Code[10]) { }
        field(91510; "Tipo id. fiscal país residen."; Code[10]) { }
        field(91511; "Clave rég. esp. op. trans. ad1"; Code[10]) { }
        field(91512; "Clave rég. esp. op. trans. ad2"; Code[10]) { }
        field(91513; "Emitida por terceros"; Boolean) { }
        field(91514; "Ticket Inicial"; Code[20]) { }
        field(91515; "Ticket Final"; Code[20]) { }
        field(91516; "Factura sin identif. destinata"; Boolean) { }
        field(91517; "Fact. disp. adic. terc. y sext"; Boolean) { }
        field(91518; "Factura simplificada"; Boolean) { }
        field(91519; "Referencia Externa"; Text[250]) { }
        field(91520; "Entidad sucedida"; Text[50]) { }
        field(91521; "NIF Entidad sucedida"; Text[20]) { }
        field(91522; "Reg. Previo GGEE o REDEME"; Boolean) { }
    }
}
