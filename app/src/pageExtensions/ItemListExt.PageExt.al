pageextension 50007 "Item List Ext." extends "Item List"
{
    layout
    {
        addafter("No.")
        {
            field("No. 2"; Rec."No. 2")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the No. 2 field.';
            }
        }
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

    actions
    {
        addlast(Reporting)
        {
            action(ItemLabel)
            {
                Caption = 'Item Label';
                ApplicationArea = All;
                ToolTip = 'Executes the Item Label action.';
                Image = Report;

                trigger OnAction()
                var
                    Item: Record Item;
                begin
                    Item.Reset();
                    Item.SetRange("No.", Rec."No.");
                    Report.RunModal(Report::"Item Label", true, false, Item);
                end;
            }
        }
    }
}
