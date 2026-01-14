pageextension 50506 CustomerList extends "Customer List" //22
{
    layout
    {
        addafter(Name)
        {

            field("VAT Registration No."; Rec."VAT Registration No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the customer''s VAT registration number for customers in EU countries/regions.';
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