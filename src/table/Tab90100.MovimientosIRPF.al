/// <summary>
/// Table Movimientos IRPF (ID 90100).
/// </summary>
Table 90100 "Movimientos IRPF"
{
    FIELDS
    {
        field(1; "Nº movimiento"; Integer) { }
        field(2; "Tipo movimiento"; Option) { OptionMembers = Proveedor,Empleado; }
        field(3; "Nº proveedor/empleado"; Code[20])
        {
            TableRelation = IF ("Tipo movimiento" = CONST(Proveedor)) Vendor."No."
            ELSE
            IF ("Tipo movimiento" = CONST(Empleado)) Employee."No.";
        }
        field(4; "Fecha"; Date) { }
        field(5; "Tipo documento"; Option)
        {
            OptionMembers = ,Payment,Invoice,"Credit Memo","Finance Charge Memo",Reminder,Refund,,,,,,,,,,,,,,,Bill;
            Editable = false;
        }
        field(6; "Nº documento"; Code[20]) { }
        field(7; "Base imponible"; Decimal) { }
        field(8; "% IRPF"; Decimal) { }
        field(9; "Importe IRPF"; Decimal) { }
        field(10; "Cta Retenciones"; Code[20]) { TableRelation = "G/L Account"."No."; }
    }
    KEYS
    {
        Key(PK; "Nº movimiento") { Clustered = true; }
    }

}

// Table 90101 "QuoEP Web User"
// {
//     FIELDS
//     {
//         field(1; "User ID"; Code[20]) { }
//         field(2; "Password"; Text[50]) { }
//         field(3; "Resource No."; Code[20]) { TableRelation = Resource."No." WHERE("No." = FIELD("Resource No.")); }
//         field(4; "Blocked"; Boolean) { }
//         field(5; "Windows User"; Boolean) { }
//         field(6; "Employee portal access"; Boolean) { }
//         field(7; "Work reports access"; Boolean) { }
//     }
//     KEYS
//     {
//         Key(PK; "User ID") { Clustered = true; }
//     }

// }

Table 90102 "Claves SIIME"
{
    FIELDS
    {
        field(1; "Tipo"; Option)
        {
            OptionMembers = "Tipo comunicación","Clave tipo factura emitida","Clave tipo factura rectificativa emitida","Clave tipo factura recibida","Clave tipo factura rectificativa recibida","Clave régimen especial facturas emitidas","Clave régimen especial facturas recibidas","Ventas o servicios (facturas)","Ventas o servicios (facturas servicios)","Tipo factura rectificativa","Situación inmueble","Tipo no exención","Causa exención","Tipo id. fiscal país residencia","Código error","Medio Cobro/Pago","Estado cuadre";
        }
        field(2; "Código"; Code[10]) { }
        field(3; "Descripción"; Text[250]) { }
        field(5; "Valor"; Code[10]) { }
        field(6; "Defecto"; Boolean) { }
    }
    KEYS
    {
        Key(PK; Tipo, Código) { Clustered = true; }
    }
    FIELDGROUPS
    {
        fieldgroup(DropDown; Código, Descripción, Defecto) { }
    }

}

Table 90103 "Log SIIME"
{




    FIELDS
    {
        field(1; "Id"; Integer) { }
        field(2; "User ID"; Code[50])
        {
            TableRelation = User;
            ValidateTableRelation = false;
            Caption = 'Id. usuario';
            NotBlank = true;
            trigger OnValidate()
            VAR
                LoginMgt: Codeunit 418;
            BEGIN
                //  LoginMgt.ValidateUserID("User ID");
            END;

            trigger OnLookup()
            VAR
                LoginMgt: Codeunit 418;
            BEGIN
                //LoginMgt.LookupUserID("User ID");
            END;

        }
        field(3; "Tipo"; Option)
        {
            OptionMembers = "Factura venta","Abono venta","Factura compra","Abono compra","Factura servicio","Abono servicio","Criterio Caja","Factura simplificada";
        }
        field(4; "No."; Code[20]) { Caption = 'Nº'; }
        field(5; "CSV AEAT"; Text[100]) { Editable = false; }
        field(6; "Código error AEAT"; Text[30]) { Editable = false; }
        field(7; "Descripción error AEAT"; Text[250]) { Editable = false; }
        field(8; "Estado AEAT"; Text[30]) { Editable = false; }
        field(9; "Fecha envío AEAT"; Date) {; Editable = false; }
        field(10; "Hora envío AEAT"; Time) {; Editable = false; }
    }
    KEYS
    {
        Key(PK; Id) { Clustered = true; }
        Key(PK1; Tipo, "No.") { }
    }
    trigger OnInsert()
    Var
        Reg: Record 90103;
    BEGIN
        Reg.RESET;
        IF Reg.FINDLAST THEN
            Id := Reg.Id + 1
        ELSE
            Id := 1;
    END;
}

// Table 90104 "MOEP WorkReport"
// {



//     FIELDS
//     {
//         field(1; "Id"; Code[10])
//         {
//             NotBlank = false;
//             Editable = false;
//         }
//         field(2; "ACFT_REG"; Text[100]) { }
//         field(3; "CreatedBy"; Code[20])
//         {
//             TableRelation = "QuoEP Web User"."User ID";
//             Description = 'Relacionada con Tabla QuoEP Web User';
//         }
//         field(4; "ModifiedBy"; Code[20])
//         {
//             TableRelation = "QuoEP Web User"."User ID";
//             Description = 'Relacionada con Tabla QuoEP Web User';
//         }
//         field(5; "Operator"; Code[20])
//         {
//             TableRelation = Customer."No.";
//             Description = 'Relacionada con Tabla Cliente';
//         }
//         field(6; "Operator name"; Text[100])
//         {
//             FieldClass = FlowField;
//             CalcFormula = Lookup(Customer."Search Name" WHERE("No." = FIELD(Operator)));
//         }
//         field(7; "Date"; Date) { }
//         field(8; "Arrival F"; Text[30]) { Description = 'Numero de Vuelo Llegada'; }
//         field(9; "Arrival Time"; Time) { }
//         field(10; "Departure F"; Text[30]) { Description = 'Numero de Vuelo Salida'; }
//         field(11; "Departure Time"; Time) { }
//         field(12; "Base"; Code[20])
//         {
//             trigger OnLookup()
//             VAR
//                 DimensionValue: Record 349;
//                 DimensionValueList: Page 537;
//                 ResourcesSetup: Record 314;
//             BEGIN

//                 ResourcesSetup.RESET;
//                 ResourcesSetup.GET;

//                 DimensionValue.RESET;
//                 DimensionValue.SETRANGE("Dimension Code", ResourcesSetup."Base Dimension Portal");
//                 CLEAR(DimensionValueList);
//                 DimensionValueList.SETRECORD(DimensionValue);
//                 DimensionValueList.SETTABLEVIEW(DimensionValue);

//                 DimensionValueList.LOOKUPMODE(TRUE);
//                 IF DimensionValueList.RUNMODAL = ACTION::LookupOK THEN BEGIN
//                     DimensionValueList.GETRECORD(DimensionValue);
//                     Base := DimensionValue.Code;
//                 END;
//             END;
//         }
//         field(13; "Shift"; Code[20]) { TableRelation = "MOEP Options".Code WHERE(Field = CONST('SHIFT')); }
//         field(14; "TLB"; BLOB) { }
//         field(15; "Dy Check Time"; Time) { }
//         field(16; "Total MH"; Integer) { Description = 'Valor guardado en minutos.Se muestra en horas:minutos en el portal'; }
//         field(17; "Non Routine MH"; Integer) { Description = 'Valor guardado en minutos.Se muestra en horas:minutos en el portal'; }
//         field(18; "Flight H"; Integer) { Description = 'Valor guardado en minutos.Se muestra en horas:minutos en el portal'; }
//         field(19; "Work Report"; BLOB) { }
//         field(20; "Attention Items"; BLOB) { }
//         field(21; "OIL1"; Integer) { }
//         field(22; "OIL2"; Integer) { }
//         field(23; "OIL3"; Integer) { }
//         field(24; "OIL4"; Integer) { }
//         field(25; "HYD1"; Integer) { }
//         field(26; "HYD2"; Integer) { }
//         field(27; "HYD3"; Integer) { }
//         field(28; "HYD4"; Integer) { }
//         field(29; "APU"; Integer) { }
//         field(30; "ACFT_TYPE"; Text[100]) { }
//     }
//     KEYS
//     {
//         Key(PK; Id) { Clustered = true; }
//     }
//     trigger OnInsert()
//     Var
//         recWorkReport: Record 90104;
//         iId: Integer;
//     BEGIN
//         recWorkReport.RESET;
//         iId := 0;
//         IF recWorkReport.FINDLAST THEN
//             EVALUATE(iId, recWorkReport.Id);

//         Id := FORMAT(iId + 1);
//         Id := PADSTR('', 10 - STRLEN(Id), '0') + Id;
//     END;

//     trigger OnDelete()
//     Var
//         recPersonnel: Record 90107;
//         recMainCheck: Record 90106;
//     BEGIN

