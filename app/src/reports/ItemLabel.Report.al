report 50004 "Item Label"
{
    ApplicationArea = All;
    Caption = 'Item Label';
    UsageCategory = ReportsAndAnalysis;
    RDLCLayout = './src/layouts/ItemLabel.rdlc';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem(Item; Item)
        {
            RequestFilterFields = "No.";
            column(No; NoToShow)
            {
            }
            column(Description; Description)
            {
            }
            column(Barcode1; EncodedText1)
            {
            }
            column(Barcode2; EncodedText2)
            {
            }

            trigger OnAfterGetRecord()
            begin
                ItemReference.Reset();
                ItemReference.SetRange("Item No.", Item."No.");
                ItemReference.SetRange("Reference Type", ItemReference."Reference Type"::"Bar Code");
                if not ItemReference.FindFirst() then
                    Clear(ItemReference);

                // Declare the barcode provider using the barcode provider interface and enum
                BarcodeFontProvider := Enum::"Barcode Font Provider"::IDAutomation1D;

                // Declare the font using the barcode symbology enum
                BarcodeSymbology := Enum::"Barcode Symbology"::Code128;

                // Set data string source 
                BarcodeString := ItemReference."Reference No.";

                // Validate the input. This method is not available for 2D provider
                BarcodeFontProvider.ValidateInput(BarcodeString, BarcodeSymbology);

                // Encode the data string to the barcode font
                EncodedText1 := BarcodeFontProvider.EncodeFont(BarcodeString, BarcodeSymbology);

                //EncodedText1 := '*' + ItemReference."Reference No." + '*';
                //EncodedText2 := CalculateEAN13(3, ItemReference."Reference No.");

                case "Gen. Prod. Posting Group" of
                    'UPS01', 'UPS02', 'UPS04':
                        NoToShow := FORMAT("No.");
                    else
                        NoToShow := FORMAT("No. 2");
                end;
            end;
        }
    }

    local procedure CalculateEAN13(BarcodeType: Integer; EANnummer: Code[20]): Text[30]
    var
        Streg: Text[13];
        Styr: array[3] of Text[2];
        i: Integer;
        K: Integer;
        EANValue: array[20] of Text[1];
        TabelIndhold: array[3, 10] of Text[10];
        InvalidEANErr: Label 'ERROR: EAN No. %1 contains invalid character (%2)!';
    begin
        if EANnummer = '' then exit;

        Streg := EANnummer;
        Streg := DELCHR(Streg, '=', '0123456789');
        if Streg <> '' then
            ERROR(InvalidEANErr, EANnummer, Tegn);

        EVALUATE(Checkciffer, COPYSTR(EANnummer, 1, 1));

        case BarcodeType of
            1:
                begin
                    Styr[1] := '"';
                    Styr[2] := '#';
                    Styr[3] := '$';
                    TabelPointer := 1;
                end;
            2:
                begin
                    Styr[1] := ' "';
                    Styr[2] := '#';
                    Styr[3] := '$';
                    TabelPointer := 1;
                end;
            3:
                begin
                    Styr[1] := FORMAT(Checkciffer) + '%';
                    Styr[2] := '&';
                    Styr[3] := '''';
                    TabelPointer := 2;
                end;
        end;

        for J := 2 to 13 do
            EANValue[J - 1] := PADSTR(COPYSTR(EANnummer, J, 1), 1);

        if Tabel[1] [1] [1] = '' then begin
            TabelIndhold[1] [1] := 'ABCDEFGHIJ';
            TabelIndhold[1] [2] := 'KLMNOPQRST';
            TabelIndhold[1] [3] := 'UVWXYZ[\]^';

            TabelIndhold[2] [1] := 'abcdefghij';
            TabelIndhold[2] [2] := 'klmnopqrst';
            TabelIndhold[2] [3] := 'uvwxyz{|}~';

            for i := 1 to 2 do
                for J := 1 to 3 do
                    for K := 1 to 10 do
                        Tabel[i] [J] [K] := COPYSTR(TabelIndhold[i] [J], K, 1);

            TabelValg[1] := '111111';
            TabelValg[2] := '112122';
            TabelValg[3] := '112212';
            TabelValg[4] := '112221';
            TabelValg[5] := '121122';
            TabelValg[6] := '122112';
            TabelValg[7] := '122211';
            TabelValg[8] := '121212';
            TabelValg[9] := '121221';
            TabelValg[10] := '122121';
            TabelValg[11] := '333333';
        end;

        for J := 1 to 12 do
            if J <> 6 then
                Streg := Streg + CodeEAN(EANValue[J])
            else
                Streg := Streg + CodeEAN(EANValue[J]) + Styr[2];

        exit(Styr[1] + Streg + Styr[3]);
    end;

    local procedure CodeEAN(Intkode: Text[1]): Text[1]
    var
        AktuelNr: Integer;
        Coding: Integer;
    begin
        AktuelNr := STRPOS('0123456789', IntKode);
        if J < 7 then
            Evaluate(Coding, CopyStr(TabelValg[Checkciffer + 1], J, 1))
        else
            Coding := 3;
        Tegn := Tabel[TabelPointer] [Coding] [AktuelNr];
        exit(Tegn);
    end;

    var
        ItemReference: Record "Item Reference";
        EncodedText1: Text;
        EncodedText2: Text;
        NoToShow: Code[20];
        TabelValg: array[11] of Text[11];
        Checkciffer: Integer;
        Tabel: array[2, 3, 10] of Text[9];
        Tegn: Text[1];
        TabelPointer: Integer;
        J: Integer;
        BarcodeString: Text;
        BarcodeSymbology: Enum "Barcode Symbology";
        BarcodeFontProvider: Interface "Barcode Font Provider";
}
