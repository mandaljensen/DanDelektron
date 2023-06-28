tableextension 50004 "Item Ext." extends Item
{
    fields
    {
        field(50000; "Main Location"; Decimal)
        {
            Caption = 'Main Location';
            FieldClass = FlowField;
            CalcFormula = sum("Item Ledger Entry".Quantity where("Location Code" = const('HOVEDLAGER'), "Item No." = field("No.")));
            Editable = false;
            DecimalPlaces = 0 : 2;
        }
    }

    fieldgroups
    {
        addlast(DropDown; "No. 2", "Main Location")
        { }
    }
}
