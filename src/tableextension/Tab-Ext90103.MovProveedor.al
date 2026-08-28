/// <summary>
/// TableExtension MovProveedor (ID 90103) extends Record Vendor Ledger Entry.
/// </summary>
tableextension 90103 MovProveedor extends "Vendor Ledger Entry"
{
    fields
    {
        field(91507; "Cód. Medio pago"; Code[20]) { }
        field(91500; "CSV AEAT"; Text[100]) { }
        field(91501; "Código error AEAT"; Text[30]) { }
        field(91502; "Descripción error AEAT"; Text[250]) { }
        field(91503; "Estado AEAT"; Text[30]) { }
        field(91504; "Fecha envío AEAT"; Date) { }
        field(91505; "Hora envío AEAT"; Time) { }
        field(91506; "Estado cuadre AEAT"; Text[30]) { }
    }
}
