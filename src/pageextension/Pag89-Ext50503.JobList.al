pageextension 50503 "JobList" extends "job list" //89
{
    layout
    {

        addbefore(Status)
        {

            field("Bill-to Name"; Rec."Bill-to Name")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the name of the customer who pays for the job.';
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