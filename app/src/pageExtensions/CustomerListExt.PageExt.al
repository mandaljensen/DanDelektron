pageextension 50006 "Customer List Ext." extends "Customer List"
{
    layout
    {
        addafter("Name 2")
        {
            field(Address; Rec.Address)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Address field.';
            }
            field("Address 2"; Rec."Address 2")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Address 2 field.';
            }
        }
        addafter("Post Code")
        {
            field(City; Rec.City)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the City field.';
            }
            field("Bill-to Customer No."; Rec."Bill-to Customer No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Bill-to Customer No. field.';
            }
            field("E-Mail"; Rec."E-Mail")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Email field.';
            }
        }
    }
}
