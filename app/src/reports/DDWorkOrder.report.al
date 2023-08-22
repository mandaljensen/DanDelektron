report 50000 "DD Work Order"
{
    DefaultLayout = RDLC;
    RDLCLayout = './src/layouts/WorkOrder.rdlc';
    Caption = 'Work Order';

    dataset
    {
        dataitem("Sales Header"; "Sales Header")
        {
            DataItemTableView = SORTING("Document Type", "No.") WHERE("Document Type" = CONST(Order));
            RequestFilterFields = "No.", "Sell-to Customer No.";
            RequestFilterHeading = 'Sales Order';
            dataitem(PageLoop; "Integer")
            {
                DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));
                column(No1_SalesHeader; "Sales Header"."No.")
                {
                }
                column(ShipmentDate_SalesHeader; Format(Today()))
                {
                }
                column(CompanyName; COMPANYPROPERTY.DisplayName())
                {
                }
                column(CustAddr1; ShipToAddr[1])
                {
                }
                column(CustAddr2; ShipToAddr[2])
                {
                }
                column(CustAddr3; ShipToAddr[3])
                {
                }
                column(CustAddr4; ShipToAddr[4])
                {
                }
                column(CustAddr5; ShipToAddr[5])
                {
                }
                column(CustAddr6; ShipToAddr[6])
                {
                }
                column(CustAddr7; ShipToAddr[7])
                {
                }
                column(CustAddr8; ShipToAddr[8])
                {
                }
                column(BillToAddressCaptionLbl; BillToAddressCaptionLbl)
                {
                }
                column(BillToAddr1; BillToAddr[1])
                {
                }
                column(BillToAddr2; BillToAddr[2])
                {
                }
                column(BillToAddr3; BillToAddr[3])
                {
                }
                column(BillToAddr4; BillToAddr[4])
                {
                }
                column(BillToAddr5; BillToAddr[5])
                {
                }
                column(BillToAddr6; BillToAddr[6])
                {
                }
                column(BillToAddr7; BillToAddr[7])
                {
                }
                column(BillToAddr8; BillToAddr[8])
                {
                }
                column(DateCaption; DateCaptionLbl)
                {
                }
                column(SalesOrderNoCaption; SalesOrderNoCaptionLbl)
                {
                }
                column(PageNoCaption; PageNoCaptionLbl)
                {
                }
                column(ExternalDocNoCaptionLbl; ExternalDocNoCaptionLbl)
                {
                }
                column(ExternalDocNo; "Sales Header"."External Document No.")
                {
                }
                column(WorkOrderCaption; WorkOrderCaptionLbl)
                {
                }
                column(SellToCustomerNoCaptionLbl; SellToCustomerNoCaptionLbl)
                {
                }
                column(SellToCustomerNo; "Sales Header"."Sell-to Customer No.")
                {
                }
                dataitem("Sales Line"; "Sales Line")
                {
                    DataItemLink = "Document Type" = FIELD("Document Type"), "Document No." = FIELD("No.");
                    DataItemLinkReference = "Sales Header";
                    DataItemTableView = SORTING("Document Type", "Document No.", "Line No.");
                    column(SalesLineNoCaptionLbl; SalesLineNoCaptionLbl)
                    {
                    }
                    column(No_SalesLine; noToShow)
                    {
                    }
                    column(Description_SalesLine; Description)
                    {
                        IncludeCaption = true;
                    }
                    column(Quantity_SalesLine; "Sales Line"."Qty. to Ship")
                    {
                        IncludeCaption = true;
                    }
                    column(UnitofMeasure_SalesLine; "Unit of Measure")
                    {
                        IncludeCaption = true;
                    }
                    column(QtyworkPostSalesOrderCptn; QtyworkPostSalesOrderCptnLbl)
                    {
                    }
                    column(QuantityUsedCaption; QuantityUsedCaptionLbl)
                    {
                    }
                    column(UnitofMeasureCaption; UnitofMeasureCaptionLbl)
                    {
                    }
                    column(ShelfNoCaptionLbl; ShelfNoCaptionLbl)
                    {
                    }
                    column(ShelfNo; Item."Shelf No.")
                    {
                    }
                    column(PromisedDeliveryDateCaptionLbl; PromisedDeliveryDateCaptionLbl)
                    {
                    }
                    column(Promised_Delivery_Date; Format("Promised Delivery Date"))
                    {
                    }

                    trigger OnAfterGetRecord()
                    begin
                        Clear(Item);
                        if "Sales Line".Type = "Sales Line".Type::Item then
                            if Item.Get("Sales Line"."No.") then
                                NoToShow := Item."No. 2";

                        if ("Sales Line".Type <> "Sales Line".Type::Item) or (NoToShow = '') then
                            NoToShow := "Sales Line"."No.";
                    end;
                }
                dataitem("Sales Comment Line"; "Sales Comment Line")
                {
                    DataItemLink = "Document Type" = FIELD("Document Type"), "No." = FIELD("No.");
                    DataItemLinkReference = "Sales Header";
                    DataItemTableView = WHERE("Document Line No." = CONST(0));
                    column(Date_SalesCommentLine; Format(Date))
                    {
                    }
                    column(Code_SalesCommentLine; Code)
                    {
                        IncludeCaption = true;
                    }
                    column(Comment_SalesCommentLine; Comment)
                    {
                        IncludeCaption = true;
                    }
                    column(CommentsCaption; CommentsCaptionLbl)
                    {
                    }
                    column(SalesCommentLineDtCptn; SalesCommentLineDtCptnLbl)
                    {
                    }
                }
            }

            trigger OnAfterGetRecord()
            begin
                FormatAddr.SalesHeaderBillTo(BillToAddr, "Sales Header");
                FormatAddr.SalesHeaderSellTo(CustAddr, "Sales Header");
                FormatAddr.SalesHeaderShipTo(ShipToAddr, CustAddr, "Sales Header");
            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        Item: Record Item;
        FormatAddr: Codeunit "Format Address";
        CustAddr: array[8] of Text[100];
        ShipToAddr: array[8] of Text[100];
        BillToAddr: array[8] of Text[100];
        NoToShow: Code[20];
        DateCaptionLbl: Label 'Date';
        SalesOrderNoCaptionLbl: Label 'Sales Order No.';
        PageNoCaptionLbl: Label 'Page';
        WorkOrderCaptionLbl: Label 'Work Order';
        QtyworkPostSalesOrderCptnLbl: Label 'Quantity used during work (Posted with the Sales Order)';
        QuantityUsedCaptionLbl: Label 'Quantity Used';
        UnitofMeasureCaptionLbl: Label 'Unit of Measure';
        CommentsCaptionLbl: Label 'Comments';
        SalesCommentLineDtCptnLbl: Label 'Date';
        ExternalDocNoCaptionLbl: Label 'External Document No.';
        ShelfNoCaptionLbl: label 'Shelf No.';
        BillToAddressCaptionLbl: Label 'Bill-To Address';
        PromisedDeliveryDateCaptionLbl: label 'Delivery Date';
        SalesLineNoCaptionLbl: label 'No.';
        SellToCustomerNoCaptionLbl: Label 'Sell-to Customer No.';
}

