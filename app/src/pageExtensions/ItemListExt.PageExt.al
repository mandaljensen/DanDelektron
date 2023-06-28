pageextension 50007 "Item List Ext." extends "Item List"
{
    layout
    {
        addafter(InventoryField)
        {
            field("Main Location"; Rec."Main Location")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Main Location field.';
                DecimalPlaces = 0 : 2;
            }
        }
    }
}
