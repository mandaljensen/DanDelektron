codeunit 50000 "Dan Delektron Subscribers"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Jnl.-Post Line", 'OnAfterInitItemLedgEntry', '', true, false)]
    local procedure TransferAdditionalItemInfoToLedter(var NewItemLedgEntry: Record "Item Ledger Entry"; var ItemJournalLine: Record "Item Journal Line"; var ItemLedgEntryNo: Integer)
    var
        Item: Record Item;
    begin
        if not Item.Get(NewItemLedgEntry."Item No.") then
            Clear(Item);

        NewItemLedgEntry."Item No. 2" := Item."No. 2";
    end;

    [EventSubscriber(ObjectType::Table, Database::Job, 'OnAfterSellToCustomerNoUpdated', '', true, false)]
    local procedure CreateDefaultJobTask(var Job: Record Job; xJob: Record Job; SellToCustomer: Record Customer)
    var
        JobsSetup: Record "Jobs Setup";
        JobTask: Record "Job Task";
    begin
        if Job."No." = '' then
            Job.Insert(true);

        JobsSetup.Get();
        if JobsSetup."Default Job Task No." <> '' then
            if not JobTask.Get(Job."No.", JobsSetup."Default Job Task No.") then begin
                JobTask.Init();
                JobTask."Job No." := Job."No.";
                JobTask."Job Task No." := JobsSetup."Default Job Task No.";
                JobTask."Job Posting Group" := Job."Job Posting Group";
                JobTask.Insert(true);
            end;
    end;

    [EventSubscriber(ObjectType::Page, Page::"Job Card", 'OnNewRecordEvent', '', true, false)]
    local procedure SetStatus(var Rec: Record Job; var xRec: Record Job; BelowxRec: Boolean)
    begin
        Rec.Status := Rec.Status::Planning;
    end;

    [EventSubscriber(ObjectType::Table, Database::Job, 'OnBeforeValidateStatus', '', true, false)]
    local procedure CheckExternalDocNo(var Job: Record Job; xJob: Record Job; CurrentFieldNo: Integer; var IsHandled: Boolean)
    begin
        if Job.Status = xJob.Status then
            exit;

        if Job.Status <> Job.Status::Open then
            exit;

        Job.TestField("External Document No.");
    end;

    [EventSubscriber(ObjectType::Table, Database::"Vendor Ledger Entry", 'OnBeforeSetStyle', '', false, false)]
    local procedure OnBeforeSetStyleOnClosedEntry(sender: Record "Vendor Ledger Entry"; var Result: Text; var IsHandled: Boolean)
    begin
        if not sender.Open then begin
            Result := '';
            IsHandled := true;
        end;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Purchase Line", OnBeforeSetVendorItemNo, '', false, false)]
    local procedure OnBeforeSetVendorItemNo(var PurchaseLine: Record "Purchase Line"; var IsHandled: Boolean);
    var
        Itemvend: Record "Item Vendor";
        Item: Record Item;
    begin
        item.Get(PurchaseLine."No.");

        ItemVend.Init();
        ItemVend."Vendor No." := PurchaseLine."Buy-from Vendor No.";
        ItemVend."Variant Code" := PurchaseLine."Variant Code";

        Item.FindItemVend(ItemVend, PurchaseLine."Location Code");
        if Itemvend."Vendor No." = PurchaseLine."Buy-from Vendor No." then
            PurchaseLine.Validate("Vendor Item No.", ItemVend."Vendor Item No.");
        IsHandled := true;

    end;

    [EventSubscriber(ObjectType::Table, Database::Job, 'OnBeforeUpdateOverBudgetValue', '', true, false)]
    local procedure SetIsHandledTemp(var Job: Record Job; JobNo: Code[20]; Usage: Boolean; Cost: Decimal; var IsHandled: Boolean)
    begin
        IsHandled := true;
    end;
}
