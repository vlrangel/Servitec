/// <summary>
/// XmlPort Import BLOB (ID 50331).
/// </summary>
xmlport 50331 "Import BLOB"
{
    Caption = 'Import blob text to Item Card';
    Direction = Import;
    Format = Xml;
    Encoding = UTF8;
    schema
    {
        textelement(Root)
        {
            tableelement(WebEPWorkReport; "WebEP Work Report")
            {
                XmlName = 'Item';
                AutoUpdate = true;
                AutoSave = true;
                fieldelement(id; WebEPWorkReport.Id)
                {
                    XmlName = 'No';
                }


                textelement(BigTextExtDesc)
                {

                }
                textelement(BigTextExtDesc2)
                {

                }
                textelement(BigTextExtDesc3)
                {

                }

                trigger OnBeforeInsertRecord()
                begin
                    //No se crean productos sólo se actualiza "MayBe-Extended Description" y sólo si el campo importado tiene texto
                    BigTextExtDesc := BigTextExtDesc;
                    BigTextExtDesc2 := BigTextExtDesc2;
                    BigTextExtDesc3 := BigTextExtDesc3;
                end;

                trigger OnAfterInsertRecord()
                begin
                    //No se crean productos sólo se actualiza "MayBe-Extended Description" y sólo si el campo importado tiene texto
                    BigTextExtDesc := BigTextExtDesc;
                    BigTextExtDesc3 := BigTextExtDesc3;
                end;

                trigger OnBeforeModifyRecord()
                var
                    R_WebEPWorkReport: Record "WebEP Work Report";
                    OutStr: OutStream;
                begin
                    //Sólo se actualiza "MayBe-Extended Description" si el campo importado tiene texto
                    if (BigTextExtDesc = '') and (BigTextExtDesc2 = '') and (BigTextExtDesc3 = '') then
                        currXMLport.Skip();

                    if not R_WebEPWorkReport.Get(WebEPWorkReport.Id) then
                        currXMLport.Skip();

                    IF (BigTextExtDesc = '') then begin
                        currXMLport.Skip();
                    END ELSE begin
                        WebEPWorkReport.TLB.CreateOutStream(OutStr, TextEncoding::Windows);
                        OutStr.WriteText(BigTextExtDesc);
                    end;

                    /*
                    MoepWorkReports.CalcFields(TBL);
                    MoepWorkReports.TBL.CreateOutStream(Outstr);
                    CBase64.FromBase64(BigTextExtDesc2+BigTextExtDesc3, Outstr);
                    */


                    IF (BigTextExtDesc2 = '') then begin
                        currXMLport.Skip();
                    END ELSE begin
                        WR := BigTextExtDesc2 + BigTextExtDesc3;
                        if x.ReadFrom(WR) then

                            //CBase64.FromBase64(wr, Outstr);
                            WebEPWorkReport."Work Report".CreateOutStream(OutStr, TextEncoding::Windows);
                        OutStr.WriteText(WR);

                    end;
                end;

            }
        }
    }

    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {

                }
            }
        }

        actions
        {
            area(processing)
            {
                // action(ActionName)
                // {

                // }
            }
        }
    }

    var
        myInt: Integer;
        supertexto: BigText;
        x: JsonObject;
        CBase64: Codeunit "Base64 Convert";
        WR: Text;
}