tableextension 50002 "Item Ledger Entry Ext." extends "Item Ledger Entry"
{
    fields
    {
        field(50000; "Item No. 2"; Code[20])
        {
            Caption = 'Item No. 2';
            DataClassification = AccountData;
        }
    }
}
