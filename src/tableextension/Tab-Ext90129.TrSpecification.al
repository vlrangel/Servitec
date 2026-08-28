/// <summary>
/// TableExtension TrSpecification (ID 90129) extends Record Tracking Specification.
/// </summary>
tableextension 90129 TrSpecification extends "Tracking Specification"
{
    fields
    {
        field(91500; EFF; Code[10])
        {
            DataClassification = ToBeClassified;
        }
    }
}
tableextension 90130 ReservationEntry extends "Reservation Entry"
{
    fields
    {
        field(91500; EFF; Code[10])
        {
            DataClassification = ToBeClassified;
        }
    }
}
