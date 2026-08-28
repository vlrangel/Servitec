/// <summary>
/// TableExtension PaymentMethod (ID 90125) extends Record Payment Method.
/// </summary>
tableextension 90125 PaymentMethod extends "Payment Method"
{
    fields
    {

        field(91500; "Num. cuenta banco en factura"; Text[30]) { }
        field(91501; "SWIFT."; Text[12]) { }
    }
}
