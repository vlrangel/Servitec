page 90112 "Prueba"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Prueba;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(Id; Rec.Id)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Id field.';
                }
                field(Shift; Rec.Shift)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shift field.';
                }
                field(TLB; Rec.TLB)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the TLB field.';
                }
                field(Work1; Rec.Work1)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Work1 field.';
                }
                field(Work2; Rec.Work2)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Work2 field.';
                }
                field(Work3; Rec.Work3)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Work3 field.';
                }
                field(Work4; Rec.Work4)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Work4 field.';
                }
                field(Work5; Rec.Work5)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Work5 field.';
                }
                field(Work6; Rec.Work6)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Work6 field.';
                }

            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction();
                begin

                end;
            }
        }
    }
}