pageextension 50008 "Job List Ext." extends "Job List"
{
    layout
    {
        addafter("No.")
        {
            field("Job Name"; Rec."Job Name")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Job Name field.';
            }

        }
        addafter("Bill-to Customer No.")
        {
            field("Bill-to Name"; Rec."Bill-to Name")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Bill-to Name field.';
            }
            field("Ship-to Name"; Rec."Ship-to Name")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Ship-to Name field.';
            }
            field("External Document No."; Rec."External Document No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the External Document No. field.';
            }
            field("Contact Person"; Rec."Contact Person")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Contact Person field.';
            }
            field("Quote, netto"; Rec."Quote, netto")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Quote, netto field.';
            }
        }
    }
}
