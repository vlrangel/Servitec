pageextension 50502 "JobLedgerEntries" extends "Job Ledger Entries" //92
{
    layout
    {
        addlast(Control1)
        {
            field(SourceCode; SourceCode)
            {
                ApplicationArea = all;
                Caption = 'Cod. Origen';
            }
            field(SourceName; SourceName)
            {
                ApplicationArea = all;
                Caption = 'Nombre Origen';
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }
    trigger OnAfterGetRecord()
    var
        myInt: Integer;
    begin
        SourceCode := '';
        SourceName := '';
        IF Rec."Entry Type" = Rec."Entry Type"::Sale THEN BEGIN
            CLEAR(Rec21);
            Rec21.SETCURRENTKEY("Document No.", "Document Type");
            Rec21.SETRANGE("Document No.", Rec."Document No.");
            Rec21.SETRANGE("Posting Date", Rec."Posting Date");
            IF Rec21.FINDLAST THEN BEGIN
                SourceCode := Rec21."Customer No.";
                Rec18.GET(Rec21."Customer No.");
                SourceName := Rec18.Name;
            END;
        END ELSE BEGIN
            CLEAR(Rec25);
            Rec25.SETCURRENTKEY("Document No.");
            Rec25.SETRANGE("Document No.", rec."Document No.");
            Rec25.SETRANGE("Posting Date", Rec."Posting Date");
            IF Rec25.FINDLAST THEN BEGIN
                SourceCode := Rec25."Vendor No.";
                Rec23.GET(Rec25."Vendor No.");
                SourceName := Rec23.Name;
            END;
        END;
    end;

    var
        myInt: Integer;
        Rec25: Record "Vendor Ledger Entry";
        Rec21: Record "Cust. Ledger Entry";
        SourceCode: Code[20];
        SourceName: Text[50];
        Rec18: Record "Customer";
        Rec23: Record "Vendor";
}