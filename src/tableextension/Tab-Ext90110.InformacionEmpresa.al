/// <summary>
/// TableExtension InformacionEmpresa (ID 90110) extends Record Company Information.
/// </summary>
tableextension 90110 InformacionEmpresa extends "Company Information"
{
    fields
    {

        field(91525; "Texto legal pie de Factura"; Text[250]) { }
        field(91526; "Texto legal pie de Factura 2"; Text[250]) { }
        field(91527; "Texto proteccion datos"; BLOB) { }
        field(91528; "Ante el notario"; Text[50]) { }
        field(91529; "No. de protocolo"; Text[30]) { }
        field(91530; "Traspasado"; Boolean) { }
        field(91500; "Titular certificado AEAT"; Text[80]) { }
        field(91501; "Carpeta temporal ficheros"; Text[30]) { }
        field(91502; "URL Facturas emitidas"; Text[100]) { }
        field(91503; "URL Suministro LR"; Text[150]) { }
        field(91504; "URL Suministro Información"; Text[150]) { }
        field(91505; "Consultar doc. antes de enviar"; Boolean) { }
        field(91510; "Descripción factura emitida"; Text[50]) { }
        field(91511; "Descripción abono emitido"; Text[50]) { }
        field(91512; "Descripción factura recibida"; Text[50]) { }
        field(91513; "Descripción abono recibido"; Text[50]) { }
        field(91514; "Ejecución cliente/servidor"; Option) { OptionMembers = Cliente,Servidor; }
        field(91515; "URL Facturas recibidas"; Text[100]) { }
        field(91516; "Certificado AEAT"; BLOB) { }
        field(91517; "Password certificado AEAT"; Text[30]) { }
        field(91518; "Activar SIIME"; Boolean) { }
        field(91519; "URL Pagos Recibidas"; Text[100]) { }
        field(91520; "URL Cobros Emitidas"; Text[100]) { }
        field(91522; "Versión SII"; Option) { OptionMembers = "V 0.7","V 1.0","V 1.1"; }
        field(91523; "URL Consulta LR"; Text[150]) { }
        field(91524; "URL Inmuebles adicionales"; Text[100]) { }
        field(91531; "Url Pdf_Old"; Text[250])
        {
            Caption = 'Url Pdf';
            DataClassification = CustomerContent;
        }
    }
}
