pageextension 50000 "Job Card Ext." extends "Job Card"
{
    DataCaptionExpression = Rec."No." + ' ' + Rec."Job Name";
    layout
    {
        addafter(General)
        {
            group(DanDelektron)
            {
                Caption = 'Dan Delektron';

                field("Job Name"; Rec."Job Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Job Name field.';
                }
                field("DD Description 2"; Rec."DD Description 2")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description 2 field.';
                }
                field("DD Description 3"; Rec."DD Description 3")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description 3 field.';
                }
                field("Estimate (hours)"; Rec."Estimate (hours)")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Estimate (hours) field.';
                }
                field("Finished in %"; Rec."Finished in %")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Finished in % field.';
                }
                field("Contact Person"; Rec."Contact Person")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Contact Person field.';
                }
                field("Phone No. on Site"; Rec."Phone No. on Site")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Phone No. on Site field.';
                }
                field(Requester; Rec.Requester)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Requester field.';
                }
                field("Quote, netto"; Rec."Quote, netto")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Quote, netto field.';
                }
            }
            group(QC)
            {
                Caption = 'Quality Control';

                field("Contact Person QC"; Rec."Contact Person QC")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Contact Person QC field.';
                }
                field("Documentation e-mail"; Rec."Documentation e-mail")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Documentation e-mail field.';
                }
                field("Responsible Installer"; Rec."Responsible Installer")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Responsible Installer field.';
                }
                field("Status QC"; Rec."Status QC")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Status QC field.';
                }
                label("Report Type")
                {
                    Caption = 'Report Type';
                    ApplicationArea = All;
                }
                field("Lightning Protection (report)"; Rec."Lightning Protection (report)")
                {
                    Caption = 'Lightning Protection';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Lightning Protection (report) field.';
                }
                field("Ground System (report)"; Rec."Ground System (report)")
                {
                    Caption = 'Ground System';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Ground System (report) field.';
                }
                field("Potential Equalization(report)"; Rec."Potential Equalization(report)")
                {
                    Caption = 'Potential Equalization';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Potential Equalization(report) field.';
                }
                field("Inspection (report)"; Rec."Inspection (report)")
                {
                    Caption = 'Inspection';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Inspection (report) field.';
                }
                field("Quality Control (report)"; Rec."Quality Control (report)")
                {
                    Caption = 'Quality Control';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Quality Control (report) field.';
                }
                field("Atex (report)"; Rec."Atex (report)")
                {
                    Caption = 'Atex';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Atex (report) field.';
                }
                field("Special (report)"; Rec."Special (report)")
                {
                    Caption = 'Special';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Special (report) field.';
                }
                field("Documentation Sent"; Rec."Documentation Sent")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Documentation Sent field.';
                }
                field("Documentation Sent At"; Rec."Documentation Sent At")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Documentation Sent At field.';
                    Editable = false;
                }
                field("Documentation Sent By"; Rec."Documentation Sent By")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Documentation Sent By field.';
                    Editable = false;
                }
                field("QC Comment"; Rec."QC Comment")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the QC Comment field.';
                }
            }
        }
        movebefore("DD Description 2"; Description)
        modify("% Completed")
        {
            Visible = false;
        }
    }
}
