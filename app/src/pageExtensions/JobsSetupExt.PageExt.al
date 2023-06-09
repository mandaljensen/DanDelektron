pageextension 50004 "Jobs Setup Ext." extends "Jobs Setup"
{
    layout
    {
        addafter("Document No. Is Job No.")
        {
            field("Default Job Task No."; Rec."Default Job Task No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Default Job Task No. field.';
            }
        }
    }
}
