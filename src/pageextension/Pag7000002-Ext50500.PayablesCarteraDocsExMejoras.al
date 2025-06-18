pageextension 50500 "PayablesCarteraDocsExMejoras" extends "Payables Cartera Docs" //7000002
{
    layout
    {
        addlast(Control1)
        {
            field("Nombre"; NombreClieProveedor)
            {
                ApplicationArea = all;
                Editable = false;
            }
        }
    }
    trigger OnAfterGetRecord()

    begin
        Clear(NombreClieProveedor);
        case rec.Type of
            rec.Type::Receivable:
                begin
                    if Clie.get(Rec."Account No.") then
                        NombreClieProveedor := Clie.Name;

                    Clear(NoDocExterno);
                    NoDocExterno := '';
                    IF Rec21.GET(rec."Entry No.") THEN
                        NoDocExterno := Rec21."External Document No.";
                end;
            rec.Type::Payable:
                begin
                    if Provee.get(Rec."Account No.") then
                        NombreClieProveedor := Provee.Name;

                    Clear(NoDocExterno);
                    NoDocExterno := '';
                    IF Rec25.GET(rec."Entry No.") THEN
                        NoDocExterno := Rec25."External Document No.";
                end;
        end;



    end;


    var
        myInt: Integer;
        NombreClieProveedor: Text[100];
        Clie: Record Customer;
        Provee: Record Vendor;
        NoDocExterno: Code[20];
        Rec25: Record "Vendor Ledger Entry";
        Rec21: Record "Cust. Ledger Entry";
}