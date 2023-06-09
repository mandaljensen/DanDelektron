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
        JobsSetup.Get();
        if (Job."No." <> '') and (JobsSetup."Default Job Task No." <> '') then
            if not JobTask.Get(Job."No.", JobsSetup."Default Job Task No.") then begin
                JobTask.Init();
                JobTask."Job No." := Job."No.";
                JobTask."Job Task No." := JobsSetup."Default Job Task No.";
                JobTask."Job Posting Group" := Job."Job Posting Group";
                JobTask.Insert(true);
            end;
    end;
}