//         recPersonnel.RESET;
//         recPersonnel.SETRANGE("Work Report Id", Id);
//         recPersonnel.DELETEALL;

//         recMainCheck.RESET;
//         recMainCheck.SETRANGE("Work Report Id", Id);
//         recMainCheck.DELETEALL;
//     END;

// }

// Table 90105 "MOEP Options"
// {
//     FIELDS
//     {
//         field(1; "Field"; Code[30]) { Description = 'Campo al que hace referencia'; }
//         field(2; "Code"; Code[30]) { Description = 'Codigo Opcion'; }
//         field(3; "Description"; Text[100]) { Description = 'Descripcion'; }
//     }
//     KEYS
//     {
//         Key(PK; Field, Code) { Clustered = true; }
//     }
//     FIELDGROUPS
//     {
//         fieldgroup(DropDown; Code) { }
//     }

// }

// Table 90106 "Work Report Main Check"
// {
//     FIELDS
//     {
//         field(1; "Work Report Id"; Code[10]) { TableRelation = "MOEP WorkReport".Id; }
//         field(2; "Main Check"; Code[30])
//         {
//             TableRelation = "MOEP Options".Code WHERE(Field = CONST('MAINCHECK'));
//         }
//         field(3; "Main Check Description"; Text[100])
//         {
//             FieldClass = FlowField;
//             CalcFormula = Lookup("MOEP Options".Description WHERE(Field = CONST('MAINCHECK'),
//      Code = FIELD("Main Check")));
//         }
//     }
//     KEYS
//     {
//         Key(PK; "Work Report Id", "Main Check") { Clustered = true; }
//     }

// }

// Table 90107 "Work Report Personnel"
// {
//     FIELDS
//     {
//         field(1; "Work Report Id"; Code[10]) { TableRelation = "MOEP WorkReport".Id; }
//         field(2; "Type"; Option) { OptionMembers = Outgoing,Incoming; }
//         field(3; "Technician"; Code[20]) { TableRelation = Resource."No." WHERE("WorkReport Type" = CONST(Technician)); }
//         field(4; "Technician name"; Text[100])
//         {
//             FieldClass = FlowField;
//             CalcFormula = Lookup(Resource.Name WHERE("No." = FIELD(Technician)));
//         }
//     }
//     KEYS
//     {
//         Key(PK; "Work Report Id", Type, Technician) { Clustered = true; }
//     }

// }

