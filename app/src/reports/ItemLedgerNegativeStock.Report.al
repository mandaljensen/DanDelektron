Report 50026 "Item Ledger - Negative Stock"
{
    Caption = 'Negative Inventory';
    RDLCLayout = './src/Layouts/ItemLedgerNegativeStock.rdlc';
    DefaultLayout = RDLC;


    dataset
    {
        dataitem("Item Ledger Entry"; "Item Ledger Entry")
        {
            DataItemTableView = where(Positive = const(false), Open = const(true));
            RequestFilterFields = "Entry No.";
            column("USERID"; UserId) { }
            column(COMPANYNAME; COMPANYNAME) { }
            column(TODAY_0_4; Format(Today, 0, 4)) { }
            column(Page_Lbl; PageLbl) { }
            column(ReportNameLbl; ReportNameLbl) { }
            column(ItemLedgerEntryFIELDCAPTION_CompletelyInvoiced; "Item Ledger Entry".FieldCaption("Completely Invoiced")) { }
            column(ItemLedgerEntryFIELDCAPTION_JobTaskNo; "Item Ledger Entry".FieldCaption("Job Task No.")) { }
            column(ItemLedgerEntryFIELDCAPTION_JobNo; "Item Ledger Entry".FieldCaption("Job No.")) { }
            column(ItemLedgerEntryFIELDCAPTION_ExternalDocumentNo; "Item Ledger Entry".FieldCaption("External Document No.")) { }
            column(ItemLedgerEntryFIELDCAPTION_InvoicedQuantity; "Item Ledger Entry".FieldCaption("Invoiced Quantity")) { }
            column(ItemLedgerEntryFIELDCAPTION_RemainingQuantity; "Item Ledger Entry".FieldCaption("Remaining Quantity")) { }
            column(ItemLedgerEntryFIELDCAPTION_Quantity; "Item Ledger Entry".FieldCaption(Quantity)) { }
            column(ItemLedgerEntryFIELDCAPTION_LocationCode; "Item Ledger Entry".FieldCaption("Location Code")) { }
            column(ItemLedgerEntryFIELDCAPTION_DocumentNo; "Item Ledger Entry".FieldCaption("Document No.")) { }
            column(ItemLedgerEntryFIELDCAPTION_SourceNo; "Item Ledger Entry".FieldCaption("Source No.")) { }
            column(ItemLedgerEntryFIELDCAPTION_EntryType; "Item Ledger Entry".FieldCaption("Entry Type")) { }
            column(ItemLedgerEntryFIELDCAPTION_PostingDate; "Item Ledger Entry".FieldCaption("Posting Date")) { }
            column(ItemLedgerEntryFIELDCAPTION_ItemNo; "Item Ledger Entry".FieldCaption("Item No.")) { }
            column(ItemLedgerEntryFIELDCAPTION_EntryNo; "Item Ledger Entry".FieldCaption("Entry No.")) { }
            column(ItemLedgerEntry_CompletelyInvoiced; "Item Ledger Entry"."Completely Invoiced") { }
            column(ItemLedgerEntry_JobTaskNo; "Item Ledger Entry"."Job Task No.") { }
            column(ItemLedgerEntry_JobNo; "Item Ledger Entry"."Job No.") { }
            column(ItemLedgerEntry_ExternalDocumentNo; "Item Ledger Entry"."External Document No.") { }
            column(ItemLedgerEntry_InvoicedQuantity; "Item Ledger Entry"."Invoiced Quantity") { }
            column(ItemLedgerEntry_RemainingQuantity; "Item Ledger Entry"."Remaining Quantity") { }
            column(ItemLedgerEntry_Quantity; "Item Ledger Entry".Quantity) { }
            column(ItemLedgerEntry_LocationCode; "Item Ledger Entry"."Location Code") { }
            column("Text"; Text) { }
            column(ItemLedgerEntry_DocumentNo; "Item Ledger Entry"."Document No.") { }
            column(ItemLedgerEntry_SourceNo; "Item Ledger Entry"."Source No.") { }
            column(ItemLedgerEntry_EntryType; "Item Ledger Entry"."Entry Type") { }
            column(ItemLedgerEntry_PostingDate; "Item Ledger Entry"."Posting Date") { }
            column(ItemLedgerEntry_ItemNo; "Item Ledger Entry"."Item No.") { }
            column(ItemLedgerEntry_EntryNo; "Item Ledger Entry"."Entry No.") { }
            trigger OnAfterGetRecord();
            begin
                if Item.Get("Item No.") then begin
                    Item.SetRange("Location Filter", "Location Code");
                    Item.CalcFields(Item.Inventory, Item."Net Invoiced Qty.");
                    if (Item."Net Invoiced Qty." = 0) and (Item.Inventory = 0) then
                        CurrReport.Skip();
                end;
                if Description <> '' then
                    Text := Description
                else
                    Text := Item.Description;
            end;

        }
    }
    requestpage
    {
        SaveValues = false;
    }

    trigger OnInitReport()
    begin
    end;

    trigger OnPostReport()
    begin
    end;

    trigger OnPreReport()
    begin
    end;

    var
        Item: Record Item;
        Text: Text[128];
        PageLbl: Label 'Page';
        ReportNameLbl: label 'ItemLedger - Negative Stock';
}