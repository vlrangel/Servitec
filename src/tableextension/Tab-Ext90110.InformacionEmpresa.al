/// <summary>
/// TableExtension InformacionEmpresa (ID 90110) extends Record Company Information.
/// </summary>
tableextension 90110 InformacionEmpresa extends "Company Information"
{
    fields
    {

        field(90025; "Texto legal pie de Factura"; Text[250]) { }
        field(90026; "Texto legal pie de Factura 2"; Text[250]) { }
        field(90027; "Texto proteccion datos"; BLOB) { }
        field(90028; "Ante el notario"; Text[50]) { }
        field(90029; "No. de protocolo"; Text[30]) { }
        field(90030; "Traspasado"; Boolean) { }
        field(90000; "Titular certificado AEAT"; Text[80]) { }
        field(90001; "Carpeta temporal ficheros"; Text[30]) { }
        field(90002; "URL Facturas emitidas"; Text[100]) { }
        field(90003; "URL Suministro LR"; Text[150]) { }
        field(90004; "URL Suministro Información"; Text[150]) { }
        field(90005; "Consultar doc. antes de enviar"; Boolean) { }
        field(90010; "Descripción factura emitida"; Text[50]) { }
        field(90011; "Descripción abono emitido"; Text[50]) { }
        field(90012; "Descripción factura recibida"; Text[50]) { }
        field(90013; "Descripción abono recibido"; Text[50]) { }
        field(90014; "Ejecución cliente/servidor"; Option) { OptionMembers = Cliente,Servidor; }
        field(90015; "URL Facturas recibidas"; Text[100]) { }
        field(90016; "Certificado AEAT"; BLOB) { }
        field(90017; "Password certificado AEAT"; Text[30]) { }
        field(90018; "Activar SIIME"; Boolean) { }
        field(90019; "URL Pagos Recibidas"; Text[100]) { }
        field(90020; "URL Cobros Emitidas"; Text[100]) { }
        field(90022; "Versión SII"; Option) { OptionMembers = "V 0.7","V 1.0","V 1.1"; }
        field(90023; "URL Consulta LR"; Text[150]) { }
        field(90024; "URL Inmuebles adicionales"; Text[100]) { }
    }
}
