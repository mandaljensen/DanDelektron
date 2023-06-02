tableextension 50000 "Job Ext." extends Job
{
    fields
    {
        field(50000; "DD Description 2"; Text[150])
        {
            Caption = 'Description 2';
            DataClassification = CustomerContent;
        }
        field(50001; "DD Description 3"; Text[150])
        {
            Caption = 'Description 3';
            DataClassification = CustomerContent;
        }
        field(50002; "Job Name"; Text[100])
        {
            Caption = 'Job Name';
            DataClassification = CustomerContent;
        }
        field(50003; "Contact Person QC"; Text[50])
        {
            Caption = 'Contact Person QC';
            DataClassification = CustomerContent;
        }
        field(50004; "Documentation e-mail"; Text[200])
        {
            Caption = 'Documentation e-mail';
            DataClassification = CustomerContent;
        }
        field(50005; "Responsible Installer"; Code[20])
        {
            Caption = 'Responsible Installer';
            DataClassification = CustomerContent;
        }
        field(50006; "Status QC"; Option)
        {
            Caption = 'Status QC';
            DataClassification = CustomerContent;
            OptionMembers = "Planning","Started","Ready","Sent Customer","Finished";
            OptionCaption = 'Planning,Started,Ready,Sent Customer,Finished';
        }
        field(50007; "Lightning Protection (report)"; Boolean)
        {
            Caption = 'Lightning Protection (report)';
            DataClassification = CustomerContent;
        }
        field(50008; "Ground System (report)"; Boolean)
        {
            Caption = 'Ground System (report)';
            DataClassification = CustomerContent;
        }
        field(50009; "Potential Equalization(report)"; Boolean)
        {
            Caption = 'Potential Equalization(report)';
            DataClassification = CustomerContent;
        }
        field(50010; "Inspection (report)"; Boolean)
        {
            Caption = 'Inspection (report)';
            DataClassification = CustomerContent;
        }
        field(50011; "Quality Control (report)"; Boolean)
        {
            Caption = 'Quality Control (report)';
            DataClassification = CustomerContent;
        }
        field(50012; "Atex (report)"; Boolean)
        {
            Caption = 'Atex (report)';
            DataClassification = CustomerContent;
        }
        field(50013; "Special (report)"; Boolean)
        {
            Caption = 'Special (report)';
            DataClassification = CustomerContent;
        }
        field(50014; "Documentation Sent"; Boolean)
        {
            Caption = 'Documentation Sent';
            DataClassification = CustomerContent;
        }
        field(50015; "Documentation Sent By"; Code[50])
        {
            Caption = 'Documentation Sent By';
            DataClassification = CustomerContent;
        }
        field(50016; "Documentation Sent At"; DateTime)
        {
            Caption = 'Documentation Sent At';
            DataClassification = CustomerContent;
        }
        field(50017; "QC Comment"; Text[250])
        {
            Caption = 'QC Comment';
            DataClassification = CustomerContent;
        }
        field(50018; "Finished in %"; Decimal)
        {
            Caption = 'Finished in %';
            DataClassification = CustomerContent;
        }
        field(50019; Requester; Text[30])
        {
            Caption = 'Requester';
            DataClassification = CustomerContent;
        }
        field(50020; "Phone No. on Site"; Text[16])
        {
            Caption = 'Phone No. on Site';
            DataClassification = CustomerContent;
        }
        field(50021; "Contact Person"; Text[80])
        {
            Caption = 'Contact Person';
            DataClassification = CustomerContent;
        }
        field(50022; "Quote, netto"; Decimal)
        {
            Caption = 'Quote, netto';
            DataClassification = CustomerContent;
        }
        field(50023; "Estimate (hours)"; Text[20])
        {
            Caption = 'Estimate (hours)';
            DataClassification = CustomerContent;
        }
    }
}