Table 90108 "Factura simplificada"
{


    FIELDS
    {
        field(1; "Document No."; Code[20])
        {
            Caption = 'Nº documento';
            trigger OnValidate()
            VAR
                NoSeries: Codeunit "No. Series";
            BEGIN
                IF "Document No." <> xRec."Document No." THEN BEGIN
                    PurchSetup.GET;
                    PurchSetup.TESTFIELD("Simplified Invoice Nos.");
                    NoSeries.TestManual(PurchSetup."Simplified Invoice Nos.");
                    "No. Series" := '';
                END;
            END;

        }
        field(2; "Line No."; Integer) { Caption = 'Nº línea'; }
        field(3; "Bill-from Vendor No."; Code[20])
        {
            TableRelation = Vendor;
            Caption = 'Factura-de Nº proveedor';
            NotBlank = true;
            trigger OnValidate()
            BEGIN
                GetVend("Bill-from Vendor No.");
                Vend.CheckBlockedVendOnDocs(Vend, FALSE);
                "Bill-from Name" := Vend.Name;
                "Bill-from Name 2" := Vend."Name 2";
                "Bill-from Address" := Vend.Address;
                "Bill-from Address 2" := Vend."Address 2";
                "Bill-from City" := Vend.City;
                "Bill-from Post Code" := Vend."Post Code";
                "Bill-from County" := Vend.County;
                "Bill-from Country Code" := Vend."Country/Region Code";
                "VAT Registration No." := Vend."VAT Registration No.";

                CreateDim(
            DATABASE::Vendor, "Bill-from Vendor No.",
            DATABASE::"Salesperson/Purchaser", '',
            DATABASE::Campaign, '',
            DATABASE::"Responsibility Center", '');
            END;

        }
        field(4; "Bill-from Name"; Text[30]) { Caption = 'Fact. de-Nombre'; }
        field(5; "Bill-from Name 2"; Text[30]) { Caption = 'Fact. de-Nombre 2'; }
        field(6; "Bill-from Address"; Text[30]) { Caption = 'Fact. de-Dirección'; }
        field(7; "Bill-from Address 2"; Text[30]) { Caption = 'Fact. de-Dirección 2'; }
        field(8; "Bill-from City"; Text[30])
        {
            Caption = 'Fact. de-Población';
            trigger OnValidate()
            BEGIN
                PostCode.ValidateCity("Bill-from City", "Bill-from Post Code", "Bill-from County", "Bill-from Country Code", (CurrFieldNo <> 0) AND GUIALLOWED);
            END;

        }
        field(9; "Bill-from Contact"; Text[30]) { Caption = 'Fact. de-Atención'; }
        field(10; "Bill-from Post Code"; Code[20])
        {
            ValidateTableRelation = false;
            //TestTableRelation = false;
            Caption = 'Fact. de-C.P.';
            TableRelation = "Post Code";
            trigger OnValidate()
            BEGIN
                PostCode.ValidatePostCode("Bill-from City", "Bill-from Post Code", "Bill-from County", "Bill-from Country Code", (CurrFieldNo <> 0) AND GUIALLOWED);
            END;

        }
        field(11; "Bill-from County"; Text[30]) { Caption = 'Fact. de-Provincia'; }
        field(12; "Bill-from Country Code"; Code[10])
        {
            TableRelation = "Country/Region";
            Caption = 'Fact. de-Cód. país';
        }
        field(13; "Description"; Text[50]) { Caption = 'Descripción'; }
        field(20; "Posting Date"; Date)
        {
            Caption = 'Fecha registro';
            trigger OnValidate()
            Var
                NoSeries: Record 308;
            BEGIN
                // SIIME
                CompanyInfo.GET;
                IF CompanyInfo."Activar SIIME" THEN
                    VALIDATE("Fecha operación", "Posting Date");
                // SIIME
            END;

        }
        field(29; "Shortcut Dimension 1 Code"; Code[20])
        {
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
            Caption = 'Cód. dim. acceso dir. 1';
            CaptionClass = '1,2,1';
            trigger OnValidate()
            BEGIN
                ValidateShortcutDimCode(1, "Shortcut Dimension 1 Code");
                MODIFY;
            END;

        }
        field(30; "Shortcut Dimension 2 Code"; Code[20])
        {
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
            Caption = 'Cód. dim. acceso dir. 2';
            CaptionClass = '1,2,2';
            trigger OnValidate()
            BEGIN
                ValidateShortcutDimCode(2, "Shortcut Dimension 2 Code");
                MODIFY;
            END;

        }
        //     field(46;"Comment"; Boolean)
        //     {
        //         Caption = 'Importe';
        //         AutoFormatType = 1;
        //         FieldClass = FlowField;
        //         CalcFormula = Exist("Purch. Comment Line" WHERE("Document Type" = CONST("Simplified Invoice"),
        //"No." = FIELD("Document No.")));
        //         Caption = 'Comentario';
        //         Editable = false;
        //     }
        field(60; "Amount"; Decimal)
        {
            ; trigger OnValidate()
            BEGIN
                IF "VAT %" <> 0 THEN
                    "VAT Amount" := ROUND((Amount / 100) * "VAT %", 0.01);
                "Amount Including VAT" := Amount + "VAT Amount";
            END;

        }
        field(61; "Amount Including VAT"; Decimal)
        {
            Caption = 'Importe IVA incl.';
            AutoFormatType = 1;
            trigger OnValidate()
            BEGIN
                IF "VAT %" <> 0 THEN
                    "VAT Amount" := ROUND(("Amount Including VAT" * "VAT %") / (100 + "VAT %"), 0.01);

                Amount := "Amount Including VAT" - "VAT Amount";
            END;

        }
        field(62; "VAT %"; Decimal)
        {
            Caption = '% IVA';
            DecimalPlaces = 0 : 6;
            trigger OnValidate()
            BEGIN
                IF Amount <> 0 THEN
                    "VAT Amount" := ROUND((Amount / 100) * "VAT %", 0.01);

                "Amount Including VAT" := Amount + "VAT Amount";
            END;

        }
        field(63; "VAT Amount"; Decimal)
        {
            Caption = 'Importe IVA';
            trigger OnValidate()
            BEGIN
                IF Amount <> 0 THEN
                    "VAT %" := ROUND(("VAT Amount" * 100) / Amount, 1);

                "Amount Including VAT" := Amount + "VAT Amount";
            END;

        }
        field(68; "Vendor Invoice No."; Code[20]) { Caption = 'Nº factura proveedor'; }
        field(70; "VAT Registration No."; Text[20])
        {
            Caption = 'CIF/NIF';
            trigger OnValidate()
            BEGIN
                "VAT Registration No." := UPPERCASE(DELCHR("VAT Registration No.", '=', '.-\/'));
            END;

        }
        field(73; "Reason Code"; Code[10])
        {
            TableRelation = "Reason Code";
            Caption = 'Cód. auditoría';
        }
        field(78; "VAT Country Code"; Code[10])
        {
            TableRelation = "Country/Region";
            Caption = 'Cód. IVA país';
        }
        field(107; "No. Series"; Code[10])
        {
            TableRelation = "No. Series";
            Caption = 'Nos. serie';
            Editable = false;
        }
        field(112; "User ID"; Code[20])
        {
            ValidateTableRelation = false;
            Caption = 'Id. usuario';
            TableRelation = User;
            trigger OnLookup()
            VAR
                LoginMgt: Codeunit 418;
            BEGIN
                //  LoginMgt.LookupUserID("User ID");
            END;

        }
        field(120; "Status"; Option)
        {
            Caption = 'Estado';
            OptionMembers = Open,Released,Closed;
            Editable = false;
        }
        field(480; "Dimension Set ID"; Integer)
        {
            Caption = 'Id. grupo dimensiones';
            Editable = false;
            TableRelation = "Dimension Set Entry";
            trigger OnLookup()
            BEGIN
                ShowDocDim;
            END;

        }
        field(5000; "Account Type"; Option)
        {
            Caption = 'Tipo mov.';
            OptionMembers = "G/L Account",Customer,Vendor,"Bank Account";
            trigger OnValidate()
            BEGIN
                IF "Account Type" <> xRec."Account Type" THEN
                    "Expense account" := '';
            END;

        }
        field(5001; "Expense account"; Code[20])
        {
            TableRelation = IF ("Bal. Account Type" = CONST("G/L Account")) "G/L Account"
            ELSE
            IF ("Bal. Account Type" = CONST(Customer)) Customer
            ELSE
            IF ("Bal. Account Type" = CONST(Vendor)) Vendor
            ELSE
            IF ("Bal. Account Type" = CONST("Bank Account")) "Bank Account";
            Caption = 'Cuenta de gasto';
        }
        field(5002; "Bal. Account Type"; Option)
        {
            Caption = 'Tipo contrapartida';
            OptionMembers = "G/L Account",Customer,Vendor,"Bank Account";
            trigger OnValidate()
            BEGIN
                IF "Bal. Account Type" <> xRec."Bal. Account Type" THEN
                    "Bal. Account No." := '';
            END;

        }
        field(5003; "Bal. Account No."; Code[20])
        {
            TableRelation = IF ("Bal. Account Type" = CONST("G/L Account")) "G/L Account"
            ELSE
            IF ("Bal. Account Type" = CONST(Customer)) Customer
            ELSE
            IF ("Bal. Account Type" = CONST(Vendor)) Vendor
            ELSE
            IF ("Bal. Account Type" = CONST("Bank Account")) "Bank Account";
            Caption = 'Cta. contrapartida';
        }
        field(5796; "Date Filter"; Date)
        {
            ; FieldClass = FlowFilter;
            Caption = 'Filtro fecha';
        }
        field(70000; "Clave tipo factura"; Code[10])
        {
            TableRelation = "Claves SIIME".Código WHERE(Tipo = CONST("Clave tipo factura recibida"));
            Description = 'SIIME';
        }
        field(70001; "Clave tipo factura rectific."; Code[10])
        {
            TableRelation = "Claves SIIME".Código WHERE(Tipo = CONST("Clave tipo factura rectificativa recibida"));
            Description = 'SIIME';
        }
        field(70002; "Descripción de la operación"; Text[100]) { Description = 'SIIME'; }
        field(70003; "Fecha operación"; Date) { Description = 'SIIME'; }
        field(70004; "Clave régimen esp. op. trans."; Code[10])
        {
            TableRelation = "Claves SIIME".Código WHERE(Tipo = CONST("Clave régimen especial facturas recibidas"));
            Description = 'SIIME';
        }
        field(70005; "Esperar SIIME"; Boolean) {; Description = 'SIIME'; }
        field(70006; "Ventas o servicios"; Code[10])
        {
            TableRelation = "Claves SIIME".Código WHERE
    (Tipo = CONST("Ventas o servicios (facturas)"));
            Description = 'SIIME';
        }
        field(70007; "Tipo factura rectificativa"; Code[10])
        {
            TableRelation = "Claves SIIME".Código WHERE(Tipo = CONST("Tipo factura rectificativa"));
            Description = 'SIIME';
        }
        field(70008; "Tipo no exención"; Code[10])
        {
            TableRelation = "Claves SIIME".Código WHERE(Tipo = CONST("Tipo no exención"));
            Description = 'SIIME';
        }
        field(70009; "Causa exención"; Code[10])
        {
            TableRelation = "Claves SIIME".Código WHERE(Tipo = CONST("Causa exención"));
            Description = 'SIIME';
        }
        field(70010; "Tipo id. fiscal país residen."; Code[10])
        {
            TableRelation = "Claves SIIME".Código WHERE(Tipo = CONST("Tipo id. fiscal país residencia"));
        }
        field(70011; "Clave rég. esp. op. trans. ad1"; Code[10])
        {
            TableRelation = "Claves SIIME".Código WHERE(Tipo = CONST("Clave régimen especial facturas recibidas"));
        }
        field(70012; "Clave rég. esp. op. trans. ad2"; Code[10])
        {
            TableRelation = "Claves SIIME".Código WHERE(Tipo = CONST("Clave régimen especial facturas recibidas"));
        }
        field(70013; "Emitida por terceros"; Boolean)
        {
            trigger OnValidate()
            BEGIN
                //SIIME V1.1
                IF "Emitida por terceros" THEN
                    TESTFIELD("Fact. disp. adic. terc. y sext", FALSE);
                //SIIME V1.1
            END;

        }
        field(70016; "Factura sin identif. destinata"; Boolean)
        {
            Description = 'SIIME;V1.1';
            trigger OnValidate()
            BEGIN
                IF "Factura sin identif. destinata" THEN BEGIN
                    ClavesSIIME.GET(ClavesSIIME.Tipo::"Clave tipo factura emitida", "Clave tipo factura");
                    IF NOT (ClavesSIIME.Valor IN ['F2', 'F4', 'R5']) THEN
                        ERROR(Text70000, FIELDCAPTION("Factura sin identif. destinata"), "Factura sin identif. destinata", FIELDCAPTION("Clave tipo factura"));
                END;
            END;

        }
        field(70017; "Fact. disp. adic. terc. y sext"; Boolean)
        {
            Description = 'SIIME;V1.1';
            trigger OnValidate()
            BEGIN
                IF "Fact. disp. adic. terc. y sext" THEN
                    TESTFIELD("Emitida por terceros", FALSE);
            END;

        }
        field(70018; "Facturas simplificadas"; Boolean)
        {
            Description = 'SIIME;V1.1';
            trigger OnValidate()
            BEGIN
                IF "Facturas simplificadas" THEN BEGIN
                    ClavesSIIME.GET(ClavesSIIME.Tipo::"Clave tipo factura emitida", "Clave tipo factura");
                    IF (ClavesSIIME.Valor IN ['F1', 'F3', 'R1', 'R2', 'R3', 'R4']) THEN
                        ERROR(Text70000, FIELDCAPTION("Facturas simplificadas"), "Facturas simplificadas", FIELDCAPTION("Clave tipo factura"));
                END;
            END;

        }
        field(70019; "Referencia Externa"; Text[250]) { Description = 'SIIME;V1.1'; }
        field(70020; "Entidad sucedida"; Text[50]) { Description = 'SIIME;V1.1'; }
        field(70021; "NIF Entidad sucedida"; Text[20]) { Description = 'SIIME;V1.1'; }
        field(70022; "Reg. Previo GGEE o REDEME"; Boolean) { Description = 'SIIME;V1.1'; }
        field(80000; "CSV AEAT"; Text[100]) { Editable = false; }
        field(80001; "Código error AEAT"; Text[30]) { Editable = false; }
        field(80002; "Descripción error AEAT"; Text[250]) { Editable = false; }
        field(80003; "Estado AEAT"; Text[30]) { Editable = false; }
        field(80004; "Fecha envío AEAT"; Date) {; Editable = false; }
        field(80005; "Hora envío AEAT"; Time) {; Editable = false; }
        field(80006; "Estado cuadre AEAT"; Code[10])
        {
            TableRelation = "Claves SIIME".Código WHERE(Tipo = CONST("Estado cuadre"));
            Description = 'SIIME;V1.1';
        }
    }
    KEYS
    {
        Key(PK; "Document No.") { Clustered = true; }
        Key(PK2; Status, "Document No.") { }
    }
    trigger OnInsert()
    VAR
        NoSeries: Codeunit "No. Series";
    Begin
        PurchSetup.GET;

        IF "Document No." = '' THEN BEGIN
            PurchSetup.TESTFIELD("Simplified Invoice Nos.");
            "No. Series" := PurchSetup."Simplified Invoice Nos.";
            IF NoSeries.AreRelated(PurchSetup."Simplified Invoice Nos.", xRec."No. Series") THEN
                "No. Series" := xRec."No. Series";
            "Document No." := NoSeries.GetNextNo("No. Series", "Posting Date");
        END;

        // SIIME
        CompanyInfo.GET;
        IF ClavesSIIME.READPERMISSION AND CompanyInfo."Activar SIIME" THEN BEGIN
            VALIDATE("Fecha operación", "Posting Date");
            // Clave tipo factura
            ClavesSIIME.RESET;
            ClavesSIIME.SETRANGE(ClavesSIIME.Tipo, ClavesSIIME.Tipo::"Clave tipo factura recibida");
            ClavesSIIME.SETRANGE(Defecto, TRUE);
            IF ClavesSIIME.FINDFIRST THEN
                VALIDATE("Clave tipo factura", ClavesSIIME.Código);
            // Clave régimen especial operaciones transcendencia
            ClavesSIIME.RESET;
            ClavesSIIME.SETRANGE(ClavesSIIME.Tipo, ClavesSIIME.Tipo::"Clave régimen especial facturas recibidas");
            ClavesSIIME.SETRANGE(Defecto, TRUE);
            IF ClavesSIIME.FINDFIRST THEN
                VALIDATE("Clave régimen esp. op. trans.", ClavesSIIME.Código);
            // Ventas o servicios
            //{ CREO QUE NO HAY PARA COMPRAS
            ClavesSIIME.RESET;
            ClavesSIIME.SETRANGE(ClavesSIIME.Tipo, ClavesSIIME.Tipo::"Ventas o servicios (facturas)");
            ClavesSIIME.SETRANGE(Defecto, TRUE);
            IF ClavesSIIME.FINDFIRST THEN
                VALIDATE("Ventas o servicios", ClavesSIIME.Código);

            // Tipo no exención
            ClavesSIIME.RESET;
            ClavesSIIME.SETRANGE(ClavesSIIME.Tipo, ClavesSIIME.Tipo::"Tipo no exención");
            ClavesSIIME.SETRANGE(Defecto, TRUE);
            IF ClavesSIIME.FINDFIRST THEN
                VALIDATE("Tipo no exención", ClavesSIIME.Código);
            // Causa exención
            ClavesSIIME.RESET;
            ClavesSIIME.SETRANGE(ClavesSIIME.Tipo, ClavesSIIME.Tipo::"Causa exención");
            ClavesSIIME.SETRANGE(Defecto, TRUE);
            IF ClavesSIIME.FINDFIRST THEN
                VALIDATE("Causa exención", ClavesSIIME.Código);
        END;
        // SIIME
    END;

    VAR
        PostCode: Record 225;
        Vend: Record 23;
        CompanyInfo: Record 79;
        ClavesSIIME: Record 90102;
        PurchSetup: Record 312;
        GenJnlLineNextNo: Integer;
        GenJnlLine: Record 81;
        TransactionNo: Integer;
        TemplName: Code[10];
        BatchName: Code[10];
        DimMgt: Codeunit 408;
        JnlLineDim: Record 81;
        GenJnlPostLine: Codeunit 12;
        OldPurchHeader: Record 90108;
        Text70000: Label '%1 no puede tener el valor %2, sin %3 no tiene el valor F2, F4 o R5';

    LOCAL PROCEDURE GetVend(VendNo: Code[20]);
    BEGIN
        IF VendNo <> Vend."No." THEN
            Vend.GET(VendNo);
    END;

    PROCEDURE AssistEdit(OldPurchHeader: Record 90108): Boolean;
    VAR
        PurchHeader2: Record 90108;
        NoSeries: Codeunit "No. Series";
    BEGIN
        PurchSetup.GET;
        PurchSetup.TESTFIELD("Simplified Invoice Nos.");
        IF NoSeries.LookupRelatedNoSeries(PurchSetup."Simplified Invoice Nos.", OldPurchHeader."No. Series", "No. Series") THEN BEGIN
            "Document No." := NoSeries.GetNextNo("No. Series");
            IF PurchHeader2.GET("Document No.") THEN
                ERROR('El documento %1 ya existe.', "Document No.");
            EXIT(TRUE);
        END;
    END;

    PROCEDURE Open();
    BEGIN
        IF Status = Status::Released THEN BEGIN
            Status := Status::Open;
            MODIFY;
        END;
    END;

    PROCEDURE Released();
    BEGIN
        IF Status = Status::Open THEN BEGIN
            Status := Status::Released;
            MODIFY;
        END;
    END;

    /*
        PROCEDURE InsertGenJournalLine(AccType: Integer; AccNo: Code[20]; Amount2: Decimal; Text: Text[250];
        Dep: Code[20]; Proj: Code[20]; EntryNo: Integer; BalAccType: Integer; BalAccNo: Code[20]; ReasonCode: Code[20]
        ; PostingDate: Date; DocumentNo: Code[20]; DocumentExtNo: Code[20]; IdDimen: Integer);
        VAR
            CustLedgEntry2: Record 21;
            Rec242: Record 242;
            Rec312: Record 312;
        BEGIN
            GenJnlLineNextNo := GenJnlLineNextNo + 10000;

            Rec242.GET;

            WITH GenJnlLine DO BEGIN
                CLEAR(GenJnlLine);
                INIT;
                "Line No." := GenJnlLineNextNo;
                "Transaction No." := TransactionNo;
                "Journal Template Name" := TemplName;
                "Journal Batch Name" := BatchName;
                "Posting Date" := PostingDate;
                "Document No." := DocumentNo;
                "System-Created Entry" := TRUE;
                VALIDATE("Account Type", AccType);
                VALIDATE("Account No.", AccNo);
                Rec312.GET;
                IF Rec312."Ext. Doc. No. Mandatory" THEN
                    IF DocumentExtNo = '' THEN
                        ERROR('No. factura proveedor, no puede estar en blanco');
                "External Document No." := DocumentExtNo;
                "VAT Posting" := 0;
               // "Gen. Posting Type" := 0;
                "Gen. Posting Type" := "Gen. Posting Type"::" ";
                "Gen. Bus. Posting Group" := '';
                "Gen. Prod. Posting Group" := '';
                "VAT Bus. Posting Group" := '';
                "VAT Prod. Posting Group" := '';
                Description := Text;
                VALIDATE(Amount, Amount2);
                VALIDATE("Bal. Account Type", BalAccType);
                VALIDATE("Bal. Account No.", BalAccNo);
                "Bal. VAT Calculation Type" := 0;
                 //"Bal. VAT Calculation Type" := "Bal. VAT Calculation Type"::"Full VAT"
                "Bal. Gen. Posting Type" := 0;
                "Bal. Gen. Bus. Posting Group" := '';
                "Bal. Gen. Prod. Posting Group" := '';
                "Bal. VAT Bus. Posting Group" := '';
                "Bal. VAT Prod. Posting Group" := '';
                "Source Code" := Rec242.Purchases;
                "Reason Code" := ReasonCode;
                VALIDATE("Shortcut Dimension 1 Code", Dep);
                VALIDATE("Shortcut Dimension 2 Code", Proj);
                "Dimension Set ID" := IdDimen;
                GenJnlPostLine.RunWithCheck(GenJnlLine);
            END;
        END;
    */
    PROCEDURE Navigate();
    VAR
        NavigateForm: Page 344;
    BEGIN
        NavigateForm.SetDoc("Posting Date", "Document No.");
        NavigateForm.RUN;
    END;

    PROCEDURE CreateDim(Type1: Integer; No1: Code[20]; Type2: Integer; No2: Code[20];
    Type3: Integer; No3: Code[20]; Type4: Integer; No4: Code[20]);
    VAR
        SourceCodeSetup: Record 242;
        TableID: ARRAY[10] OF Integer;
        No: ARRAY[10] OF Code[20];
        OldDimSetID: Integer;
        DefaultDimSourceID: List of [Dictionary of [Integer, Code[20]]];
    BEGIN
        SourceCodeSetup.GET;
        TableID[1] := Type1;
        No[1] := No1;
        TableID[2] := Type2;
        No[2] := No2;
        TableID[3] := Type3;
        No[3] := No3;
        TableID[4] := Type4;
        No[4] := No4;
        "Shortcut Dimension 1 Code" := '';
        "Shortcut Dimension 2 Code" := '';
        OldDimSetID := "Dimension Set ID";
        // "Dimension Set ID" :=
        // //  DimMgt.GetDefaultDimID(TableID, No, SourceCodeSetup.Purchases, "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code", 0, 0);
        // DimMgt.GetDefaultDimID(DefaultDimSourceID, No, SourceCodeSetup.Purchases, "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code", 0, 0);
        // //DefaultDimSource: List of [Dictionary of [Integer, Code[20]]]; SourceCode: Code[20]; var GlobalDim1Code: Code[20]; var GlobalDim2Code: Code[20]; InheritFromDimSetID: Integer; InheritFromTableNo: Integer): Integer
        IF (OldDimSetID <> "Dimension Set ID") THEN
            MODIFY;
    END;

    LOCAL PROCEDURE ValidateShortcutDimCode(FieldNumber: Integer; VAR ShortcutDimCode: Code[20]);
    VAR
        OldDimSetID: Integer;
    BEGIN
        OldDimSetID := "Dimension Set ID";
        DimMgt.ValidateShortcutDimValues(FieldNumber, ShortcutDimCode, "Dimension Set ID");
        IF "Document No." <> '' THEN
            MODIFY;

        IF OldDimSetID <> "Dimension Set ID" THEN
            MODIFY;
    END;

    PROCEDURE ShowDocDim();
    VAR
        OldDimSetID: Integer;
    BEGIN
        OldDimSetID := "Dimension Set ID";
        // "Dimension Set ID" :=
        //   DimMgt.EditDimensionSet2(
        // "Dimension Set ID",STRSUBSTNO('%1 %2',0,"Document No."),
        // "Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");

        IF OldDimSetID <> "Dimension Set ID" THEN
            MODIFY;
    end;
}

