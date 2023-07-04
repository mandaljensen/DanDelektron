pageextension 50009 "Purchase Order Subform Ext." extends "Purchase Order Subform"
{
    layout
    {
        addafter("No.")
        {
            field("Vendor Item No."; Rec."Vendor Item No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Vendor Item No. field.';
            }
        }
    }
}
