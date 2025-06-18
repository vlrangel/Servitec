pageextension 50501 "DocsinPOSubformServitec" extends "Docs. in PO Subform" //7000075
{
    layout
    {
        addlast(Control1)
        {
            field("No. documento Externo"; NoDocExt)
            {
                ApplicationArea = All;
            }
            field("Nombre Proveedor"; VendorName)
            {
                ApplicationArea = All;
            }

            field("Cust./Vendor Bank Acc. Code"; Rec."Cust./Vendor Bank Acc. Code")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the bank account code of the customer/vendor associated with this document.';
            }
        }

    }

    actions
    {
        // Add changes to page actions here
    }
    trigger OnAfterGetCurrRecord()
    var
        myInt: Integer;
    begin
        CLEAR(Rec23);
        CLEAR(Rec25);
        VendorName := '';
        NoDocExt := '';
        IF Rec25.GET(rec."Entry No.") THEN
            NoDocExt := Rec25."External Document No.";
        IF Rec23.GET(Rec."Account No.") THEN
            VendorName := Rec23.Name;
    end;

    var
        myInt: Integer;
        Rec23: Record Vendor;
        Rec25: Record "Vendor Ledger Entry";
        VendorName: Text[100];
        NoDocExt: Code[35];
}