Table 90109 BORRAR
{
    FIELDS
    {
        field(1; "User ID"; Code[20]) { }
        field(2; "Password"; Text[50]) { }
        field(3; "Resource No."; Code[20]) { TableRelation = Resource."No." WHERE("No." = FIELD("Resource No.")); }
        field(4; "Blocked"; Boolean) { }
        field(5; "Windows User"; Boolean) { }
    }
    KEYS
    {
        Key(PK; "User ID") { Clustered = true; }
    }

}

Table 90200 "Migración: Cuentas"
{
    FIELDS
    {
        field(1; "Cuenta original"; Text[30]) { }
        field(2; "Descripción"; Text[100]) { }
        field(3; "Tipo Cuenta NAV"; Option) { OptionMembers = "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner"; }
        field(4; "Cuenta NAV"; Code[100])
        {
            Caption = 'Nº cuenta';
            TableRelation = IF ("Tipo Cuenta NAV" = CONST("G/L Account")) "G/L Account"
            ELSE
            IF ("Tipo Cuenta NAV" = CONST(Customer)) Customer
            ELSE
            IF ("Tipo Cuenta NAV" = CONST(Vendor)) Vendor
            ELSE
            IF ("Tipo Cuenta NAV" = CONST("Bank Account")) "Bank Account"
            ELSE
            IF ("Tipo Cuenta NAV" = CONST("Fixed Asset")) "Fixed Asset"
            ELSE
            IF ("Tipo Cuenta NAV" = CONST("IC Partner")) "IC Partner";
            trigger OnValidate()
            BEGIN
                IF "Cuenta NAV" = '' THEN BEGIN
                    "Nombre cuenta" := '';
                    EXIT;
                END;

                IF "Tipo Cuenta NAV" = "Tipo Cuenta NAV"::"G/L Account" THEN BEGIN
                    pCuenta.GET("Cuenta NAV");
                    "Nombre cuenta" := pCuenta.Name;
                END;


                IF "Tipo Cuenta NAV" = "Tipo Cuenta NAV"::Customer THEN BEGIN
                    pCliente.GET("Cuenta NAV");
                    "Nombre cuenta" := pCliente.Name;
                END;

                IF "Tipo Cuenta NAV" = "Tipo Cuenta NAV"::Vendor THEN BEGIN
                    pProveedor.GET("Cuenta NAV");
                    "Nombre cuenta" := pProveedor.Name;
                END;


                IF "Tipo Cuenta NAV" = "Tipo Cuenta NAV"::"Bank Account" THEN BEGIN
                    pBanco.GET("Cuenta NAV");
                    "Nombre cuenta" := pBanco.Name;
                END;
            END;

        }
        field(5; "Account Type"; Option)
        {
            Caption = 'Tipo mov.';
            OptionMembers = Posting,Heading;
            Editable = false;
            trigger OnValidate()
            VAR
                GLEntry: Record 17;
                GLBudgetEntry: Record 96;
            BEGIN
            END;

        }
        field(6; "Global Dimension 1 Code"; Code[20])
        {
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
            Caption = 'Cód. dimensión global 1';
            CaptionClass = '1,1,1';
        }
        field(7; "Global Dimension 2 Code"; Code[20])
        {
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
            Caption = 'Cód. dimensión global 2';
            CaptionClass = '1,1,2';
        }
        field(8; "Eliminar"; Boolean) { }
        field(9; "Nombre cuenta"; Text[50]) { Editable = false; }
        field(10; "Actividad"; Code[20]) { TableRelation = "Dimension Value".Code WHERE("Dimension Code" = CONST('ACTIVIDAD')); }
    }
    KEYS
    {
        Key(PK; "Cuenta original") { Clustered = true; }
    }

    VAR
        pCuenta: Record 15;
        pCliente: Record 18;
        pProveedor: Record 23;
        pBanco: Record 270;


}

