/// <summary>
/// Report Job Quote (ID 50006).
/// </summary>
report 50006 "DD Job Quote"
{
    ApplicationArea = Basic, Suite;
    Caption = 'Job Quote';
    DefaultLayout = RDLC;
    PreviewMode = PrintLayout;
    RDLCLayout = './src/layouts/DDJobQuote.rdlc';
    UsageCategory = Documents;

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
            column(DD_Description_2; "DD Description 2") { }
            column(DD_Description_3; "DD Description 3") { }
            column(Quote__netto; "Quote, netto") { }
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
        CompanyLogoPosition := JobsSetup."Logo Position on Documents";
    end;

    var
        CompanyInfo: Record "Company Information";
        JobsSetup: Record "Jobs Setup";
        Resource: Record Resource;
        FormatAddr: Codeunit "Format Address";
        ShowShippingAddr: Boolean;
        JobTotalValue: Decimal;
        CompanyLogoPosition: Integer;
        NewTaskGroup: Integer;
        CurrReportPageNoCaptionLbl: Label 'Page';
        JobQuoteCaptLbl: Label 'Job Quote';
        ShiptoAddrLbl: Label 'Ship-to Address';
        CurrencyFormat: Text;
        JobFilter: Text;
        JobTaskFilter: Text;
        BillToAddr: array[8] of Text[100];
        CompanyAddr: array[8] of Text[100];
        ShipToAddr: array[8] of Text[100];

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

