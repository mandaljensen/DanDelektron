pageextension 50011 PurchaseOrderListExt extends "Purchase Order List"
{
    layout
    {
        addlast(Control1)
        {
            field("No. Printed"; Rec."No. Printed")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the No. Printed field.';
            }
        }
    }
}