Table 90201 "Migración: Asientos"
{
    FIELDS
    {
        field(1; "N movimiento"; Integer) { }
        field(2; "N asiento"; Integer) { }
        field(3; "N documento"; Code[20]) { }
        field(4; "Cuenta"; Text[30])
        {
            TableRelation = "Migración: Cuentas";
            ValidateTableRelation = false;
        }
        field(5; "Descripción"; Text[50]) { }
        field(6; "Debe"; Decimal) { }
        field(7; "Haber"; Decimal) { }
        field(8; "Fecha"; Date) { }
        field(10; "Concepto"; Text[50]) { }
        field(11; "TipoProcedencia"; Code[10]) { }
        field(12; "CodigoProcedencia"; Code[10]) { }
        field(100; "ERRORES"; Boolean) { }
        field(101; "Falta cuenta original"; Boolean)
        {
            trigger OnValidate()
            BEGIN
                TestError;
            END;
        }
        field(102; "Falta cuenta NAV"; Boolean)
        {
            ; trigger OnValidate()
            BEGIN
                TestError;
            END;
        }
        field(103; "Falta dimensiones NAV"; Boolean)
        {
            trigger OnValidate()
            BEGIN
                TestError;
            END;
        }
        field(104; "No cuadra el asiento"; Boolean)
        {
            trigger OnValidate()
            BEGIN
                TestError;
            END;
        }

        field(110; "Descripción error"; Text[100]) { }
        field(200; "Tipo Cuenta NAV"; Option)
        {
            OptionMembers = "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner";
        }
        field(201; "Cuenta NAV"; Code[20])
        {
            TableRelation = IF ("Tipo Cuenta NAV" = CONST("G/L Account")) "G/L Account"
            ELSE
            IF ("Tipo Cuenta NAV" = CONST(Customer)) Customer
            ELSE
            IF ("Tipo Cuenta NAV" = CONST(Vendor)) Vendor
            ELSE
            IF ("Tipo Cuenta NAV" = CONST("Bank Account")) "Bank Account"
            ELSE
            IF ("Tipo Cuenta NAV" = CONST("Fixed Asset")) "Fixed Asset"
            ELSE
            IF ("Tipo Cuenta NAV" = CONST("IC Partner")) "IC Partner";
            Caption = 'Nº cuenta';
        }
        field(202; "Global Dimension 1 Code"; Code[20])
        {
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
            Caption = 'Cód. dimensión global 1';
            CaptionClass = '1,1,1';
        }
        field(203; "Global Dimension 2 Code"; Code[20])
        {
            ; TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
            Caption = 'Cód. dimensión global 2';
            CaptionClass = '1,1,2';
        }
        field(204; "Global Dimension 3 Code"; Code[20])
        {
            ; TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3));
            Caption = 'Cód. dimensión global 3';
            CaptionClass = '1,1,3';
        }
        field(205; "Global Dimension 4 Code"; Code[20])
        {
            ; TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(4));
            Caption = 'Cód. dimensión global 4';
            CaptionClass = '1,1,4';
        }
        field(206; "Global Dimension 5 Code"; Code[20])
        {
            ; TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(5));
            Caption = 'Cód. dimensión global 5';
            CaptionClass = '1,1,5';
        }
        field(50000; "SALDO"; Decimal) { }
        field(50001; "Nuestra factura"; Code[20]) { }
        field(50002; "Cliente/Proveedor"; Code[20]) { }
        field(50003; "Base Imponible"; Decimal) { }
        field(50004; "Tipo de IVA"; Code[20]) { }
    }
    KEYS
    {
        Key(PK; "N movimiento") { Clustered = true; }
    }
    PROCEDURE TestError();
    BEGIN
        IF "Falta cuenta original" OR "Falta cuenta NAV" OR "Falta dimensiones NAV" OR "No cuadra el asiento" THEN
            ERRORES := TRUE
        ELSE
            ERRORES := FALSE;
    END;

    PROCEDURE RevisarCuentas();
    VAR
        pAsientos: Record 90201;
        pCuentasOriginales: Record 90200;
        pCuentasNAV: Record 15;
        pClientes: Record 18;
        pProveedores: Record 23;
        pBancos: Record 270;
    BEGIN

        pAsientos.RESET;
        IF pAsientos.FIND('-') THEN
            REPEAT
                pAsientos."Descripción error" := '';
                IF NOT pCuentasOriginales.GET(pAsientos.Cuenta) THEN BEGIN
                    pAsientos.VALIDATE(pAsientos."Falta cuenta original", TRUE);
                    pAsientos."Descripción error" := pAsientos."Descripción error" + 'Falta cuenta original. ';
                    pAsientos.MODIFY;
                END
                ELSE BEGIN
                    pAsientos.VALIDATE(pAsientos."Falta cuenta original", FALSE);
                    pAsientos.MODIFY;
                    IF pCuentasOriginales."Cuenta NAV" = '' THEN BEGIN
                        pAsientos.VALIDATE(pAsientos."Falta cuenta NAV", TRUE);
                        pAsientos."Descripción error" := pAsientos."Descripción error" + 'Falta cuenta NAV. ';
                        pAsientos.MODIFY;
                    END
                    ELSE BEGIN
                        pAsientos.VALIDATE(pAsientos."Falta cuenta NAV", FALSE);
                        IF pCuentasOriginales."Tipo Cuenta NAV" = pCuentasOriginales."Tipo Cuenta NAV"::"G/L Account" THEN
                            IF NOT pCuentasNAV.GET(pCuentasOriginales."Cuenta NAV") THEN BEGIN
                                pAsientos.VALIDATE(pAsientos."Falta cuenta NAV", TRUE);
                                pAsientos."Descripción error" := pAsientos."Descripción error" + 'Falta cuenta en plan contable NAV. ';
                            END;
                        IF pCuentasOriginales."Tipo Cuenta NAV" = pCuentasOriginales."Tipo Cuenta NAV"::Customer THEN
                            IF NOT pClientes.GET(pCuentasOriginales."Cuenta NAV") THEN BEGIN
                                pAsientos.VALIDATE(pAsientos."Falta cuenta NAV", TRUE);
                                pAsientos."Descripción error" := pAsientos."Descripción error" + 'Falta cliente en NAV. ';
                            END;
                        IF pCuentasOriginales."Tipo Cuenta NAV" = pCuentasOriginales."Tipo Cuenta NAV"::Vendor THEN
                            IF NOT pProveedores.GET(pCuentasOriginales."Cuenta NAV") THEN BEGIN
                                pAsientos.VALIDATE(pAsientos."Falta cuenta NAV", TRUE);
                                pAsientos."Descripción error" := pAsientos."Descripción error" + 'Falta proveedor en NAV. ';
                            END;
                        IF pCuentasOriginales."Tipo Cuenta NAV" = pCuentasOriginales."Tipo Cuenta NAV"::"Bank Account" THEN
                            IF NOT pBancos.GET(pCuentasOriginales."Cuenta NAV") THEN BEGIN
                                pAsientos.VALIDATE(pAsientos."Falta cuenta NAV", TRUE);
                                pAsientos."Descripción error" := pAsientos."Descripción error" + 'Falta banco en NAV. ';
                            END;
                        pAsientos.MODIFY;
                    END;
                END;
                pAsientos.MODIFY;
            UNTIL pAsientos.NEXT = 0;
    END;

    PROCEDURE RevisarSaldos();
    VAR
        pAsientosTMP: Record 90201 temporary;
        pAsientos: Record 90201;
    BEGIN

        //ERROR('No molas nada');


        pAsientosTMP.RESET;

        pAsientos.RESET;
        IF pAsientos.FIND('-') THEN

            //dfs controla fecha asiento
            Fecha := pAsientos.Fecha;

        REPEAT

            IF NOT pAsientosTMP.GET(pAsientos."N asiento") THEN BEGIN
                pAsientosTMP.INIT;
                pAsientosTMP."N movimiento" := pAsientos."N asiento";
                pAsientosTMP.Debe := 0;

                //dfs controla fecha asiento
                //IF Fecha <> pAsientosTMP.Fecha THEN
                // pAsientos.Actividad:='mal';


                pAsientosTMP.INSERT;
            END;
            pAsientosTMP.Debe := pAsientosTMP.Debe + pAsientos.Debe - pAsientos.Haber;


            pAsientosTMP.MODIFY;

        UNTIL pAsientos.NEXT = 0;



        IF pAsientosTMP.FIND('-') THEN
            REPEAT
                IF pAsientosTMP.Debe <> 0 THEN BEGIN
                    pAsientos.SETCURRENTKEY("N asiento");
                    pAsientos.SETRANGE("N asiento", pAsientosTMP."N movimiento");
                    pAsientos.MODIFYALL(pAsientos."Descripción error", 'Asiento descuadrado ' + FORMAT(pAsientosTMP.Debe));
                    pAsientos.MODIFYALL(pAsientos.ERRORES, TRUE);
                    pAsientos.MODIFYALL(pAsientos."No cuadra el asiento", TRUE);
                END
            UNTIL pAsientosTMP.NEXT = 0;
    END;

    PROCEDURE InicializarErrores();
    VAR
        pAsientos: Record 90201;
    BEGIN

        pAsientos.MODIFYALL(pAsientos.ERRORES, FALSE);
        pAsientos.MODIFYALL(pAsientos."Falta cuenta original", FALSE);
        pAsientos.MODIFYALL(pAsientos."Falta cuenta NAV", FALSE);
        pAsientos.MODIFYALL(pAsientos."Falta dimensiones NAV", FALSE);
        pAsientos.MODIFYALL(pAsientos."No cuadra el asiento", FALSE);
        pAsientos.MODIFYALL(pAsientos."Descripción error", '');
    END;

    PROCEDURE AsignarCuentas();
    VAR
        pAsientos: Record 90201;
        pCuentasOriginales: Record 90200;
    BEGIN
        //ERROR('No molas nada');

        pAsientos.RESET;
        IF pAsientos.FIND('-') THEN
            REPEAT
                IF NOT pAsientos.ERRORES THEN BEGIN
                    IF pCuentasOriginales.GET(pAsientos.Cuenta) THEN BEGIN
                        pAsientos."Tipo Cuenta NAV" := pCuentasOriginales."Tipo Cuenta NAV";
                        pAsientos."Cuenta NAV" := pCuentasOriginales."Cuenta NAV";
                        //     pAsientos."Global Dimension 1 Code" := pCuentasOriginales."Global Dimension 1 Code";
                        //     pAsientos."Global Dimension 2 Code" := pCuentasOriginales."Global Dimension 2 Code";
                        //     pAsientos.Actividad := pCuentasOriginales.Actividad;
                        pAsientos.MODIFY;
                    END
                END
            UNTIL pAsientos.NEXT = 0;
    END;

    PROCEDURE InsertarDiario();
    VAR
        window: Dialog;
        i: Integer;
        pAsientos: Record 90201;
        totreg: Integer;
        pDiarioGEN: Record 81;
    BEGIN


        //pDiarioGEN.RESET;
        //IF pDiarioGEN.FIND('-') THEN
        //  ERROR ('Para realizar el traspaso, el diario GENERAL/INTERFAZ debe estar vacío');

        window.OPEN('Fecha#1##################\\' +
        'Movimiento #2##################\\' +
        'i    #3##################\\' +
        'Total#4##################');

        i := 0;
        pAsientos.RESET;
        //pAsientos.SETCURRENTKEY( Fecha,"N movimiento" );
        //pAsientos.SETRANGE(pAsientos.Fecha, 010711D, 311211D );

        totreg := pAsientos.COUNT;
        window.UPDATE(4, totreg);

        IF pAsientos.FIND('-') THEN
            REPEAT

                i := i + 1;
                window.UPDATE(1, pAsientos.Fecha);
                window.UPDATE(2, pAsientos."N asiento");
                window.UPDATE(3, i);


                pDiarioGEN.INIT;
                pDiarioGEN.VALIDATE(pDiarioGEN."Journal Template Name", 'GENERAL');
                pDiarioGEN.VALIDATE(pDiarioGEN."Journal Batch Name", 'MIGRACION');
                pDiarioGEN.VALIDATE(pDiarioGEN."Transaction No.", pAsientos."N asiento");
                pDiarioGEN.VALIDATE(pDiarioGEN."Line No.", pAsientos."N movimiento" * 10000);
                pDiarioGEN.VALIDATE(pDiarioGEN."Document No.", pAsientos."N documento");
                pDiarioGEN.VALIDATE(pDiarioGEN."Posting Date", pAsientos.Fecha);
                pDiarioGEN.VALIDATE(pDiarioGEN."Posting Date", pAsientos.Fecha);
                pDiarioGEN.VALIDATE(pDiarioGEN.Description, pAsientos.Descripción);
                pDiarioGEN.VALIDATE(pDiarioGEN."Account Type", pAsientos."Tipo Cuenta NAV");
                pDiarioGEN.VALIDATE(pDiarioGEN."Account No.", pAsientos."Cuenta NAV");
                pDiarioGEN.VALIDATE(pDiarioGEN.Description, pAsientos.Concepto);



                pDiarioGEN.VALIDATE(pDiarioGEN."Shortcut Dimension 1 Code", pAsientos."Global Dimension 1 Code");
                // {
                //     reDimValue.RESET;
                //     IF reDimValue.GET('DEPARTAMENTO', pAsientos."Global Dimension 2 Code") THEN BEGIN
                // pDiarioGEN.VALIDATE ( pDiarioGEN."Shortcut Dimension 2 Code", pAsientos."Global Dimension 2 Code" );
                //     END
                //     ELSE BEGIN
                // pDiarioGEN.VALIDATE ( pDiarioGEN."Shortcut Dimension 2 Code", 'MIGRACION' );
                //     END;
                // }
                pDiarioGEN.VALIDATE(pDiarioGEN.Amount, pAsientos.Debe - pAsientos.Haber);
                //    pDiarioGEN.VALIDATE ( pDiarioGEN."Gen. Posting Type", 0 );
                //    pDiarioGEN.VALIDATE ( pDiarioGEN."Gen. Bus. Posting Group", '' );
                //    pDiarioGEN.VALIDATE ( pDiarioGEN."Gen. Prod. Posting Group", '' );
                //    IF pDiarioGEN."Document No." = '' THEN
                //pDiarioGEN."Document No." := 'APERTURA2011'; //+FORMAT(pDiarioGEN."Transaction No.");
                //    pDiarioGEN."Document No." := 'ASIENTO2013/'+FORMAT(pDiarioGEN."Transaction No.");
                //    IF pAsientos."N documento" <> '' THEN
                //pDiarioGEN."Document No." := (FORMAT(pDiarioGEN."Transaction No.") + '/' + pAsientos."N documento" )
                //    ELSE
                //pDiarioGEN."Document No." := (FORMAT(pDiarioGEN."Transaction No.") + '/SINDOC' );
                //
                //    pDiarioGEN.Description := pAsientos.Concepto;
                //    pDiarioGEN.Description := pAsientos.Descripción;

                pDiarioGEN.INSERT;

            // END;  // SI DISTINTO DE CIERRE11  DFS

            UNTIL pAsientos.NEXT = 0;

        window.CLOSE;
    end;
}

