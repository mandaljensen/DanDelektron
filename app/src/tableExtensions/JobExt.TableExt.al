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
            TableRelation = Resource;
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

            trigger OnValidate()
            begin
                if "Documentation Sent" <> xRec."Documentation Sent" then
                    if "Documentation Sent" then begin
                        "Documentation Sent By" := CopyStr(UserId(), 1, 50);
                        "Documentation Sent At" := CurrentDateTime();
                    end else begin
                        "Documentation Sent By" := '';
                        Clear("Documentation Sent At");
                    end;
            end;
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
        field(50024; "Cost price"; Decimal)
        {
            Caption = 'Cost price';
            FieldClass = FlowField;
            CalcFormula = sum("Job Ledger Entry"."Total Cost" where("Job No." = field("No."), "Entry Type" = const("Job Journal Line Entry Type"::Usage), "Posting Date" = field("Posting Date Filter")));
        }
        field(50025; "Billable price"; Decimal)
        {
            Caption = 'Billable price';
            FieldClass = FlowField;
            CalcFormula = sum("Job Ledger Entry"."Line Amount" where("Job No." = field("No."), "Entry Type" = const("Job Journal Line Entry Type"::Usage), "Posting Date" = field("Posting Date Filter")));
        }
        field(50026; "NAV Cost Amount"; Decimal)
        {
            Caption = 'NAV Cost Amount';
            FieldClass = FlowField;
            CalcFormula = sum("Job Cost And Price"."Total Cost" where("Job No." = field("No.")));
        }
        field(50027; "NAV Price Amount"; Decimal)
        {
            Caption = 'NAV Price Amount';
            FieldClass = FlowField;
            CalcFormula = sum("Job Cost And Price"."Total Price" where("Job No." = field("No.")));
        }
        field(50028; "BC Cost price"; Decimal)
        {
            Caption = 'BC Cost price';
            FieldClass = FlowField;
            CalcFormula = sum("Job Ledger Entry"."Total Cost" where("Job No." = field("No."), "Entry Type" = const("Job Journal Line Entry Type"::Usage), "Posting Date" = field("Posting Date Filter"), SystemCreatedBy = const('{283B0281-C933-496B-9223-E0FE352510E6}')));
        }
        field(50029; "BC Billable price"; Decimal)
        {
            Caption = 'BC Billable price';
            FieldClass = FlowField;
            CalcFormula = sum("Job Ledger Entry"."Line Amount" where("Job No." = field("No."), "Entry Type" = const("Job Journal Line Entry Type"::Usage), "Posting Date" = field("Posting Date Filter"), SystemCreatedBy = const('{283B0281-C933-496B-9223-E0FE352510E6}')));
        }
    }
}
