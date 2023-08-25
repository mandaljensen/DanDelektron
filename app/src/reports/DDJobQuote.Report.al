/// <summary>
/// Report Job Quote (ID 50006).
/// </summary>
report 50006 "DD Job Quote"
{
    Caption = 'Job Quote';
    DefaultLayout = RDLC;
    PreviewMode = PrintLayout;
    RDLCLayout = './src/layouts/DDJobQuote.rdlc';
    UsageCategory = Documents;
    ApplicationArea = Basic, Suite;

    dataset
    {
        dataitem(Job; Job)
        {
            PrintOnlyIfDetail = true;
            RequestFilterFields = "No.", "Planning Date Filter";
            column(BillToAddress1; BillToAddr[1])
            {
            }
            column(BillToAddress2; BillToAddr[2])
            {
            }
            column(BillToAddress3; BillToAddr[3])
            {
            }
            column(BillToAddress4; BillToAddr[4])
            {
            }
            column(BillToAddress5; BillToAddr[5])
            {
            }
            column(BillToAddress6; BillToAddr[6])
            {
            }
            column(CompanyAddress1; CompanyAddr[1])
            {
            }
            column(CompanyAddress2; CompanyAddr[2])
            {
            }
            column(CompanyAddress3; CompanyAddr[3])
            {
            }
            column(CompanyAddress4; CompanyAddr[4])
            {
            }
            column(CompanyAddress5; CompanyAddr[5])
            {
            }
            column(CompanyAddress6; CompanyAddr[6])
            {
            }
            column(CompanyAddress7; CompanyAddr[7])
            {
            }
            column(CompanyAddress8; CompanyAddr[8])
            {
            }
            column(CompanyLogoPosition; CompanyLogoPosition)
            {
            }
            column(CompanyName; COMPANYPROPERTY.DisplayName())
            {
            }
            column(CompanyPicture; CompanyInfo.Picture)
            {
            }
            column(CurrReportPageNoCaption; CurrReportPageNoCaptionLbl)
            {
            }
            column(JobFilter; JobFilter)
            {
            }
            column(JobQuoteCaptLbl; JobQuoteCaptLbl)
            {
            }
            column(JobtableCaptJobFilter; TableCaption + ': ' + JobFilter)
            {
            }
            column(JobTaskFilter; JobTaskFilter)
            {
            }
            column(JobTasktableCaptFilter; "Job Task".TableCaption + ': ' + JobTaskFilter)
            {
            }
            column(No_Job; "No.")
            {
            }
            column(TodayFormatted; Format(Today, 0, 4))
            {
            }
            column(ShipToAddress_Lbl; ShiptoAddrLbl)
            {
            }
            column(ShipToAddress1; ShipToAddr[1]) { }
            column(ShipToAddress2; ShipToAddr[2]) { }
            column(ShipToAddress3; ShipToAddr[3]) { }
            column(ShipToAddress4; ShipToAddr[4]) { }
            column(ShipToAddress5; ShipToAddr[5]) { }
            column(ShipToAddress6; ShipToAddr[6]) { }
            column(ShipToAddress7; ShipToAddr[7]) { }
            column(ShipToAddress8; ShipToAddr[8]) { }
            column(Job_Name; "Job Name") { }
            column(Bill_to_Contact; "Bill-to Contact") { }
            column(bill_to_contactCaption; job.FieldCaption("Bill-to Contact")) { }
            column(SelltoCustomerNo; "Sell-to Customer No.") { }
            column(SelltoCustomerNo_Lbl; FieldCaption("Sell-to Customer No.")) { }
            column(ShowShippingAddress; ShowShippingAddr) { }
            column(BilltoCustumerNo; "Bill-to Customer No.") { }
            column(Person_Responsible; Resource.Name) { }
            column(Person_ResponsibleCaption; job.FieldCaption("Person Responsible")) { }
            dataitem("Job Task"; "Job Task")
            {
                DataItemLink = "Job No." = FIELD("No.");
                DataItemTableView = SORTING("Job No.", "Job Task No.");
                PrintOnlyIfDetail = true;
                column(Description_Job; Job.Description)
                {
                }
                column(DescriptionCaption; DescriptionCaptionLbl)
                {
                }
                column(Indentation_JobTask; HeaderJobTask)
                {
                }
                column(JobTaskNo_JobTask; HeaderJobTaskNo)
                {
                }
                column(JobTaskNoCapt; JobTaskNoCaptLbl)
                {
                }
                column(JobTaskTypeCaption; JobTaskTypeLbl)
                {
                }
                column(NewTaskGroup; NewTaskGroup)
                {
                }
                column(NoCaption; NoLbl)
                {
                }
                column(QuantityCaption; QuantityLbl)
                {
                }
                column(TotalCostCaption; TotalCostLbl)
                {
                }
                column(TotalJob; TotalJob)
                {
                }
                column(TotalJobTask; TotalJobTask)
                {
                }
                column(UnitCostCaption; UnitCostLbl)
                {
                }
                dataitem("Job Planning Line";
                "Job Planning Line")
                {
                    DataItemLink = "Job No." = FIELD("Job No."), "Job Task No." = FIELD("Job Task No.");
                    DataItemTableView = SORTING("Job No.", "Job Task No.", "Line No.");
                    RequestFilterFields = "Job Task No.";
                    column(Indentation_JobTask2; PadStr('', 2 * "Job Task".Indentation) + Description)
                    {
                    }
                    column(Indentation_JobTaskTotal; PadStr('', 2 * "Job Task".Indentation) + Description)
                    {
                    }
                    column(JobPlanningLine_JobTaskNo; "Job Task No.")
                    {
                    }
                    column(JobPlanningLine_LineType; "Line Type")
                    {
                    }
                    column(JobPlanningLine_Type; Type)
                    {
                    }
                    column(Number; "No.")
                    {
                    }
                    column(Quantity; Quantity)
                    {
                    }
                    column(ShowIntBody1; "Job Task"."Job Task Type" in ["Job Task"."Job Task Type"::Heading, "Job Task"."Job Task Type"::"Begin-Total"])
                    {
                    }
                    column(ShowIntBody2; "Job Task"."Job Task Type" in ["Job Task"."Job Task Type"::Total, "Job Task"."Job Task Type"::"End-Total"])
                    {
                    }
                    column(ShowIntBody3; ("Job Task"."Job Task Type" in ["Job Task"."Job Task Type"::Posting]) and PrintSection)
                    {
                    }
                    column(TotalCost; "Total Price")
                    {
                    }
                    column(TotalCostLCY; "Total Price (LCY)")
                    {
                        AutoFormatExpression = CurrencyFormat;
                        AutoFormatType = 10;
                    }
                    column(Type; Type)
                    {
                    }
                    column(UnitCost; "Unit Price")
                    {
                    }
                    column(UnitCostLCY; "Unit Price (LCY)")
                    {
                    }

                    trigger OnAfterGetRecord()
                    begin
                        PrintSection := true;
                        if "Line Type" = "Line Type"::Budget then begin
                            PrintSection := false;
                            CurrReport.Skip();
                        end;
                        JobTotalValue += ("Unit Price" * Quantity);

                        if FirstLineHasBeenOutput then
                            Clear(CompanyInfo.Picture);
                        FirstLineHasBeenOutput := true;

                        ConstructCurrencyFormatString();
                    end;

                    trigger OnPreDataItem()
                    begin
                        CompanyInfo.CalcFields(Picture);
                    end;
                }

                trigger OnAfterGetRecord()
                begin
                    if "Job Task Type" = "Job Task Type"::"Begin-Total" then begin
                        if Indentation = 0 then
                            TotalJob := TotalLbl + ' ' + Description;
                        HeaderJobTask := PadStr('', 2 * Indentation) + Description;
                        HeaderJobTaskNo := Format("Job Task No.");
                        TotalJobTask := PadStr('', 2 * Indentation) + TotalLbl + ' ' + Description;
                    end;

                    if ((CurrentIndentation > 0) and (CurrentIndentation < Indentation)) or ("Job Task Type" = "Job Task Type"::"End-Total") then
                        NewTaskGroup := NewTaskGroup + 1;

                    CurrentIndentation := Indentation;
                end;

                trigger OnPreDataItem()
                begin
                    CompanyInfo.CalcFields(Picture);
                end;
            }
            dataitem(Totals; "Integer")
            {
                DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));
                column(JobTotalValue; JobTotalValue)
                {
                }
            }

            trigger OnAfterGetRecord()
            begin
                JobTotalValue := 0;
                NewTaskGroup := 0;
                FormatAddr.Company(CompanyAddr, CompanyInfo);
                FormatAddr.JobBillTo(BillToAddr, Job);
                ShowShippingAddr := JobShipTo(ShipToAddr, BillToAddr, Job);
                if Resource.Get(job."Person Responsible") then;
            end;
        }
    }

    requestpage
    {
        SaveValues = true;

        layout
        {
            area(content)
            {
            }
        }

        actions
        {
        }
    }

    labels
    {
        JobNoLbl = 'Job No.';
        JobDescriptionLbl = 'Description';
    }

    trigger OnInitReport()
    begin
        CompanyInfo.Get();
        JobsSetup.Get();
        ConstructCurrencyFormatString();
    end;

    trigger OnPreReport()
    begin
        JobFilter := Job.GetFilters();
        JobTaskFilter := "Job Planning Line".GetFilters();
        CompanyLogoPosition := JobsSetup."Logo Position on Documents";
    end;

    var
        CompanyInfo: Record "Company Information";
        JobsSetup: Record "Jobs Setup";
        FormatAddr: Codeunit "Format Address";
        FirstLineHasBeenOutput: Boolean;
        PrintSection: Boolean;
        JobTotalValue: Decimal;
        CompanyLogoPosition: Integer;
        CurrentIndentation: Integer;
        NewTaskGroup: Integer;
        CurrReportPageNoCaptionLbl: Label 'Page';
        DescriptionCaptionLbl: Label 'Description';
        JobQuoteCaptLbl: Label 'Job Quote';
        JobTaskNoCaptLbl: Label 'Job Task No.';
        JobTaskTypeLbl: Label 'Job Task Type';
        NoLbl: Label 'No.';
        QuantityLbl: Label 'Quantity';
        TotalCostLbl: Label 'Total Cost';
        TotalLbl: Label 'Total';
        UnitCostLbl: Label 'Unit Cost';
        CurrencyFormat: Text;
        JobFilter: Text;
        JobTaskFilter: Text;
        BillToAddr: array[8] of Text[100];
        CompanyAddr: array[8] of Text[100];
        ShipToAddr: array[8] of Text[100];
        HeaderJobTask: Text[250];
        HeaderJobTaskNo: Text[250];
        TotalJob: Text[250];
        ShowShippingAddr: Boolean;
        ShiptoAddrLbl: Label 'Ship-to Address';
        TotalJobTask: Text[250];
        Resource: Record Resource;

    local procedure ConstructCurrencyFormatString()
    var
        Currency: Record Currency;
        GLSetup: Record "General Ledger Setup";
        CurrencyLbl: Label '%1<precision, 2:2><standard format, 0>', Comment = '%1=CurrencySymbol';
        CurrencySymbol: Text[10];
    begin
        if Job."Currency Code" = '' then begin
            GLSetup.Get();
            CurrencySymbol := GLSetup.GetCurrencySymbol();
        end else begin
            if Currency.Get(Job."Currency Code") then;
            CurrencySymbol := Currency.GetCurrencySymbol();
        end;
        CurrencyFormat := StrSubstNo(CurrencyLbl, CurrencySymbol);
    end;

    local procedure JobShipTo(ShipToAddr: array[8] of Text[100]; BillToAddr: array[8] of Text[100]; Job: Record Job): Boolean
    var
        IsHandled: Boolean;
        i: Integer;
    begin

        FormatAddr.FormatAddr(ShipToAddr, Job."Ship-to Name", Job."Ship-to Name 2", Job."Ship-to Contact", Job."Ship-to Address", Job."Ship-to Address 2",
                                Job."Ship-to City", Job."Ship-to Post Code", Job."Ship-to County", Job."Ship-to Country/Region Code");
        if Job."Sell-to Customer No." <> Job."Bill-to Customer No." then
            exit(true);
        for i := 1 to ArrayLen(ShipToAddr) do
            if ShipToAddr[i] <> BillToAddr[i] then
                exit(true);

        exit(false);
    end;

}