Table 90203 "Migración: Activos Fijos"
{
    FIELDS
    {
        field(1; "CODIGO ACTIVO"; Code[20]) { }
        field(2; "DESCRIPCION"; Text[50]) { }
        field(3; "GRUPO CONTABLE"; Code[20]) { }
        field(4; "FECHA DE COMPRA"; Date) { }
        field(5; "FECHA INICIO AMORTIZACIÓN"; Date) { }
        field(6; "AÑOS"; Integer) { }
        field(7; "PRECIO COMPRA"; Decimal) { }
        field(8; "AMORTIZ ACUMULADA"; Decimal) { }
        field(9; "VALOR NETO"; Decimal) { }
        field(10; "ALIAS"; Text[20]) { }
    }
    KEYS
    {
        Key(PK; "CODIGO ACTIVO") { Clustered = true; }
    }

    VAR
        rMigracionActivosFijos: Record 90203;
        rFichaActivos: Record 5600;
        rDepreciationBook: Record 5612;
        rDiarioAFDiarios: Record 5621;
        conta: Integer;

    PROCEDURE CrearFichaActivo();
    BEGIN

        IF rMigracionActivosFijos.FINDFIRST THEN BEGIN

            rFichaActivos.INIT;

            REPEAT

                rFichaActivos."No." := rMigracionActivosFijos."CODIGO ACTIVO";
                rFichaActivos.Description := rMigracionActivosFijos.DESCRIPCION;
                rFichaActivos.VALIDATE("FA Posting Group", rMigracionActivosFijos."GRUPO CONTABLE");
                rFichaActivos."Search Description" := rMigracionActivosFijos.ALIAS;
                rFichaActivos.INSERT;

            UNTIL rMigracionActivosFijos.NEXT = 0;

        END;

        MESSAGE('Terminó');
    END;

    PROCEDURE CrearDepreciationBook();
    BEGIN

        rDepreciationBook.RESET;

        IF rMigracionActivosFijos.FIND('-') THEN
            REPEAT

                rDepreciationBook.INIT;
                rDepreciationBook.VALIDATE(rDepreciationBook."FA No.", rMigracionActivosFijos."CODIGO ACTIVO");
                rDepreciationBook.VALIDATE(rDepreciationBook."Depreciation Book Code", 'COMPAÑÍA');
                rDepreciationBook.VALIDATE(rDepreciationBook."FA Posting Group", rMigracionActivosFijos."GRUPO CONTABLE");
                rDepreciationBook.VALIDATE(rDepreciationBook."Depreciation Starting Date", rMigracionActivosFijos."FECHA INICIO AMORTIZACIÓN");
                rDepreciationBook.VALIDATE(rDepreciationBook."No. of Depreciation Years", rMigracionActivosFijos.AÑOS);
                // rDepreciationBook.VALIDATE ( rDepreciationBook."Acquisition Date",rMigracionActivosFijos."FECHA DE COMPRA");
                //rDepreciationBook.VALIDATE ( rDepreciationBook.Depreciation,rMigracionActivosFijos."AMORTIZ ACUMULADA");
                // rDepreciationBook.VALIDATE ( rDepreciationBook."Book Value",rMigracionActivosFijos."VALOR NETO");
                // rDepreciationBook.VALIDATE ( rDepreciationBook."Acquisition Cost",rMigracionActivosFijos."PRECIO COMPRA");

                //rDepreciationBook.VALIDATE ( rDepreciationBook."Depreciation Ending Date",pActivosFijos."FECHA FINALIZACION");

                rDepreciationBook.INSERT;

            UNTIL rMigracionActivosFijos.NEXT = 0;

        MESSAGE('Terminó');
    END;

    PROCEDURE "Traspasar a A/F Diarios"();
    BEGIN



        rDiarioAFDiarios.RESET;

        rDiarioAFDiarios.SETFILTER(rDiarioAFDiarios."Journal Batch Name", 'ACTIVOS');
        rDiarioAFDiarios.SETFILTER(rDiarioAFDiarios."Journal Batch Name", 'ACTIVOS');

        IF rDiarioAFDiarios.FIND('-') THEN
            ERROR('Para realizar el traspaso, el diario ACTIVOS/ACTIVOS debe estar vacío');

        conta := 0;
        rDiarioAFDiarios.RESET;

        REPEAT

            conta := conta + 10000;


            //DFS GENERO EN EL DIARIO LAS LINEAS DE COSTE
            rDiarioAFDiarios.INIT;
            rDiarioAFDiarios.VALIDATE(rDiarioAFDiarios."Journal Template Name", 'ACTIVOS'); //ok manual
            rDiarioAFDiarios.VALIDATE(rDiarioAFDiarios."Journal Batch Name", 'ACTIVOS');    //ok manual
            rDiarioAFDiarios.VALIDATE(rDiarioAFDiarios."Line No.", conta);
            rDiarioAFDiarios.VALIDATE(rDiarioAFDiarios."Document No.", 'MIG-ACTIVOS');
            rDiarioAFDiarios.VALIDATE(rDiarioAFDiarios."Posting Date", rMigracionActivosFijos."FECHA INICIO AMORTIZACIÓN"); //ok tabla
            rDiarioAFDiarios.VALIDATE(rDiarioAFDiarios."FA Posting Date", rMigracionActivosFijos."FECHA INICIO AMORTIZACIÓN"); //ok tabla
            rDiarioAFDiarios.VALIDATE(rDiarioAFDiarios."FA No.", rMigracionActivosFijos."CODIGO ACTIVO");
            rDiarioAFDiarios.VALIDATE(rDiarioAFDiarios."Depreciation Book Code", 'COMPAÑÍA');
            rDiarioAFDiarios."FA Posting Type" := rDiarioAFDiarios."FA Posting Type"::"Acquisition Cost";
            rDiarioAFDiarios.VALIDATE(rDiarioAFDiarios.Amount, rMigracionActivosFijos."PRECIO COMPRA");

            rDiarioAFDiarios.INSERT;

            conta := conta + 10000;



            //Registrar la amortización


            rDiarioAFDiarios.INIT;
            rDiarioAFDiarios.VALIDATE(rDiarioAFDiarios."Journal Template Name", 'ACTIVOS');
            rDiarioAFDiarios.VALIDATE(rDiarioAFDiarios."Journal Batch Name", 'ACTIVOS');
            rDiarioAFDiarios.VALIDATE(rDiarioAFDiarios."FA Posting Date", 20140930D);
            rDiarioAFDiarios.VALIDATE(rDiarioAFDiarios."Line No.", conta);
            rDiarioAFDiarios."FA Posting Type" := (rDiarioAFDiarios."FA Posting Type"::Depreciation);
            rDiarioAFDiarios.VALIDATE(rDiarioAFDiarios."Document No.", 'MIG-ACTIVOS');
            rDiarioAFDiarios.VALIDATE(rDiarioAFDiarios.Description, rMigracionActivosFijos.DESCRIPCION);
            rDiarioAFDiarios.VALIDATE(rDiarioAFDiarios."FA No.", rMigracionActivosFijos."CODIGO ACTIVO");
            rDiarioAFDiarios.VALIDATE(rDiarioAFDiarios."Depreciation Book Code", 'COMPAÑÍA');
            rDiarioAFDiarios.VALIDATE(rDiarioAFDiarios.Amount, rMigracionActivosFijos."AMORTIZ ACUMULADA");
            rDiarioAFDiarios.INSERT;

        UNTIL rMigracionActivosFijos.NEXT = 0;

        MESSAGE('Terminó');
    END;


}

