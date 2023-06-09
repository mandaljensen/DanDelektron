pageextension 50002 "Item Ledger Entries Ext." extends "Item Ledger Entries"
{
    layout
    {
        addafter("Item No.")
        {
            field("Item No. 2"; Rec."Item No. 2")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Item No. 2 field.';
            }
        }
    }
}
