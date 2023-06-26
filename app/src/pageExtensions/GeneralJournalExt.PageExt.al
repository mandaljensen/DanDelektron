pageextension 50005 "General Journal Ext." extends "General Journal"
{
    layout
    {
        addafter("Posting Date")
        {
            field("Due Date"; Rec."Due Date")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Due Date field.';
            }
        }
        addafter(Description)
        {
            field("Job Line Type"; Rec."Job Line Type")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Job Line Type field.';
            }
            field("Job No."; Rec."Job No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Job No. field.';
            }
            field("Job Task No."; Rec."Job Task No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Job Task No. field.';
            }
            field("Job Quantity"; Rec."Job Quantity")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Job Quantity field.';
            }
            field("Job Unit Price (LCY)"; Rec."Job Unit Price (LCY)")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Job Unit Price (LCY) field.';
            }
            field("Job Unit Price"; Rec."Job Unit Price")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Job Unit Price field.';
            }
            field("Job Line Amount (LCY)"; Rec."Job Line Amount (LCY)")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Job Line Amount (LCY) field.';
            }
            field("Job Unit Cost (LCY)"; Rec."Job Unit Cost (LCY)")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Job Unit Cost (LCY) field.';
            }
        }
    }
}
