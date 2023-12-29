/// <summary>
/// Report Purchase - Order Servitec (ID 50002).
/// </summary>
Report 50002 "Purchase - Order Servitec"
{
    Permissions = TableData 7190 = rimd;

    DefaultLayout = RDLC;

    RDLCLayout = './src/report/layout/purchase.rdlc';
    CaptionML = ENU = 'Purchase - Order Servitec',
               ESP = 'Compras - Pedido Servitec';


    dataset
    {
        dataItem("Purchase Header"; "Purchase Header")
        {
            DataItemTableView = SORTING("Document Type", "No.")
                                 WHERE("Document Type" = CONST(Order));
            RequestFilterHeadingML = ENU = 'Purchase Order',
                                   ESP = 'Pedido compra';


            RequestFilterFields = "No.", "Buy-from Vendor No.", "No. Printed";

            column(DocType_PurchHeader;
            "Document Type")
            { }

            column(No_PurchHeader;
            "No.")
            { }

            column(HomepageCaption;
            HomepageCaptionLbl)
            { }

            column(EmailCaption;
            EmailCaptionLbl)
            { }

            column(AmtCaption;
            AmtCaptionLbl)
            { }

            column(PaymentTermsCaption;
            PaymentTermsCaptionLbl)
            { }

            column(ShpMethodCaption;
            ShpMethodCaptionLbl)
            { }

            column(PrePmtTermsDescCaption;
            PrePmtTermsDescCaptionLbl)
            { }

            column(DocDateCaption;
            DocDateCaptionLbl)
            { }

            column(AllowInvDiscCaption;
            AllowInvDiscCaptionLbl)
            { }


            DataItem(CopyLoop; Integer)
            {
                DataItemTableView = SORTING(Number);

                DataItem(PageLoop; Integer)
                {
                    DataItemTableView = SORTING(Number)
                                 WHERE(Number = CONST(1));
                    column(OrderCopyText;
                    STRSUBSTNO(Text004, CopyText))
                    { }

                    column(CompanyAddr1;
                    CompanyAddr[1])
                    { }

                    column(CompanyAddr2;
                    CompanyAddr[2])
                    { }

                    column(CompanyAddr3;
                    CompanyAddr[3])
                    { }

                    column(CompanyAddr4;
                    CompanyAddr[4])
                    { }

                    column(CompanyInfoPhoneNo;
                    CompanyInfo."Phone No.")
                    { }

                    column(CompanyInfoHomepage;
                    CompanyInfo."Home Page")
                    { }

                    column(CompanyInfoEmail;
                    CompanyInfo."E-Mail")
                    { }

                    column(CompanyInfoVATRegNo;
                    CompanyInfo."VAT Registration No.")
                    { }

                    column(CompanyInfoGiroNo;
                    CompanyInfo."Giro No.")
                    { }

                    column(CompanyInfoBankName;
                    CompanyInfo."Bank Name")
                    { }

                    column(CompanyInfoBankAccNo;
                    CompanyInfo."Bank Account No.")
                    { }

                    column(DocDate_PurchHeader;
                    FORMAT("Purchase Header"."Document Date", 0, 4))
                    { }

                    column(VATNoText;
                    VATNoText)
                    { }

                    column(VATRegNo_PurchHeader;
                    "Purchase Header"."VAT Registration No.")
                    { }

                    column(PurchaserText;
                    PurchaserText)
                    { }

                    column(SalesPurchPersonName;
                    SalesPurchPerson.Name)
                    { }

                    column(ReferenceText;
                    ReferenceText)
                    { }

                    column(YourReference_PurchHeader;
                    "Purchase Header"."Your Reference")
                    { }

                    column(CompanyAddr5;
                    CompanyAddr[5])
                    { }

                    column(CompanyAddr6;
                    CompanyAddr[6])
                    { }

                    column(BuyfromVenNo_PurchHeader;
                    "Purchase Header"."Buy-from Vendor No.")
                    { }

                    column(BuyFromAddr1;
                    BuyFromAddr[1])
                    { }

                    column(BuyFromAddr2;
                    BuyFromAddr[2])
                    { }

                    column(BuyFromAddr3;
                    BuyFromAddr[3])
                    { }

                    column(BuyFromAddr4;
                    BuyFromAddr[4])
                    { }

                    column(BuyFromAddr5;
                    BuyFromAddr[5])
                    { }

                    column(BuyFromAddr6;
                    BuyFromAddr[6])
                    { }

                    column(BuyFromAddr7;
                    BuyFromAddr[7])
                    { }

                    column(BuyFromAddr8;
                    BuyFromAddr[8])
                    { }

                    column(PricesIncludingVAT_PurchHeader;
                    "Purchase Header"."Prices Including VAT")
                    { }

                    column(OutputNo;
                    OutputNo)
                    { }

                    column(VATBaseDisc_PurchHeader;
                    "Purchase Header"."VAT Base Discount %")
                    { }

                    column(PricesInclVATtxt;
                    PricesInclVATtxt)
                    { }

                    column(ShowInternalInfo;
                    ShowInternalInfo)
                    { }

                    column(PrepmtPayTermsDesc;
                    PrepmtPaymentTerms.Description)
                    { }

                    column(PayTermsDesc;
                    PaymentTerms.Description)
                    { }

                    column(ShipMethodDesc;
                    ShipmentMethod.Description)
                    { }

                    column(PhoneNoCaption;
                    PhoneNoCaptionLbl)
                    { }

                    column(VATRegNoCaption;
                    VATRegNoCaptionLbl)
                    { }

                    column(GiroNoCaption;
                    GiroNoCaptionLbl)
                    { }

                    column(BankCaption;
                    BankCaptionLbl)
                    { }

                    column(BankAccNoCaption;
                    BankAccNoCaptionLbl)
                    { }

                    column(OrderNoCaption;
                    OrderNoCaptionLbl)
                    { }

                    column(PageCaption;
                    PageCaptionLbl)
                    { }

                    column(BuyfromVenNo_PurchHeaderCaption;
                    "Purchase Header".FIELDCAPTION("Buy-from Vendor No."))
                    { }

                    column(PricesIncludingVAT_PurchHeaderCaption;
                    "Purchase Header".FIELDCAPTION("Prices Including VAT"))
                    { }

                    column(CACCaption;
                    CACCaptionLbl)
                    { }

                    column(FormaDePago;
                    recFormaDePago.Description)
                    { }

                    column(NumPedidoProv;
                    "Purchase Header"."Vendor Order No.")
                    { }

                    column(FechaVencimiento;
                    "Purchase Header"."Due Date")
                    { }


                    column(CompanyInfo3Picture;
                    CompanyInfo3.Picture)
                    { }



                    dataItem(DimensionLoop1; Integer)
                    {
                        DataItemTableView = SORTING(Number)
                                 WHERE(Number = FILTER(1 ..));


                        DataItemLinkReference = "Purchase Header";

                        column(DimText; DimText) { }

                        column(HdrDimsCaption; HdrDimsCaptionLbl) { }
                        trigger OnPreDataItem()
                        BEGIN
                            IF NOT ShowInternalInfo THEN
                                CurrReport.BREAK;
                        END;

                        trigger OnAfterGetRecord()
                        BEGIN
                            IF Number = 1 THEN BEGIN
                                IF NOT DimSetEntry1.FINDSET THEN
                                    CurrReport.BREAK;
                            END ELSE
                                IF NOT Continue THEN
                                    CurrReport.BREAK;

                            CLEAR(DimText);
                            Continue := FALSE;
                            REPEAT
                                OldDimText := DimText;
                                IF DimText = '' THEN
                                    DimText := STRSUBSTNO('%1 %2', DimSetEntry1."Dimension Code", DimSetEntry1."Dimension Value Code")
                                ELSE
                                    DimText :=
                                    STRSUBSTNO(
                                        '%1, %2 %3', DimText,
                                        DimSetEntry1."Dimension Code", DimSetEntry1."Dimension Value Code");
                                IF STRLEN(DimText) > MAXSTRLEN(OldDimText) THEN BEGIN
                                    DimText := OldDimText;
                                    Continue := TRUE;
                                    EXIT;
                                END;
                            UNTIL DimSetEntry1.NEXT = 0;
                        END;
                    }

                    dataItem("Purchase Line"; "Purchase Line")
                    {
                        DataItemTableView = SORTING("Document Type", "Document No.", "Line No.");
                        DataItemLinkReference = "Purchase Header";
                        DataItemLink = "Document Type" = FIELD("Document Type"),
                            "Document No." = FIELD("No.");
                        trigger OnPreDataItem()
                        BEGIN
                            CurrReport.BREAK;
                        END;
                    }

                    dataItem(RoundLoop; Integer)
                    {
                        DataItemTableView = SORTING(Number);
                        Column(PurchLineLineAmt;
                        PurchLine."Line Amount")
                        {
                            AutoFormatType = 1;
                            AutoFormatExpression = "Purchase Line"."Currency Code";
                        }

                        Column(Desc_PurchLine;
                        "Purchase Line".Description)
                        { }

                        Column(LineNo_PurchLine;
                        "Purchase Line"."Line No.")
                        { }

                        Column(AllowInvDisctxt;
                        AllowInvDisctxt)
                        { }

                        Column(Type_PurchLine;
                        FORMAT("Purchase Line".Type, 0, 2))
                        { }

                        Column(No_PurchLine;
                        "Purchase Line"."No.")
                        { }

                        Column(Quantity_PurchLine;
                        "Purchase Line".Quantity)
                        { }

                        Column(UnitofMeasure_PurchLine;
                        "Purchase Line"."Unit of Measure")
                        { }

                        Column(DirectUnitCost_PurchLine;
                        "Purchase Line"."Direct Unit Cost")
                        {
                            AutoFormatType = 2;
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                        }

                        Column(LineDisc_PurchLine;
                        "Purchase Line"."Line Discount %")
                        { }

                        Column(LineAmt_PurchLine;
                        "Purchase Line"."Line Amount")
                        {
                            AutoFormatType = 1;
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                        }

                        Column(AllowInvDisc_PurchLine;
                        "Purchase Line"."Allow Invoice Disc.")
                        { }

                        Column(VATIdentifier_PurchLine;
                        "Purchase Line"."VAT Identifier")
                        { }

                        Column(InvDiscAmt_PurchLine;
                        -PurchLine."Inv. Discount Amount")
                        {
                            AutoFormatType = 1;
                            AutoFormatExpression = "Purchase Line"."Currency Code";
                        }

                        Column(LineAmtInvDiscAmt_PurchLine;
                        -PurchLine."Pmt. Discount Amount")
                        {
                            AutoFormatType = 1;
                            AutoFormatExpression = "Purchase Line"."Currency Code";
                        }

                        Column(TotalInclVATText;
                        TotalInclVATText)
                        { }

                        Column(VATAmtLineText;
                        VATAmountLine.VATAmountText)
                        { }

                        Column(VATAmt;
                        VATAmount)
                        {
                            AutoFormatType = 1;
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                        }

                        Column(TotalExclVATText;
                        TotalExclVATText)
                        { }

                        Column(VATDiscAmt;
                        -VATDiscountAmount)
                        {
                            AutoFormatType = 1;
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                        }

                        Column(VATBaseAmt;
                        VATBaseAmount)
                        {
                            AutoFormatType = 1;
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                        }

                        Column(TotalAmtInclVAT;
                        TotalAmountInclVAT)
                        {
                            AutoFormatType = 1;
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                        }

                        Column(TotalSubTotal;
                        TotalSubTotal)
                        {
                            AutoFormatType = 1;
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                        }

                        Column(TotalInvDiscAmt;
                        TotalInvoiceDiscountAmount)
                        {
                            AutoFormatType = 1;
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                        }

                        Column(TotalAmt;
                        TotalAmount)
                        {
                            AutoFormatType = 1;
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                        }

                        Column(DirectUnitCostCaption;
                        DirectUnitCostCaptionLbl)
                        { }

                        Column(DiscountPercentCaption;
                        DiscountPercentCaptionLbl)
                        { }

                        Column(InvDiscAmtCaption;
                        InvDiscAmtCaptionLbl)
                        { }

                        Column(SubtotalCaption;
                        SubtotalCaptionLbl)
                        { }

                        Column(TotalText;
                        TotalTextLbl)
                        { }

                        Column(VATDiscountAmtCaption;
                        VATDiscountAmtCaptionLbl)
                        { }

                        Column(Desc_PurchLineCaption;
                        "Purchase Line".FIELDCAPTION(Description))
                        { }

                        Column(No_PurchLineCaption;
                        "Purchase Line".FIELDCAPTION("No."))
                        { }

                        Column(Quantity_PurchLineCaption;
                        "Purchase Line".FIELDCAPTION(Quantity))
                        { }

                        Column(UnitofMeasure_PurchLineCaption;
                        "Purchase Line".FIELDCAPTION("Unit of Measure"))
                        { }

                        Column(VATIdentifier_PurchLineCaption;
                        "Purchase Line".FIELDCAPTION("VAT Identifier"))
                        { }




                        DataItem(DimensionLoop2; Integer)
                        {
                            DataItemTableView = SORTING(Number)
                                 WHERE(Number = FILTER(1 ..));


                            Column(DimText1;
                            DimText)
                            { }

                            Column(LineDimsCaption;
                            LineDimsCaptionLbl)
                            { }

                            trigger OnPreDataItem()
                            BEGIN
                                IF NOT ShowInternalInfo THEN
                                    CurrReport.BREAK;

                                DimSetEntry2.SETRANGE("Dimension Set ID", "Purchase Line"."Dimension Set ID");
                            END;

                            trigger OnAfterGetRecord()
                            BEGIN
                                IF Number = 1 THEN BEGIN
                                    IF NOT DimSetEntry2.FINDSET THEN
                                        CurrReport.BREAK;
                                END ELSE
                                    IF NOT Continue THEN
                                        CurrReport.BREAK;

                                CLEAR(DimText);
                                Continue := FALSE;
                                REPEAT
                                    OldDimText := DimText;
                                    IF DimText = '' THEN
                                        DimText := STRSUBSTNO('%1 %2', DimSetEntry2."Dimension Code", DimSetEntry2."Dimension Value Code")
                                    ELSE
                                        DimText :=
                                          STRSUBSTNO(
                                            '%1, %2 %3', DimText,
                                            DimSetEntry2."Dimension Code", DimSetEntry2."Dimension Value Code");
                                    IF STRLEN(DimText) > MAXSTRLEN(OldDimText) THEN BEGIN
                                        DimText := OldDimText;
                                        Continue := TRUE;
                                        EXIT;
                                    END;
                                UNTIL DimSetEntry2.NEXT = 0;
                            END;
                        }
                        trigger OnPreDataItem()
                        begin
                            MoreLines := PurchLine.FIND('+');
                            WHILE MoreLines AND (PurchLine.Description = '') AND (PurchLine."Description 2" = '') AND
                                (PurchLine."No." = '') AND (PurchLine.Quantity = 0) AND
                                (PurchLine.Amount = 0) DO
                                MoreLines := PurchLine.NEXT(-1) <> 0;
                            IF NOT MoreLines THEN
                                CurrReport.BREAK;
                            PurchLine.SETRANGE("Line No.", 0, PurchLine."Line No.");
                            SETRANGE(Number, 1, PurchLine.COUNT);
                            CurrReport.CREATETOTALS(PurchLine."Line Amount", PurchLine."Inv. Discount Amount", PurchLine."Pmt. Discount Amount");
                        end;

                        trigger OnAfterGetRecord()
                        begin
                            IF Number = 1 THEN
                                PurchLine.FIND('-')
                            ELSE
                                PurchLine.NEXT;
                            "Purchase Line" := PurchLine;

                            IF NOT "Purchase Header"."Prices Including VAT" AND
                            (PurchLine."VAT Calculation Type" = PurchLine."VAT Calculation Type"::"Full VAT")
                            THEN
                                PurchLine."Line Amount" := 0;

                            IF (PurchLine.Type = PurchLine.Type::"G/L Account") AND (NOT ShowInternalInfo) THEN
                                "Purchase Line"."No." := '';
                            AllowInvDisctxt := FORMAT("Purchase Line"."Allow Invoice Disc.");
                            TotalSubTotal += "Purchase Line"."Line Amount";
                            TotalInvoiceDiscountAmount -= "Purchase Line"."Inv. Discount Amount";
                            TotalAmount += "Purchase Line".Amount;
                        end;

                        trigger OnPostDataItem()
                        begin
                            PurchLine.DELETEALL;
                        end;
                    }

                    DataItem(VATCounter; Integer)
                    {
                        DataItemTableView = SORTING(Number);

                        Column(VATAmtLineVATECBase;
                        VATAmountLine."VAT Base")
                        {
                            AutoFormatType = 1;
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                        }

                        Column(VATAmtLineVATAmt;
                        VATAmountLine."VAT Amount")
                        {
                            AutoFormatType = 1;
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                        }

                        Column(VATAmtLineLineAmt;
                        VATAmountLine."Line Amount")
                        {
                            AutoFormatType = 1;
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                        }

                        Column(VATAmtLineInvDiscBaseAmt;
                        VATAmountLine."Inv. Disc. Base Amount")
                        {
                            AutoFormatType = 1;
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                        }

                        Column(VATAmtLineInvDiscAmtPmtDiscGivenAmt;
                        VATAmountLine."Invoice Discount Amount" + VATAmountLine."Pmt. Discount Amount")
                        {
                            AutoFormatType = 1;
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                        }

                        Column(VATAmtLineECAmt;
                        VATAmountLine."EC Amount")
                        {
                            AutoFormatType = 1;
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                        }

                        Column(VATAmtLineVAT1; VATAmountLine."VAT %")
                        {
                            DecimalPlaces = 0 : 6;
                        }

                        Column(VATAmtLineVATIdentifier;
                        VATAmountLine."VAT Identifier")
                        { }

                        Column(VATAmtLineInvDiscAmt1;
                        VATAmountLine."Invoice Discount Amount" + VATAmountLine."Pmt. Discount Amount")
                        {
                            AutoFormatType = 1;
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                        }

                        Column(VATAmtLineEC;
                        VATAmountLine."EC %")
                        {
                            AutoFormatType = 1;
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                        }

                        Column(VATPercentCaption;
                        VATPercentCaptionLbl)
                        { }

                        Column(VATBaseCaption;
                        VATBaseCaptionLbl)
                        { }

                        Column(VATAmtCaption;
                        VATAmtCaptionLbl)
                        { }

                        Column(VATAmtSpecCaption;
                        VATAmtSpecCaptionLbl)
                        { }

                        Column(VATIdentCaption;
                        VATIdentCaptionLbl)
                        { }

                        Column(InvDiscBaseAmtCaption;
                        InvDiscBaseAmtCaptionLbl)
                        { }

                        Column(LineAmtCaption;
                        LineAmtCaptionLbl)
                        { }

                        Column(InvDiscAmt1Caption;
                        InvDiscAmt1CaptionLbl)
                        { }

                        Column(ECAmtCaption;
                        ECAmtCaptionLbl)
                        { }

                        Column(ECCaption;
                        ECCaptionLbl)
                        { }

                        Column(TotalCaption;
                        TotalCaptionLbl)
                        { }



                        trigger OnPreDataItem()
                        BEGIN
                            IF (VATAmount = 0) AND (VATAmountLine."VAT %" + VATAmountLine."EC %" = 0) THEN
                                CurrReport.BREAK;
                            SETRANGE(Number, 1, VATAmountLine.COUNT);
                            CurrReport.CREATETOTALS(
                                VATAmountLine."Line Amount", VATAmountLine."Inv. Disc. Base Amount",
                                VATAmountLine."Invoice Discount Amount", VATAmountLine."VAT Base", VATAmountLine."VAT Amount",
                                VATAmountLine."EC Amount", VATAmountLine."Pmt. Discount Amount");
                        END;

                        trigger OnAfterGetRecord()
                        BEGIN
                            VATAmountLine.GetLine(Number);
                        END;
                    }
                    dataItem(VATCounterLCY; Integer)
                    {
                        DataItemTableView = SORTING(Number);
                        Column(VALExchRate
                    ; VALExchRate)
                        { }

                        Column(VALSpecLCYHdr
                    ; VALSpecLCYHeader)
                        { }

                        Column(VALVATAmtLCY
                    ; VALVATAmountLCY)
                        {
                            ; AutoFormatType = 1;
                        }

                        Column(VALVATBaseLCY
                    ; VALVATBaseLCY)
                        {
                            ; AutoFormatType = 1;
                        }

                        Column(VATAmtLineVAT2
                    ; VATAmountLine."VAT %")
                        {
                            DecimalPlaces = 0 : 5;
                        }

                        Column(VATAmtLineVATIdentifier3
                    ; VATAmountLine."VAT Identifier")
                        { }

                        trigger OnPreDataItem()
                        BEGIN
                            IF (NOT GLSetup."Print VAT specification in LCY") OR
                                ("Purchase Header"."Currency Code" = '') OR
                                (VATAmountLine.GetTotalVATAmount = 0) THEN
                                CurrReport.BREAK;

                            SETRANGE(Number, 1, VATAmountLine.COUNT);
                            CurrReport.CREATETOTALS(VALVATBaseLCY, VALVATAmountLCY);

                            IF GLSetup."LCY Code" = '' THEN
                                VALSpecLCYHeader := Text007 + Text008
                            ELSE
                                VALSpecLCYHeader := Text007 + FORMAT(GLSetup."LCY Code");

                            CurrExchRate.FindCurrency("Purchase Header"."Posting Date", "Purchase Header"."Currency Code", 1);
                            VALExchRate := STRSUBSTNO(Text009, CurrExchRate."Relational Exch. Rate Amount", CurrExchRate."Exchange Rate Amount");
                        END;

                        trigger OnAfterGetRecord()
                        BEGIN
                            VATAmountLine.GetLine(Number);
                            VALVATBaseLCY :=
                            VATAmountLine.GetBaseLCY(
                                "Purchase Header"."Posting Date", "Purchase Header"."Currency Code", "Purchase Header"."Currency Factor");
                            VALVATAmountLCY :=
                            VATAmountLine.GetAmountLCY(
                                "Purchase Header"."Posting Date", "Purchase Header"."Currency Code", "Purchase Header"."Currency Factor");
                        END;
                    }
                    dataItem(Total; Integer)
                    {
                        DataItemTableView = SORTING(Number)
                                            WHERE(Number = CONST(1));
                    }

                    dataItem(Total2; Integer)
                    {
                        DataItemTableView = SORTING(Number)
                            WHERE(Number = CONST(1));
                        Column(PaytoVendNo_PurchHeader;
                        "Purchase Header"."Pay-to Vendor No.")
                        { }

                        Column(VendAddr8;
                        VendAddr[8])
                        { }

                        Column(VendAddr7;
                        VendAddr[7])
                        { }

                        Column(VendAddr6;
                        VendAddr[6])
                        { }

                        Column(VendAddr5;
                        VendAddr[5])
                        { }

                        Column(VendAddr4;
                        VendAddr[4])
                        { }

                        Column(VendAddr3;
                        VendAddr[3])
                        { }

                        Column(VendAddr2;
                        VendAddr[2])
                        { }

                        Column(VendAddr1;
                        VendAddr[1])
                        { }

                        Column(PaymentDetailsCaption;
                        PaymentDetailsCaptionLbl)
                        { }

                        Column(VendNoCaption;
                        VendNoCaptionLbl)
                        { }

                        trigger OnPreDataItem()
                        BEGIN
                            IF "Purchase Header"."Buy-from Vendor No." = "Purchase Header"."Pay-to Vendor No." THEN
                                CurrReport.BREAK;
                        END;
                    }

                    dataItem(Total3; Integer)
                    {
                        DataItemTableView = SORTING(Number)
                                        WHERE(Number = CONST(1));
                        Column(SelltoCustNo_PurchHeader;
                        "Purchase Header"."Sell-to Customer No.")
                        { }

                        Column(ShipToAddr1;
                        ShipToAddr[1])
                        { }

                        Column(ShipToAddr2;
                        ShipToAddr[2])
                        { }

                        Column(ShipToAddr3;
                        ShipToAddr[3])
                        { }

                        Column(ShipToAddr4;
                        ShipToAddr[4])
                        { }

                        Column(ShipToAddr5;
                        ShipToAddr[5])
                        { }

                        Column(ShipToAddr6;
                        ShipToAddr[6])
                        { }

                        Column(ShipToAddr7;
                        ShipToAddr[7])
                        { }

                        Column(ShipToAddr8;
                        ShipToAddr[8])
                        { }

                        Column(ShiptoAddCaption;
                        ShiptoAddCaptionLbl)
                        { }

                        Column(SelltoCustNo_PurchHeaderCaption;
                        "Purchase Header".FIELDCAPTION("Sell-to Customer No."))
                        { }

                        trigger OnPreDataItem()
                        BEGIN
                            IF ("Purchase Header"."Sell-to Customer No." = '') AND (ShipToAddr[1] = '') THEN
                                CurrReport.BREAK;
                        END;
                    }


                    dataItem(PrepmtLoop; Integer)
                    {
                        DataItemTableView = SORTING(Number)
                            WHERE(Number = FILTER(1 ..));
                        Column(PrepmtLineAmt;
                        PrepmtLineAmount)
                        {
                            AutoFormatType = 1;
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                        }

                        Column(PrepmtInvBufGLAccNo;
                        PrepmtInvBuf."G/L Account No.")
                        { }

                        Column(PrepmtInvBufDesc;
                        PrepmtInvBuf.Description)
                        { }

                        Column(TotalExclVATText1;
                        TotalExclVATText)
                        { }

                        Column(PrepmtVATAmtLineTxt;
                        PrepmtVATAmountLine.VATAmountText)
                        { }

                        Column(PrepmtVATAmt;
                        PrepmtVATAmount)
                        {
                            AutoFormatType = 1;
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                        }

                        Column(TotalInclVATTxt1;
                        TotalInclVATText)
                        { }

                        Column(PrepmtInvBufAmtPrepmtVATAmt;
                        PrepmtInvBuf.Amount + PrepmtVATAmount)
                        {
                            AutoFormatType = 1;
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                        }

                        Column(PrepmtTotalAmtInclVAT;
                        PrepmtTotalAmountInclVAT)
                        {
                            AutoFormatType = 1;
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                        }

                        Column(Number_IntegerLine;
                        Number)
                        { }

                        Column(DescCaption;
                        DescCaptionLbl)
                        { }

                        Column(GLAccNoCaption;
                        GLAccNoCaptionLbl)
                        { }

                        Column(PrepmtSpecCaption;
                        PrepmtSpecCaptionLbl)
                        { }

                        trigger OnPreDataItem()
                        BEGIN
                            CurrReport.CREATETOTALS(
                                PrepmtInvBuf.Amount, PrepmtInvBuf."Amount Incl. VAT",
                                PrepmtVATAmountLine."Line Amount", PrepmtVATAmountLine."VAT Base",
                                PrepmtVATAmountLine."VAT Amount",
                                PrepmtLineAmount);
                        END;

                        trigger OnAfterGetRecord()
                        BEGIN
                            IF Number = 1 THEN BEGIN
                                IF NOT PrepmtInvBuf.FIND('-') THEN
                                    CurrReport.BREAK;
                            END ELSE
                                IF PrepmtInvBuf.NEXT = 0 THEN
                                    CurrReport.BREAK;

                            IF ShowInternalInfo THEN
                                TempPrepmtDimSetEntry.SETRANGE("Dimension Set ID", PrepmtInvBuf."Dimension Set ID");

                            IF "Purchase Header"."Prices Including VAT" THEN
                                PrepmtLineAmount := PrepmtInvBuf."Amount Incl. VAT"
                            ELSE
                                PrepmtLineAmount := PrepmtInvBuf.Amount;
                        END;
                    }


                    dataItem(PrepmtDimLoop; Integer)
                    {
                        DataItemTableView = SORTING(Number)
                            WHERE(Number = FILTER(1 ..));
                        column(DimText2; DimText) { }

                        trigger OnAfterGetRecord()
                        BEGIN
                            IF Number = 1 THEN BEGIN
                                IF NOT TempPrepmtDimSetEntry.FINDSET THEN
                                    CurrReport.BREAK;
                            END ELSE
                                IF NOT Continue THEN
                                    CurrReport.BREAK;

                            CLEAR(DimText);
                            Continue := FALSE;
                            REPEAT
                                OldDimText := DimText;
                                IF DimText = '' THEN
                                    DimText := STRSUBSTNO('%1 %2', TempPrepmtDimSetEntry."Dimension Code", TempPrepmtDimSetEntry."Dimension Value Code")
                                ELSE
                                    DimText :=
                                    STRSUBSTNO(
                                        '%1, %2 %3', DimText,
                                        TempPrepmtDimSetEntry."Dimension Code", TempPrepmtDimSetEntry."Dimension Value Code");
                                IF STRLEN(DimText) > MAXSTRLEN(OldDimText) THEN BEGIN
                                    DimText := OldDimText;
                                    Continue := TRUE;
                                    EXIT;
                                END;
                            UNTIL TempPrepmtDimSetEntry.NEXT = 0;
                        END;
                    }


                    dataItem(PrepmtVATCounter; Integer)
                    {
                        DataItemTableView = SORTING(Number);
                        Column(PrepmtVATAmtLineVATAmt;
                        PrepmtVATAmountLine."VAT Amount")
                        {
                            AutoFormatType = 1;
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                        }

                        Column(PrepmtVATAmtLineVATBase;
                        PrepmtVATAmountLine."VAT Base")
                        {
                            AutoFormatType = 1;
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                        }

                        Column(PrepmtVATAmtLineLineAmt;
                        PrepmtVATAmountLine."Line Amount")
                        {
                            AutoFormatType = 1;
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                        }

                        Column(PrepmtVATAmtLineVAT;

                        PrepmtVATAmountLine."VAT %")
                        { DecimalPlaces = 0 : 5; }

                        Column(PrepmtVATAmtLineVATIdentifier;
                        PrepmtVATAmountLine."VAT Identifier")
                        { }

                        Column(PrepmtVATAmtSpecCaption;
                        PrepmtVATAmtSpecCaptionLbl)
                        { }

                        Column(PrepmtVATPercentCaption;
                        VATPercentCaptionLbl)
                        { }

                        Column(PrepmtVATBaseCaption;
                        VATBaseCaptionLbl)
                        { }

                        Column(PrepmtVATAmtCaption;
                        VATAmtCaptionLbl)
                        { }

                        Column(PrepmtVATIdentCaption;
                        VATIdentCaptionLbl)
                        { }

                        Column(PrepmtLineAmtCaption;
                        LineAmtCaptionLbl)
                        { }

                        Column(PrepmtTotalCaption;
                        TotalCaptionLbl)
                        { }

                        trigger OnPreDataItem()
                        BEGIN
                            SETRANGE(Number, 1, PrepmtVATAmountLine.COUNT);
                        END;

                        trigger OnAfterGetRecord()
                        BEGIN
                            PrepmtVATAmountLine.GetLine(Number);
                        END;
                    }


                    dataItem(PrepmtTotal; Integer)
                    {
                        DataItemTableView = SORTING(Number)
                                            WHERE(Number = CONST(1));
                        trigger OnPreDataItem()
                        BEGIN
                            IF NOT PrepmtInvBuf.FIND('-') THEN
                                CurrReport.BREAK;
                        end;

                    }

                }

                trigger OnPreDataItem()
                BEGIN
                    NoOfLoops := ABS(NoOfCopies) + 1;
                    CopyText := '';
                    SETRANGE(Number, 1, NoOfLoops);
                    OutputNo := 0;
                END;

                trigger OnAfterGetRecord()
                VAR
                    PrepmtPurchLine: Record 39 TEMPORARY;
                    TempPurchLine: Record 39 TEMPORARY;
                BEGIN
                    CLEAR(PurchLine);
                    CLEAR(PurchPost);
                    PurchLine.DELETEALL;
                    VATAmountLine.DELETEALL;
                    PurchPost.GetPurchLines("Purchase Header", PurchLine, 0);
                    PurchLine.CalcVATAmountLines(0, "Purchase Header", PurchLine, VATAmountLine);
                    PurchLine.UpdateVATOnLines(0, "Purchase Header", PurchLine, VATAmountLine);
                    VATAmount := VATAmountLine.GetTotalVATAmount;
                    VATBaseAmount := VATAmountLine.GetTotalVATBase;
                    VATDiscountAmount :=
                      VATAmountLine.GetTotalVATDiscount("Purchase Header"."Currency Code", "Purchase Header"."Prices Including VAT");
                    TotalAmountInclVAT := VATAmountLine.GetTotalAmountInclVAT;
                    IF (VATAmountLine."VAT Calculation Type" = VATAmountLine."VAT Calculation Type"::"Reverse Charge VAT") AND
                        "Purchase Header"."Prices Including VAT" THEN BEGIN
                        VATBaseAmount := VATAmountLine.GetTotalLineAmount(FALSE, "Purchase Header"."Currency Code");
                        TotalAmountInclVAT := VATAmountLine.GetTotalLineAmount(FALSE, "Purchase Header"."Currency Code");
                    END;

                    PrepmtInvBuf.DELETEALL;
                    PurchPostPrepmt.GetPurchLines("Purchase Header", 0, PrepmtPurchLine);
                    IF (NOT PrepmtPurchLine.ISEMPTY) THEN BEGIN
                        PurchPostPrepmt.GetPurchLinesToDeduct("Purchase Header", TempPurchLine);
                        IF NOT TempPurchLine.ISEMPTY THEN
                            PurchPostPrepmt.CalcVATAmountLines("Purchase Header", TempPurchLine, PrePmtVATAmountLineDeduct, 1);
                    END;
                    PurchPostPrepmt.CalcVATAmountLines("Purchase Header", PrepmtPurchLine, PrepmtVATAmountLine, 0);
                    IF PrepmtVATAmountLine.FINDSET THEN
                        REPEAT
                            PrePmtVATAmountLineDeduct := PrepmtVATAmountLine;
                            IF PrePmtVATAmountLineDeduct.FIND THEN BEGIN
                                PrepmtVATAmountLine."VAT Base" := PrepmtVATAmountLine."VAT Base" - PrePmtVATAmountLineDeduct."VAT Base";
                                PrepmtVATAmountLine."VAT Amount" := PrepmtVATAmountLine."VAT Amount" - PrePmtVATAmountLineDeduct."VAT Amount";
                                PrepmtVATAmountLine."Amount Including VAT" := PrepmtVATAmountLine."Amount Including VAT" -
                                  PrePmtVATAmountLineDeduct."Amount Including VAT";
                                PrepmtVATAmountLine."Line Amount" := PrepmtVATAmountLine."Line Amount" - PrePmtVATAmountLineDeduct."Line Amount";
                                PrepmtVATAmountLine."Inv. Disc. Base Amount" := PrepmtVATAmountLine."Inv. Disc. Base Amount" -
                                  PrePmtVATAmountLineDeduct."Inv. Disc. Base Amount";
                                PrepmtVATAmountLine."Invoice Discount Amount" := PrepmtVATAmountLine."Invoice Discount Amount" -
                                  PrePmtVATAmountLineDeduct."Invoice Discount Amount";
                                PrepmtVATAmountLine."Calculated VAT Amount" := PrepmtVATAmountLine."Calculated VAT Amount" -
                                  PrePmtVATAmountLineDeduct."Calculated VAT Amount";
                                PrepmtVATAmountLine.MODIFY;
                            END;
                        UNTIL PrepmtVATAmountLine.NEXT = 0;
                    PurchPostPrepmt.UpdateVATOnLines("Purchase Header", PrepmtPurchLine, PrepmtVATAmountLine, 0);
                    BuildInvLineBuffer2("Purchase Header", PrepmtPurchLine, 0, PrepmtInvBuf);
                    PrepmtVATAmount := PrepmtVATAmountLine.GetTotalVATAmount;
                    PrepmtVATBaseAmount := PrepmtVATAmountLine.GetTotalVATBase;
                    PrepmtTotalAmountInclVAT := PrepmtVATAmountLine.GetTotalAmountInclVAT;

                    IF Number > 1 THEN
                        CopyText := Text003;
                    CurrReport.PAGENO := 1;
                    OutputNo := OutputNo + 1;

                    TotalSubTotal := 0;
                    TotalAmount := 0;
                    TotalInvoiceDiscountAmount := 0;
                END;

                trigger OnPostDataItem()
                BEGIN
                    IF NOT CurrReport.PREVIEW THEN
                        PurchCountPrinted.RUN("Purchase Header");
                END;
            }
            trigger OnAfterGetRecord()
            BEGIN
                If "Language Code" = '' Then "Language Code" := 'ESP';
                CurrReport.LANGUAGE := Language.GetLanguageID("Language Code");

                CompanyInfo.GET;

                IF RespCenter.GET("Responsibility Center") THEN BEGIN
                    FormatAddr.RespCenter(CompanyAddr, RespCenter);
                    CompanyInfo."Phone No." := RespCenter."Phone No.";
                    CompanyInfo."Fax No." := RespCenter."Fax No.";
                END ELSE
                    FormatAddr.Company(CompanyAddr, CompanyInfo);

                DimSetEntry1.SETRANGE("Dimension Set ID", "Dimension Set ID");

                IF "Purchaser Code" = '' THEN BEGIN
                    SalesPurchPerson.INIT;
                    PurchaserText := '';
                END ELSE BEGIN
                    SalesPurchPerson.GET("Purchaser Code");
                    PurchaserText := Text000
                END;
                IF "Your Reference" = '' THEN
                    ReferenceText := ''
                ELSE
                    ReferenceText := FIELDCAPTION("Your Reference");
                IF "VAT Registration No." = '' THEN
                    VATNoText := ''
                ELSE
                    VATNoText := FIELDCAPTION("VAT Registration No.");
                IF "Currency Code" = '' THEN BEGIN
                    GLSetup.TESTFIELD("LCY Code");
                    TotalText := STRSUBSTNO(Text001, GLSetup."LCY Code");
                    TotalInclVATText := STRSUBSTNO(Text002, GLSetup."LCY Code");
                    TotalExclVATText := STRSUBSTNO(Text006, GLSetup."LCY Code");
                END ELSE BEGIN
                    TotalText := STRSUBSTNO(Text001, "Currency Code");
                    TotalInclVATText := STRSUBSTNO(Text002, "Currency Code");
                    TotalExclVATText := STRSUBSTNO(Text006, "Currency Code");
                END;

                FormatAddr.PurchHeaderBuyFrom(BuyFromAddr, "Purchase Header");
                IF "Buy-from Vendor No." <> "Pay-to Vendor No." THEN
                    FormatAddr.PurchHeaderPayTo(VendAddr, "Purchase Header");
                IF "Payment Terms Code" = '' THEN
                    PaymentTerms.INIT
                ELSE BEGIN
                    PaymentTerms.GET("Payment Terms Code");
                    PaymentTerms.TranslateDescription(PaymentTerms, "Language Code");
                END;
                IF "Prepmt. Payment Terms Code" = '' THEN
                    PrepmtPaymentTerms.INIT
                ELSE BEGIN
                    PrepmtPaymentTerms.GET("Prepmt. Payment Terms Code");
                    PrepmtPaymentTerms.TranslateDescription(PrepmtPaymentTerms, "Language Code");
                END;
                IF "Shipment Method Code" = '' THEN
                    ShipmentMethod.INIT
                ELSE BEGIN
                    ShipmentMethod.GET("Shipment Method Code");
                    ShipmentMethod.TranslateDescription(ShipmentMethod, "Language Code");
                END;

                //++
                IF NOT recFormaDePago.GET("Purchase Header"."Payment Method Code") THEN
                    CLEAR(recFormaDePago);
                //--

                FormatAddr.PurchHeaderShipTo(ShipToAddr, "Purchase Header");

                ShowCashAccountingCriteria;

                IF NOT CurrReport.PREVIEW THEN BEGIN
                    IF ArchiveDocument THEN
                        ArchiveManagement.StorePurchDocument("Purchase Header", LogInteraction);

                    IF LogInteraction THEN BEGIN
                        CALCFIELDS("No. of Archived Versions");
                        SegManagement.LogDocument(
                        13, "No.", "Doc. No. Occurrence", "No. of Archived Versions", DATABASE::Vendor, "Buy-from Vendor No.",
                        "Purchaser Code", '', "Posting Description", '');
                    END;
                END;
                PricesInclVATtxt := FORMAT("Prices Including VAT");
            END;
        }
    }
    REQUESTPAGE
    {
        SaveValues = true;

        layout
        {
            area(Content)
            {
                group(Options)
                {
                    Caption = 'Opciones';

                    field(NoofCopies; NoOfCopies)
                    {
                        CaptionML = ENU = 'No. of Copies',
                             ESP = 'Nº copias';
                        ApplicationArea = ALL;
                    }

                    field(ShowInternalInformation; ShowInternalInfo)
                    {
                        CaptionML = ENU = 'Show Internal Information',
                             ESP = 'Mostrar información interna';
                        ApplicationArea = ALL;
                    }

                    field(ArchiveDocument; ArchiveDocument)
                    {
                        CaptionML = ENU = 'Archive Document',
                             ESP = 'Archivar documento';
                        ApplicationArea = ALL;
                        trigger OnValidate()
                        BEGIN
                            IF NOT ArchiveDocument THEN
                                LogInteraction := FALSE;
                        END;
                    }

                    field(LogInteraction; LogInteraction)
                    {
                        CaptionML = ENU = 'Log Interaction',
                             ESP = 'Log interacción';
                        Enabled = LogInteractionEnable;
                        ApplicationArea = ALL;
                        trigger OnValidate()
                        BEGIN
                            IF LogInteraction THEN
                                ArchiveDocument := ArchiveDocumentEnable;
                        END;
                    }
                }
            }
        }
        trigger OnInit()
        BEGIN
            LogInteractionEnable := TRUE;
        END;

        trigger OnOpenPage()
        BEGIN
            ArchiveDocument := PurchSetup."Archive Orders";
            LogInteraction := SegManagement.FindInteractTmplCode(13) <> '';

            LogInteractionEnable := LogInteraction;
        END;

    }

    trigger OnInitReport()
    BEGIN
        GLSetup.GET;
        PurchSetup.GET;

        CompanyInfo.GET;

        CompanyInfo3.GET;
        CompanyInfo3.CALCFIELDS(Picture);
    END;

    VAR
        Text000: TextConst ENU = 'Purchaser', ESP = 'Comprador';
        Text001: TextConst ENU = 'Total %1', ESP = 'Total %1';
        Text002: TextConst ENU = 'Total %1 Incl. VAT', ESP = 'Total %1 IVA incl.';
        Text003: TextConst ENU = 'COPY', ESP = 'COPIA';
        Text004: TextConst ENU = 'Order %1', ESP = 'Pedido %1';
        Text005: TextConst ENU = 'Page %1', ESP = 'Pg. %1';
        Text006: TextConst ENU = 'Total %1 Excl. VAT', ESP = 'Total %1 IVA excl.';
        GLSetup: Record 98;
        CompanyInfo: Record 79;
        ShipmentMethod: Record 10;
        PaymentTerms: Record 3;
        PrepmtPaymentTerms: Record 3;
        SalesPurchPerson: Record 13;
        VATAmountLine: Record 290 TEMPORARY;
        PrepmtVATAmountLine: Record 290 TEMPORARY;
        PrePmtVATAmountLineDeduct: Record 290 TEMPORARY;
        PurchLine: Record 39 TEMPORARY;
        DimSetEntry1: Record 480;
        DimSetEntry2: Record 480;
        TempPrepmtDimSetEntry: Record 480 TEMPORARY;
        PrepmtInvBuf: Record 461 TEMPORARY;
        RespCenter: Record 5714;
        Language: Codeunit Language;
        CurrExchRate: Record 330;
        PurchSetup: Record 312;
        PurchCountPrinted: Codeunit 317;
        FormatAddr: Codeunit 365;
        PurchPost: Codeunit 90;
        ArchiveManagement: Codeunit 5063;
        SegManagement: Codeunit 5051;
        PurchPostPrepmt: Codeunit 444;
        VendAddr: ARRAY[8] OF Text[50];
        ShipToAddr: ARRAY[8] OF Text[50];
        CompanyAddr: ARRAY[8] OF Text[50];
        BuyFromAddr: ARRAY[8] OF Text[50];
        PurchaserText: Text[30];
        VATNoText: Text[80];
        ReferenceText: Text[80];
        TotalText: Text[50];
        TotalInclVATText: Text[50];
        TotalExclVATText: Text[50];
        MoreLines: Boolean;
        NoOfCopies: Integer;
        NoOfLoops: Integer;
        CopyText: Text[30];
        OutputNo: Integer;
        DimText: Text[120];
        OldDimText: Text[75];
        ShowInternalInfo: Boolean;
        Continue: Boolean;
        ArchiveDocument: Boolean;
        LogInteraction: Boolean;
        VATAmount: Decimal;
        VATBaseAmount: Decimal;
        VATDiscountAmount: Decimal;
        TotalAmountInclVAT: Decimal;
        VALVATBaseLCY: Decimal;
        VALVATAmountLCY: Decimal;
        VALSpecLCYHeader: Text[80];
        VALExchRate: Text[50];
        Text007: TextConst ENU = '"VAT Amount Specification in "', ESP = '"Especificar importe IVA en "';
        Text008: TextConst ENU = 'Local Currency', ESP = 'Divisa local';
        Text009: TextConst ENU = 'Exchange rate: %1/%2', ESP = 'Tipo cambio: %1/%2';
        PrepmtVATAmount: Decimal;
        PrepmtVATBaseAmount: Decimal;
        PrepmtAmountInclVAT: Decimal;
        PrepmtTotalAmountInclVAT: Decimal;
        PrepmtLineAmount: Decimal;
        PricesInclVATtxt: Text[30];
        AllowInvDisctxt: Text[30];
        ArchiveDocumentEnable: Boolean;// INDATASET;
        LogInteractionEnable: Boolean;// INDATASET;
        TotalSubTotal: Decimal;
        TotalAmount: Decimal;
        TotalInvoiceDiscountAmount: Decimal;
        PhoneNoCaptionLbl: TextConst ENU = 'Phone No.', ESP = 'Nº teléfono';
        VATRegNoCaptionLbl: TextConst ENU = 'VAT Registration No.', ESP = 'CIF/NIF';
        GiroNoCaptionLbl: TextConst ENU = 'Giro No.', ESP = 'Nº giro postal';
        BankCaptionLbl: TextConst ENU = 'Bank', ESP = 'Banco';
        BankAccNoCaptionLbl: TextConst ENU = 'Account No.', ESP = 'Nº cuenta';
        OrderNoCaptionLbl: TextConst ENU = 'Order No.', ESP = 'Nº pedido';
        PageCaptionLbl: TextConst ENU = 'Page', ESP = 'Pg.';
        HdrDimsCaptionLbl: TextConst ENU = 'Header Dimensions', ESP = 'Dimensiones cabecera';
        DirectUnitCostCaptionLbl: TextConst ENU = 'Direct Unit Cost', ESP = 'Coste unit. directo';
        DiscountPercentCaptionLbl: TextConst ENU = 'Discount %', ESP = '% Descuento';
        InvDiscAmtCaptionLbl: TextConst ENU = 'Invoice Discount Amount', ESP = 'Importe descuento factura';
        SubtotalCaptionLbl: TextConst ENU = 'Subtotal', ESP = 'Subtotal';
        TotalTextLbl: TextConst ENU = 'Payment Discount Received Amount', ESP = 'Importe recibido descuento pago';
        VATDiscountAmtCaptionLbl: TextConst ENU = 'Payment Discount on VAT', ESP = 'Descuento P.P. sobre IVA';
        LineDimsCaptionLbl: TextConst ENU = 'Line Dimensions', ESP = 'Dimensiones línea';
        VATPercentCaptionLbl: TextConst ENU = 'VAT %', ESP = '% IVA';
        VATBaseCaptionLbl: TextConst ENU = 'VAT Base', ESP = 'Base IVA';
        VATAmtCaptionLbl: TextConst ENU = 'VAT Amount', ESP = 'Importe IVA';
        VATAmtSpecCaptionLbl: TextConst ENU = 'VAT Amount Specification', ESP = 'Especificación importe IVA';
        VATIdentCaptionLbl: TextConst ENU = 'VAT Identifier', ESP = 'Identific. IVA';
        InvDiscBaseAmtCaptionLbl: TextConst ENU = 'Invoice Discount Base Amount', ESP = 'Importe base descuento factura';
        LineAmtCaptionLbl: TextConst ENU = 'Line Amount', ESP = 'Importe línea';
        InvDiscAmt1CaptionLbl: TextConst ENU = 'Invoice and Payment Discounts', ESP = 'Descuentos facturas y pagos';
        ECAmtCaptionLbl: TextConst ENU = 'EC Amount', ESP = 'Importe RE';
        ECCaptionLbl: TextConst ENU = 'EC %', ESP = '% RE';
        TotalCaptionLbl: TextConst ENU = 'Total', ESP = 'Total';
        PaymentDetailsCaptionLbl: TextConst ENU = 'Payment Details', ESP = 'Detalles del pago';
        VendNoCaptionLbl: TextConst ENU = 'Vendor No.', ESP = 'Nº proveedor';
        ShiptoAddCaptionLbl: TextConst ENU = 'Ship-to Address', ESP = 'Envío a-Dirección';
        DescCaptionLbl: TextConst ENU = 'Description', ESP = 'Descripción';
        GLAccNoCaptionLbl: TextConst ENU = 'G/L Account No.', ESP = 'Nº cuenta';
        PrepmtSpecCaptionLbl: TextConst ENU = 'Prepayment Specification', ESP = 'Especificación prepago';
        PrepmtVATAmtSpecCaptionLbl: TextConst ENU = 'Prepayment VAT Amount Specification', ESP = 'Especificación importe IVA prepago';
        HomepageCaptionLbl: TextConst ENU = 'Home Page', ESP = 'Pgina Web';
        EmailCaptionLbl: TextConst ENU = 'E-Mail', ESP = 'Correo electrónico';
        AmtCaptionLbl: TextConst ENU = 'Amount', ESP = 'Importe';
        PaymentTermsCaptionLbl: TextConst ENU = 'Payment Terms', ESP = 'Términos pago';
        ShpMethodCaptionLbl: TextConst ENU = 'Shipment Method', ESP = 'Condiciones envío';
        PrePmtTermsDescCaptionLbl: TextConst ENU = 'Prepayment Payment Terms', ESP = 'Condiciones prepago';
        DocDateCaptionLbl: TextConst ENU = 'Document Date', ESP = 'Fecha emisión documento';
        AllowInvDiscCaptionLbl: TextConst ENU = 'Allow Invoice Discount', ESP = 'Permitir descuento factura';
        CACCaptionLbl: Text;
        CACTxt: TextConst ENU = 'Régimen especial del criterio de caja', ESP = 'Régimen especial del criterio de caja';
        CompanyInfo1: Record 79;
        CompanyInfo2: Record 79;
        CompanyInfo3: Record 79;
        recFormaDePago: Record 289;
        TempPrepmtInvLineBuf: Record "Prepayment Inv. Line Buffer" temporary;
        GenPostingSetup: Record "General Posting Setup";

    PROCEDURE InitializeRequest(NewNoOfCopies: Integer; NewShowInternalInfo: Boolean; NewArchiveDocument: Boolean; NewLogInteraction: Boolean);
    BEGIN
        NoOfCopies := NewNoOfCopies;
        ShowInternalInfo := NewShowInternalInfo;
        ArchiveDocument := NewArchiveDocument;
        LogInteraction := NewLogInteraction;
    END;

    LOCAL PROCEDURE ShowCashAccountingCriteria();
    VAR
        VATPostingSetup: Record 325;
        PurchaseLine2: Record 39;
    BEGIN
        GLSetup.GET;
        IF NOT GLSetup."Unrealized VAT" THEN
            EXIT;
        CACCaptionLbl := '';
        PurchaseLine2.SETRANGE("Document No.", "Purchase Header"."No.");
        IF PurchaseLine2.FINDSET THEN
            REPEAT
                IF VATPostingSetup.GET("Purchase Header"."VAT Bus. Posting Group", PurchaseLine2."VAT Prod. Posting Group") THEN
                    IF VATPostingSetup."Unrealized VAT Type" <> VATPostingSetup."Unrealized VAT Type"::" " THEN
                        CACCaptionLbl := CACTxt;
            UNTIL (PurchaseLine2.NEXT = 0) OR (CACCaptionLbl <> '');
    END;

    local procedure BuildInvLineBuffer2(PurchHeader: Record "Purchase Header"; var PurchLine: Record "Purchase Line"; DocumentType: Integer; var PrepmtInvBuf: Record "Prepayment Inv. Line Buffer")
    var
        BuildBuffer: Codeunit 444;
    begin
        BuildInvLineBuffer(PurchHeader, PurchLine, DocumentType, PrepmtInvBuf, FALSE);
    end;

    local procedure BuildInvLineBuffer(PurchHeader: Record "Purchase Header"; VAR PurchLine: Record "Purchase Line"; DocumentType: Option; VAR PrepmtInvBuf: Record "Prepayment Inv. Line Buffer"; UpdateLines: Boolean)
    var
        PrepmtInvBuf2: Record "Prepayment Inv. Line Buffer";
        TotalPrepmtInvLineBuffer: Record "Prepayment Inv. Line Buffer";
        TotalPrepmtInvLineBufferDummy: Record "Prepayment Inv. Line Buffer";
        PurchSetup: Record "Purchases & Payables Setup";
    begin
        WITH PurchHeader DO BEGIN
            TempPrepmtInvLineBuf.RESET;
            TempPrepmtInvLineBuf.DELETEALL;
            PurchSetup.GET;
            ApplyFilter(PurchHeader, DocumentType, PurchLine);
            PurchLine.SETRANGE("System-Created Entry", FALSE);
            IF PurchLine.FIND('-') THEN
                REPEAT
                    IF PrepmtAmount(PurchLine, DocumentType) <> 0 THEN BEGIN
                        FillInvLineBuffer(PurchHeader, PurchLine, PrepmtInvBuf2);
                        IF UpdateLines THEN
                            TempPrepmtInvLineBuf.CopyWithLineNo(PrepmtInvBuf2, PurchLine."Line No.");
                        PrepmtInvBuf.InsertInvLineBuffer(PrepmtInvBuf2);
                        IF PurchSetup."Invoice Rounding" THEN
                            RoundAmounts(
                              PurchHeader, PrepmtInvBuf2, TotalPrepmtInvLineBuffer, TotalPrepmtInvLineBufferDummy);
                    END;
                UNTIL PurchLine.NEXT = 0;
            IF PurchSetup."Invoice Rounding" THEN
                IF InsertInvoiceRounding(
                   PurchHeader, PrepmtInvBuf2, TotalPrepmtInvLineBuffer, PurchLine."Line No.")
                THEN
                    PrepmtInvBuf.InsertInvLineBuffer(PrepmtInvBuf2);
        END;
    end;
    /// <summary>
    /// PrepmtAmount.
    /// </summary>
    /// <param name="PurchLine">Record "Purchase Line".</param>
    /// <param name="DocumentType">Option Invoice,"Credit Memo",Statistic.</param>
    /// <returns>Return value of type Decimal.</returns>
    procedure PrepmtAmount(PurchLine: Record "Purchase Line"; DocumentType: Option Invoice,"Credit Memo",Statistic): Decimal
    begin
        with PurchLine do
            case DocumentType of
                DocumentType::Statistic:
                    exit("Prepmt. Line Amount");
                DocumentType::Invoice:
                    exit("Prepmt. Line Amount" - "Prepmt. Amt. Inv.");
                else
                    exit("Prepmt. Amt. Inv." - "Prepmt Amt Deducted");
            end;
    end;

    local procedure ApplyFilter(PurchHeader: Record "Purchase Header"; DocumentType: Option Invoice,"Credit Memo",Statistic; var PurchLine: Record "Purchase Line")
    begin

        WITH PurchLine DO BEGIN
            RESET;
            SETRANGE("Document Type", PurchHeader."Document Type");
            SETRANGE("Document No.", PurchHeader."No.");
            SETFILTER(Type, '<>%1', Type::" ");
            IF DocumentType IN [DocumentType::Invoice, DocumentType::Statistic] THEN
                SETFILTER("Prepmt. Line Amount", '<>0')
            ELSE
                SETFILTER("Prepmt. Amt. Inv.", '<>0');
        END;
    end;

    local procedure RoundAmounts(PurchHeader: Record "Purchase Header"; var PrepmtInvLineBuf: Record "Prepayment Inv. Line Buffer"; var TotalPrepmtInvLineBuf: Record "Prepayment Inv. Line Buffer"; var TotalPrepmtInvLineBufLCY: Record "Prepayment Inv. Line Buffer")
    var
        VAT: Boolean;
    begin
        TotalPrepmtInvLineBuf.IncrAmounts(PrepmtInvLineBuf);

        with PrepmtInvLineBuf do
            if PurchHeader."Currency Code" <> '' then begin
                VAT := Amount <> "Amount Incl. VAT";
                "Amount Incl. VAT" :=
                  AmountToLCY(PurchHeader, TotalPrepmtInvLineBuf."Amount Incl. VAT", TotalPrepmtInvLineBufLCY."Amount Incl. VAT");
                if VAT then
                    Amount := AmountToLCY(PurchHeader, TotalPrepmtInvLineBuf.Amount, TotalPrepmtInvLineBufLCY.Amount)
                else
                    Amount := "Amount Incl. VAT";
                "VAT Amount" := "Amount Incl. VAT" - Amount;
                if "VAT Base Amount" <> 0 then
                    "VAT Base Amount" := Amount;
                "Orig. Pmt. Disc. Possible" :=
                    AmountToLCY(
                        PurchHeader, TotalPrepmtInvLineBuf."Orig. Pmt. Disc. Possible", TotalPrepmtInvLineBufLCY."Orig. Pmt. Disc. Possible");
            end;

    end;

    local procedure AmountToLCY(PurchHeader: Record "Purchase Header"; TotalAmt: Decimal; PrevTotalAmt: Decimal): Decimal
    var
        CurrExchRate: Record "Currency Exchange Rate";
    begin
        CurrExchRate.Init();
        with PurchHeader do
            exit(
            Round(
                CurrExchRate.ExchangeAmtFCYToLCY("Posting Date", "Currency Code", TotalAmt, "Currency Factor")) -
            PrevTotalAmt);
    end;

    /// <summary>
    /// FillInvLineBuffer.
    /// </summary>
    /// <param name="PurchHeader">Record "Purchase Header".</param>
    /// <param name="PurchLine">Record "Purchase Line".</param>
    /// <param name="PrepmtInvLineBuf">VAR Record "Prepayment Inv. Line Buffer".</param>
    procedure FillInvLineBuffer(PurchHeader: Record "Purchase Header"; PurchLine: Record "Purchase Line"; var PrepmtInvLineBuf: Record "Prepayment Inv. Line Buffer")
    begin
        with PrepmtInvLineBuf do begin
            Init();

            "G/L Account No." := GetPrepmtAccNo(PurchLine."Gen. Bus. Posting Group", PurchLine."Gen. Prod. Posting Group");

            if not PurchHeader."Compress Prepayment" then begin
                "Line No." := PurchLine."Line No.";
                Description := PurchLine.Description;
            end;

            CopyFromPurchLine(PurchLine);
            FillFromGLAcc(PurchHeader."Compress Prepayment");

            SetAmounts(
              PurchLine."Prepayment Amount", PurchLine."Prepmt. Amt. Incl. VAT", PurchLine."Prepayment Amount",
              PurchLine."Prepayment Amount", PurchLine."Prepayment Amount", PurchLine."Prepayment VAT Difference");

            "VAT Amount" := PurchLine."Prepmt. Amt. Incl. VAT" - PurchLine."Prepayment Amount";
            "VAT Amount (ACY)" := PurchLine."Prepmt. Amt. Incl. VAT" - PurchLine."Prepayment Amount";
            "VAT Base Before Pmt. Disc." := PurchLine."Prepayment Amount";
            "Orig. Pmt. Disc. Possible" := PurchLine."Prepmt. Pmt. Discount Amount";
        end;

    end;

    local procedure InsertInvoiceRounding(PurchHeader: Record "Purchase Header"; var PrepmtInvLineBuf: Record "Prepayment Inv. Line Buffer"; TotalPrepmtInvLineBuf: Record "Prepayment Inv. Line Buffer"; PrevLineNo: Integer): Boolean
    var
        PurchLine: Record "Purchase Line";
    begin
        if InitInvoiceRoundingLine(PurchHeader, TotalPrepmtInvLineBuf."Amount Incl. VAT", PurchLine) then begin
            CreateDimensions(PurchLine);
            with PrepmtInvLineBuf do begin
                Init();
                "Line No." := PrevLineNo + 10000;
                "Invoice Rounding" := true;
                "G/L Account No." := PurchLine."No.";
                Description := PurchLine.Description;

                CopyFromPurchLine(PurchLine);

                SetAmounts(
                  PurchLine."Line Amount", PurchLine."Amount Including VAT", PurchLine."Line Amount",
                  PurchLine."Prepayment Amount", PurchLine."Line Amount", 0);

                "VAT Amount" := PurchLine."Amount Including VAT" - PurchLine."Line Amount";
                "VAT Amount (ACY)" := PurchLine."Amount Including VAT" - PurchLine."Line Amount";
            end;
            exit(true);
        end;
    end;

    local procedure GetPrepmtAccNo(GenBusPostingGroup: Code[20]; GenProdPostingGroup: Code[20]): Code[20]
    begin
        if (GenBusPostingGroup <> GenPostingSetup."Gen. Bus. Posting Group") or
           (GenProdPostingGroup <> GenPostingSetup."Gen. Prod. Posting Group")
        then
            GenPostingSetup.Get(GenBusPostingGroup, GenProdPostingGroup);
        exit(GenPostingSetup.GetPurchPrepmtAccount());
    end;

    local procedure CreateDimensions(var PurchLine: Record "Purchase Line")
    var
        SourceCodeSetup: Record "Source Code Setup";
        DimMgt: Codeunit DimensionManagement;
        DefaultDimSource: List of [Dictionary of [Integer, Code[20]]];
    begin
        SourceCodeSetup.Get();
        DimMgt.AddDimSource(DefaultDimSource, Database::"Work Center", PurchLine."Work Center No.");
        DimMgt.AddDimSource(DefaultDimSource, Database::"G/L Account", PurchLine."No.");
        DimMgt.AddDimSource(DefaultDimSource, Database::Job, PurchLine."Job No.");
        DimMgt.AddDimSource(DefaultDimSource, Database::"Responsibility Center", PurchLine."Responsibility Center");
        PurchLine."Shortcut Dimension 1 Code" := '';
        PurchLine."Shortcut Dimension 2 Code" := '';
        PurchLine."Dimension Set ID" :=
          DimMgt.GetRecDefaultDimID(
            PurchLine, 0, DefaultDimSource, SourceCodeSetup.Purchases,
            PurchLine."Shortcut Dimension 1 Code", PurchLine."Shortcut Dimension 2 Code", PurchLine."Dimension Set ID", DATABASE::Vendor);
    end;

    local procedure InitInvoiceRoundingLine(PurchHeader: Record "Purchase Header"; TotalAmount: Decimal; var PurchLine: Record "Purchase Line"): Boolean
    var
        Currency: Record Currency;
        InvoiceRoundingAmount: Decimal;
    begin
        Currency.Initialize(PurchHeader."Currency Code");
        Currency.TestField("Invoice Rounding Precision");
        InvoiceRoundingAmount :=
          -Round(
            TotalAmount -
            Round(
              TotalAmount,
              Currency."Invoice Rounding Precision",
              Currency.InvoiceRoundingDirection()),
            Currency."Amount Rounding Precision");

        if InvoiceRoundingAmount = 0 then
            exit(false);

        with PurchLine do begin
            "Document Type" := PurchHeader."Document Type";
            "Document No." := PurchHeader."No.";
            "System-Created Entry" := true;
            Type := Type::"G/L Account";
            Validate("No.", GetInvRoundingAccNo(PurchHeader."Vendor Posting Group"));
            Validate(Quantity, 1);
            if PurchHeader."Prices Including VAT" then
                Validate("Direct Unit Cost", InvoiceRoundingAmount)
            else
                Validate(
                  "Direct Unit Cost",
                  Round(
                    InvoiceRoundingAmount /
                    (1 + (1 - PurchHeader."VAT Base Discount %" / 100) * "VAT %" / 100),
                    Currency."Amount Rounding Precision"));
            "Prepayment Amount" := "Direct Unit Cost";
            Validate("Amount Including VAT", InvoiceRoundingAmount);
        end;
        exit(true);
    end;
    /// <summary>
    /// GetInvRoundingAccNo.
    /// </summary>
    /// <param name="VendorPostingGroup">Code[20].</param>
    /// <returns>Return value of type Code[20].</returns>
    procedure GetInvRoundingAccNo(VendorPostingGroup: Code[20]): Code[20]
    var
        VendPostingGr: Record "Vendor Posting Group";
        GLAcc: Record "G/L Account";
    begin
        VendPostingGr.Get(VendorPostingGroup);
        GLAcc.Get(VendPostingGr.GetInvRoundingAccount());
        exit(VendPostingGr."Invoice Rounding Account");
    end;
}


