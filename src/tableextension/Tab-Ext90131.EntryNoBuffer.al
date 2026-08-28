/// <summary>
/// TableExtension EntryNoBuffer (ID 90131) extends Record Entry No. Amount Buffer.
/// </summary>
tableextension 90131 EntryNoBuffer extends "Entry No. Amount Buffer"
{
    fields
    {

        field(91500; "Document Type"; Option) { OptionMembers = ,Payment,Invoice,"Credit Memo","Finance Charge Memo",Reminder,Refund,,,,,,,,,,,,,,,Bill; }
        field(91501; "Document No."; Code[20]) { }
        field(91502; "Posting Date"; Date) { }
        field(91503; "Payment Method Code"; Code[20]) { }
        field(91504; "Medio"; Code[20]) { }
        field(91505; "VAT Registration No."; Text[20]) { }
    }
}
