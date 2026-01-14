/// Page Importar Blob (ID 50200).
/// </summary>
page 90111 "Importar Blob 1"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "WebEP Work Report";

    layout
    {
        area(Content)
        {

            field(id; Rec.Id)
            {
                ApplicationArea = All;

            }
            field(TLB; ExtendedText)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the TLB field.';
                MultiLine = true;
            }
            field("Work Report"; ExtendedText2)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the TLB field.';
                MultiLine = true;
            }


        }

    }

    actions
    {
        area(Processing)
        {
            action("Report Card Blob")
            {
                Caption = 'Import Item Extend. Desc. to blob';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ApplicationArea = all;

                trigger OnAction();
                var
                    Rp: Record "WebEP Work Report";
                    OStream: OutStream;
                    BT: BigText;
                begin
                    //  Xmlport.Run(Xmlport::"Import BLOB", false, true);
                    If Prueba.FindFirst() Then
                        repeat
                            If Rp.Get(Prueba.id) Then begin
                                Clear(OStream);
                                Rp.TLB.CreateOutStream(OStream);
                                OStream.Write(Prueba.TLB);
                                Clear(OStream);

                                Rp."Work Report".CreateOutStream(OStream);
                                Clear(BT);
                                bt.AddText(Prueba.Work1);
                                bt.AddText(Prueba.Work2);
                                bt.AddText(Prueba.Work3);
                                bt.AddText(Prueba.Work4);
                                bt.AddText(Prueba.Work5);
                                bt.AddText(Prueba.Work6);
                                bt.Write(OStream);

                                Clear(OStream);
                                Rp."Attention Items".CreateOutStream(OStream);
                                OStream.Write(Prueba.Shift);
                                Rp.Modify();
                            end;
                        until Prueba.Next() = 0;
                end;

            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        Clear(ExtendedText);
        Clear(InStr);

        if Rec.TLB.HasValue then begin
            Rec.CalcFields(TLB);
            Rec.TLB.CreateInStream(InStr, TextEncoding::WINDOWS);
            ExtendedText.Read(InStr);
            longitud := ExtendedText.Length();

        end;

        IF REC."Work Report".HasValue then begin
            Rec.CalcFields("Work Report");
            Rec."Work Report".CreateInStream(InStr, TextEncoding::WINDOWS);
            ExtendedText2.Read(InStr);
            longitud := ExtendedText2.Length();
        end;
    end;

    var
        xmlDoc: XmlDocument;
        FromFile: text;
        Tab: XmlElement;
        NodeList: XmlNodeList;
        NodeListSec: XmlNodeList;
        Nodo1: XmlNode;
        Nodo2: XmlNode;
        Element: XmlElement;
        testCu: Codeunit "Import XML File to Data Exch.";

        WEBEP: Record "WebEP Work Report";
        InsStr: InStream;
        myInt: Integer;
        ExtendedText: BigText;
        ExtendedText2: BigText;
        InStr: InStream;
        longitud: Integer;
        Prueba: Record Prueba;
}