Table 90210 "TMP Movs para registrar"
{
    FIELDS
    {
        field(1; "Lin"; Integer) { }
        field(2; "Anno"; Integer) { }
        field(3; "Clave"; Text[30]) { }
        field(4; "CPTC"; Text[20]) { }
        field(5; "CORI"; Text[20]) { }
        field(6; "CLET"; Text[20]) { }
        field(7; "Batch"; Text[20]) { }
        field(8; "FechaDeRegistro"; Date) { }
        field(9; "TipoDeMovimiento"; Text[30]) { }
        field(10; "TipoDeDocumento"; Text[30]) { }
        field(11; "Codigo"; Text[20]) { }
        field(12; "Importe"; Decimal) { }
        field(13; "Divisa"; Text[20]) { }
        field(14; "FactorDivisa"; Decimal) { }
        field(15; "NumerodeDocumento"; Text[30]) { }
        field(16; "NumeroDtoProveedor"; Text[30]) { }
        field(17; "NombreDelDiario"; Text[30]) { }
        field(18; "NombreDeSeccion"; Text[30]) { }
        field(19; "CtaContrapartida"; Text[20]) { }
        field(20; "FechaVencimiento"; Date) { }
        field(21; "Dimension1"; Text[20]) { }
        field(22; "Dimension2"; Text[20]) { }
        field(23; "Dimension3"; Text[20]) { }
        field(24; "Dimension4"; Text[20]) { }
        field(25; "Dimension5"; Text[20]) { }
        field(101; "Error"; Boolean) { }
        field(102; "Descripción error"; Text[200]) { }
        field(201; "Asiento"; Integer) { }
        field(202; "Línea Asiento"; Integer) { }
        field(203; "Texto Asiento"; Text[10]) { }
        field(204; "Clave Única"; Text[30]) { }
    }
    KEYS
    {
        Key(PK; Lin) { Clustered = true; }
        Key(PK2; FechaDeRegistro, "Clave Única", "Línea Asiento") { }
    }

}

