pageextension 50001 "Location Card Ext." extends "Location Card"
{
    layout
    {
        addlast(General)
        {
            field(Hide; Rec.Hide)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Hide field.';
            }
        }
    }
}
