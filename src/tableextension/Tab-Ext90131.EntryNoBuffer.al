/// <summary>
/// TableExtension EntryNoBuffer (ID 90131) extends Record Entry No. Amount Buffer.
/// </summary>
tableextension 90131 EntryNoBuffer extends "Entry No. Amount Buffer"
{
    fields
    {

        field(90000; "Document Type"; Option) { OptionMembers = ,Payment,Invoice,"Credit Memo","Finance Charge Memo",Reminder,Refund,,,,,,,,,,,,,,,Bill; }
        field(90001; "Document No."; Code[20]) { }
        field(90002; "Posting Date"; Date) { }
        field(90003; "Payment Method Code"; Code[20]) { }
        field(90004; "Medio"; Code[20]) { }
        field(90005; "VAT Registration No."; Text[20]) { }
    }
}