Table 90211 "TMP Pendientes separados"
{
    FIELDS
    {
        field(1; "Lin"; Integer) { }
        field(2; "Anno"; Integer) { }
        field(3; "Clave"; Text[30]) { }
        field(4; "CPTC"; Text[20]) { }
        field(5; "CORI"; Text[20]) { }
        field(6; "CLET"; Text[20]) { }
        field(7; "Batch"; Text[20]) { }
        field(8; "FechaDeRegistro"; Date) { }
        field(9; "TipoDeMovimiento"; Text[30]) { }
        field(10; "TipoDeDocumento"; Text[30]) { }
        field(11; "Codigo"; Text[20]) { }
        field(12; "Importe"; Decimal) { }
        field(13; "Divisa"; Text[20]) { }
        field(14; "FactorDivisa"; Decimal) { }
        field(15; "NumerodeDocumento"; Text[30]) { }
        field(16; "NumeroDtoProveedor"; Text[30]) { }
        field(17; "NombreDelDiario"; Text[30]) { }
        field(18; "NombreDeSeccion"; Text[30]) { }
        field(19; "CtaContrapartida"; Text[20]) { }
        field(20; "FechaVencimiento"; Date) { }
        field(21; "Dimension1"; Text[20]) { }
        field(22; "Dimension2"; Text[20]) { }
        field(23; "Dimension3"; Text[20]) { }
        field(24; "Dimension4"; Text[20]) { }
        field(25; "Dimension5"; Text[20]) { }
    }
    KEYS
    {
        Key(PK; Lin) { Clustered = true; }
    }

}

Table 90300 "TMP Movs liquidados"
{
    FIELDS
    {
        field(1; "Lin"; Integer) { }
        field(2; "Anno"; Integer) { }
        field(3; "Clave"; Text[30]) { }
        field(4; "CPTC"; Text[20]) { }
        field(5; "CORI"; Text[20]) { }
        field(6; "CLET"; Text[20]) { }
        field(7; "Batch"; Text[20]) { }
        field(8; "FechaDeRegistro"; Date) { }
        field(9; "TipoDeMovimiento"; Text[30]) { }
        field(10; "TipoDeDocumento"; Text[30]) { }
        field(11; "Codigo"; Text[20]) { }
        field(12; "Importe"; Decimal) { }
        field(13; "Divisa"; Text[20]) { }
        field(14; "FactorDivisa"; Decimal) { }
        field(15; "NumerodeDocumento"; Text[30]) { }
        field(16; "NumeroDtoProveedor"; Text[30]) { }
        field(17; "NombreDelDiario"; Text[30]) { }
        field(18; "NombreDeSeccion"; Text[30]) { }
        field(19; "CtaContrapartida"; Text[20]) { }
        field(20; "FechaVencimiento"; Date) { }
        field(21; "Dimension1"; Text[20]) { }
        field(22; "Dimension2"; Text[20]) { }
        field(23; "Dimension3"; Text[20]) { }
        field(24; "Dimension4"; Text[20]) { }
        field(25; "Dimension5"; Text[20]) { }
        field(101; "Error"; Boolean) { }
        field(102; "Descripción error"; Text[200]) { }
        field(201; "Asiento"; Integer) { }
        field(202; "Línea Asiento"; Integer) { }
        field(203; "Texto Asiento"; Text[10]) { }
        field(204; "Clave Única"; Text[30]) { }
    }
    KEYS
    {
        Key(PK; Lin) { Clustered = true; }
        Key(PK2; FechaDeRegistro, "Clave Única", "Línea Asiento") { }
    }

}

Table 90311 UBICACIONES
{
    FIELDS
    {
        field(1; "ALMACEN"; Code[10]) { }
        field(2; "UBICACION"; Code[10]) { }
        field(3; "DESCRIP"; Text[50]) { }
    }
    KEYS
    {
        Key(PK; ALMACEN) { Clustered = true; }
    }

}

Table 90312 "UBICACIONES SERVI"
{
    FIELDS
    {
        field(1; "LINEA"; Code[10]) { }
        field(2; "ALMACEN"; Text[30]) { }
        field(3; "UBICACION"; Text[30]) { }
        field(4; "DESCRI"; Text[30]) { }
    }
    KEYS
    {
        Key(PK; LINEA) { Clustered = true; }
    }
}

Table 90411 IMPORTACION_PRODUCTOS
{
    FIELDS
    {
        field(1; "LINEA"; Code[10]) { }
        field(2; "CODIGO"; Code[20]) { }
        field(3; "DESCRIPCION"; Text[100]) { }
        field(4; "PN"; Text[50]) { }
        field(5; "SN_BATCH"; Text[50]) { }
        field(6; "UBICACION"; Text[50]) { }
        field(7; "CANTIDAD"; Decimal) { }
        field(8; "COMENTARIOS"; Text[150]) { }
        field(9; "OPERADOR"; Text[50]) { }
        field(10; "EFF"; Text[50]) { }
        field(11; "CADUCIDAD"; Date) { }
        field(12; "RECIBIDO"; Date) { }
        field(13; "RECIBIDO POR"; Text[50]) { }
        field(14; "SALIDA"; Text[50]) { }
        field(15; "ALMACEN"; Text[20]) { }
    }
    KEYS
    {
        Key(PK; LINEA, SALIDA, SN_BATCH) { Clustered = true; }
    }

}

Table 90412 "PRODUCTOS IMPORTACION"
{
    FIELDS
    {
        field(1; "LINEA"; Code[10]) { }
        field(2; "CODIGO"; Text[50]) { }
        field(3; "DESCRIPCION"; Text[100]) { }
        field(4; "PN"; Text[50]) { }
        field(5; "SN_BATCH"; Text[50]) { }
        field(6; "UBICACION"; Text[50]) { }
        field(7; "CANTIDAD"; Decimal) { }
        field(8; "COMENTARIOS"; Text[250]) { }
        field(9; "OPERADOR"; Text[50]) { }
        field(10; "EFF"; Text[50]) { }
        field(11; "CADUCIDAD"; Date) { }
        field(12; "RECIBIDO"; Date) { }
        field(13; "RECIBIDO POR"; Text[50]) { }
        field(14; "SALIDA"; Text[50]) { }
        field(15; "ALMACEN"; Text[20]) { }
    }
    KEYS
    {
        key(Pk; LINEA) { Clustered = true; }
    }

}

