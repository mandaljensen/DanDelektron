report 50007 "Fix Job Prices"
{
    Caption = 'Fix Job Prices';
    ProcessingOnly = true;
    UsageCategory = None;
    Permissions = tabledata "Job Ledger Entry" = rm, tabledata "Res. Ledger Entry" = rm;

    dataset
    {
        dataitem(JobCostAndPrice; "Job Cost And Price")
        {
            RequestFilterFields = "Job No.", "Posting Date", "Document No.";

            trigger OnAfterGetRecord()
            begin
                JobPlanningLine.Reset();
                JobPlanningLine.SetRange("Job No.", JobCostAndPrice."Job No.");
                //JobPlanningLine.SetRange("Job Task No.", JobCostAndPrice."Job Task No.");
                JobPlanningLine.SetRange("Planning Date", JobCostAndPrice."Posting Date");
                JobPlanningLine.SetRange("Document No.", JobCostAndPrice."Document No.");
                JobPlanningLine.SetRange(Type, JobCostAndPrice.Type);
                JobPlanningLine.SetRange("No.", JobCostAndPrice."No.");
                if (JobCostAndPrice.Type = JobCostAndPrice.Type::"G/L Account") or (JobCostAndPrice.Type = JobCostAndPrice.Type::Resource) then
                    JobPlanningLine.SetRange(Description, JobCostAndPrice.Description);
                if JobPlanningLine.FindSet(true) then
                    repeat
                        if (JobPlanningLine."Unit Cost" <> JobCostAndPrice."Unit Cost") or (JobPlanningLine."Unit Price" <> JobCostAndPrice."Unit Price") or (JobPlanningLine."Line Discount %" <> JobCostAndPrice."Line Discount %") then begin
                            JobPlanningLine.Validate("Unit Cost", JobCostAndPrice."Unit Cost");
                            JobPlanningLine.Validate("Unit Price", JobCostAndPrice."Unit Price");
                            JobPlanningLine.Validate("Line Discount %", JobCostAndPrice."Line Discount %");
                            if JobPlanningLine."Posted Line Amount" <> 0 then begin
                                JobPlanningLine.Validate("Posted Line Amount", JobPlanningLine."Total Price");
                                JobPlanningLine.Validate("Posted Line Amount (LCY)", JobPlanningLine."Total Price (LCY)");
                            end;
                            if JobPlanningLine."Posted Total Cost" <> 0 then begin
                                JobPlanningLine.Validate("Posted Total Cost", JobPlanningLine."Total Cost");
                                JobPlanningLine.Validate("Posted Total Cost (LCY)", JobPlanningLine."Total Cost (LCY)");
                            end;
                            JobPlanningLine.Modify(true);

                            ModifyJobEntries(JobPlanningLine);
                            ModifyResourceEntries(JobPlanningLine);
                        end;
                    until (JobPlanningLine.Next() <= 0);
            end;
        }
    }

    procedure ModifyJobEntries(locJobPlanningLine: Record "Job Planning Line")
    var
        JobLedgerEntry: Record "Job Ledger Entry";
        JobUsageLink: Record "Job Usage Link";
    begin
        JobUsageLink.Reset();
        JobUsageLink.SetRange("Job No.", locJobPlanningLine."Job No.");
        JobUsageLink.SetRange("Job Task No.", locJobPlanningLine."Job Task No.");
        JobUsageLink.SetRange("Line No.", locJobPlanningLine."Line No.");
        if JobUsageLink.FindSet(false) then
            repeat
                JobLedgerEntry.Get(JobUsageLink."Entry No.");
                JobLedgerEntry.Validate("Unit Cost", JobPlanningLine."Unit Cost");
                JobLedgerEntry.Validate("Unit Cost (LCY)", JobPlanningLine."Unit Cost (LCY)");
                JobLedgerEntry.Validate("Original Unit Cost", JobLedgerEntry."Unit Cost");
                JobLedgerEntry.Validate("Original Unit Cost (LCY)", JobLedgerEntry."Unit Cost (LCY)");
                JobLedgerEntry.Validate("Total Cost", JobPlanningLine."Total Cost");
                JobLedgerEntry.Validate("Total Cost (LCY)", JobPlanningLine."Total Cost (LCY)");
                JobLedgerEntry.Validate("Original Total Cost", JobLedgerEntry."Total Cost");
                JobLedgerEntry.Validate("Original Total Cost (LCY)", JobLedgerEntry."Total Cost (LCY)");
                JobLedgerEntry.Validate("Unit Price", JobPlanningLine."Unit Price");
                JobLedgerEntry.Validate("Unit Price (LCY)", JobPlanningLine."Unit Price (LCY)");
                JobLedgerEntry.Validate("Total Price", JobPlanningLine."Line Amount");
                JobLedgerEntry.Validate("Total Price (LCY)", JobPlanningLine."Line Amount (LCY)");
                JobLedgerEntry.Validate("Line Amount", JobPlanningLine."Line Amount");
                JobLedgerEntry.Validate("Line Amount (LCY)", JobPlanningLine."Line Amount (LCY)");
                JobLedgerEntry.Validate("Line Discount %", JobPlanningLine."Line Discount %");
                JobLedgerEntry.Validate("Line Discount Amount", JobPlanningLine."Line Discount Amount");
                JobLedgerEntry.Validate("Line Discount Amount (LCY)", JobPlanningLine."Line Discount Amount (LCY)");
                JobLedgerEntry.Modify(true);
            until (JobUsageLink.Next() <= 0);
    end;

    procedure ModifyResourceEntries(locJobPlanningLine: Record "Job Planning Line")
    var
        ResLedgerEntry: Record "Res. Ledger Entry";
    begin
        if JobPlanningLine.type <> JobPlanningLine.Type::Resource then
            exit;

        ResLedgerEntry.Reset();
        ResLedgerEntry.SetRange("Document No.", JobPlanningLine."Document No.");
        ResLedgerEntry.SetRange("Posting Date", JobPlanningLine."Planning Date");
        ResLedgerEntry.SetRange("Resource No.", JobPlanningLine."No.");
        ResLedgerEntry.SetRange(Quantity, JobPlanningLine.Quantity);
        if ResLedgerEntry.FindSet(true) then
            repeat
                ResLedgerEntry.Validate("Unit Cost", JobPlanningLine."Unit Cost");
                ResLedgerEntry.Validate("Total Cost", JobPlanningLine."Total Cost");
                ResLedgerEntry.Validate("Unit Price", JobPlanningLine."Unit Price");
                ResLedgerEntry.Validate("Total Price", JobPlanningLine."Total Price");
                ResLedgerEntry.Modify(true);
            until (ResLedgerEntry.Next() <= 0);
    end;

    var
        JobPlanningLine: Record "Job Planning Line";
        JobPlanningLine2: Record "Job Planning Line";
        USeJobTaskNo: Code[20];
}
