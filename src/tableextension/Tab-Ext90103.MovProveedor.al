/// <summary>
/// TableExtension MovProveedor (ID 90103) extends Record Vendor Ledger Entry.
/// </summary>
tableextension 90103 MovProveedor extends "Vendor Ledger Entry"
{
    fields
    {
        field(90007; "Cód. Medio pago"; Code[20]) { }
        field(90000; "CSV AEAT"; Text[100]) { }
        field(90001; "Código error AEAT"; Text[30]) { }
        field(90002; "Descripción error AEAT"; Text[250]) { }
        field(90003; "Estado AEAT"; Text[30]) { }
        field(90004; "Fecha envío AEAT"; Date) { }
        field(90005; "Hora envío AEAT"; Time) { }
        field(90006; "Estado cuadre AEAT"; Text[30]) { }
    }
}
