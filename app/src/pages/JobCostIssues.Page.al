page 50001 "Job Cost Issues"
{
    ApplicationArea = All;
    Caption = 'Job Cost Issues';
    PageType = List;
    SourceTable = Job;
    UsageCategory = Lists;
    Editable = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                }
                field("Job Name"; Rec."Job Name")
                {
                    ToolTip = 'Specifies the value of the Job Name field.';
                    StyleExpr = Warning;
                }
                field("BC Cost price"; Rec."BC Cost price")
                {
                    ToolTip = 'Specifies the value of the Cost price field.';
                }
                field("NAV Cost Amount"; Rec."NAV Cost Amount")
                {
                    ToolTip = 'Specifies the value of the NAV Cost Amount field.';
                    DrillDownPageId = "Job Cost and Price";
                }
                field("BC Billable price"; Rec."BC Billable price")
                {
                    ToolTip = 'Specifies the value of the Billable price field.';
                }

                field("NAV Price Amount"; Rec."NAV Price Amount")
                {
                    ToolTip = 'Specifies the value of the NAV Price Amount field.';
                    DrillDownPageId = "Job Cost and Price";
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        if (Rec."BC Cost price" <> Rec."NAV Cost Amount") or (Rec."BC Billable price" <> Rec."NAV Price Amount") then
            Warning := 'Attention'
        else
            Warning := 'None';
    end;

    var
        Warning: Text[10];
}
