pageextension 50504 PaymentMethods extends "Payment Methods" //427
{
    layout
    {
        addafter("SII Payment Method Code")
        {

            field("Num de cuenta banco en factura"; Rec."Num de cuenta banco en factura")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Num de cuenta banco en factura field.', Comment = '%';
            }
            field(SWIFT; Rec.SWIFT)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the SWIFT field.', Comment = '%';
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