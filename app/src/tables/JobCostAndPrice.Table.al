table 50000 "Job Cost And Price"
{
    Caption = 'Job Cost and Price';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Job No."; Code[20])
        {
            Caption = 'Job No.';
        }
        field(2; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
        }
        field(3; "Document No."; Code[20])
        {
            Caption = 'Document No.';
        }
        field(4; Type; Enum "Job Journal Line Type")
        {
            Caption = 'Type';
        }
        field(5; "No."; Code[20])
        {
            Caption = 'No.';
        }
        field(6; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(7; Quantity; Decimal)
        {
            Caption = 'Quantity';
        }
        field(8; "Resource Group No."; Code[20])
        {
            Caption = 'Resource Group No.';
        }
        field(9; "Unit of Measure"; Code[20])
        {
            Caption = 'Unit of Measure';
        }
        field(10; "Location Code"; Code[20])
        {
            Caption = 'Location Code';
        }
        field(11; "Dimension 1"; Code[20])
        {
            Caption = 'Dimension 1';
        }
        field(12; "Dimension 2"; Code[20])
        {
            Caption = 'Dimension 2';
        }
        field(13; "Work Type Code"; Code[20])
        {
            Caption = 'Work Type Code';
        }
        field(14; "Customer Price Group"; Code[20])
        {
            Caption = 'Customer Price Group';
        }
        field(15; "Document Date"; Date)
        {
            Caption = 'Document Date';
        }
        field(16; "Job Task No."; Code[20])
        {
            Caption = 'Job Task No.';
        }
        field(17; "Unit Price"; Decimal)
        {
            Caption = 'Unit Price';
        }
        field(18; "Line Type"; Enum "Job Line Type")
        {
            Caption = 'Line Type';
        }
        field(19; "Line Discount %"; Decimal)
        {
            Caption = 'Line Discount %';
        }
        field(20; "Currency Code"; Code[20])
        {
            Caption = 'Currency Code';
        }
        field(21; "Currency Factor"; Decimal)
        {
            Caption = 'Currency Factor';
        }
        field(22; "Unit Cost"; Decimal)
        {
            Caption = 'Unit Cost';
        }
        field(23; "Description 2"; Text[100])
        {
            Caption = 'Description 2';
        }
        field(24; "Qty. per Unit of Measure"; Decimal)
        {
            Caption = 'Qty. per Unit of Measure';
        }
        field(25; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
        }
    }
    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }
}
