pageextension 50505 VendorList extends "Vendor List" //27
{
    layout
    {
        addafter(Name)
        {

            field("VAT Registration No."; Rec."VAT Registration No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the vendor''s VAT registration number.';
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}