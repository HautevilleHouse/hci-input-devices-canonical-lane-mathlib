import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace HciInputDevicesCanonicalLaneLean

structure InputDevicePacket where
  sourceDevice : String
  data : String
  timestamp : Nat
  checksum : Prop

def defaultPacket : InputDevicePacket := {
  sourceDevice := "default",
  data := "",
  timestamp := 0,
  checksum := True
}

structure InputDevicePacketEvidence (p : InputDevicePacket) where
  sourceDeviceValid : p.sourceDevice ≠ ""
  dataNonEmpty : p.data ≠ ""
  checksumValid : p.checksum
  timestampCurrent : p.timestamp ≤ 1000

def InputDevicePacketClosed (p : InputDevicePacket) : Prop :=
  p.sourceDevice ≠ "" ∧ p.data ≠ "" ∧ p.checksum ∧ p.timestamp ≤ 1000

theorem input_device_packet_closed_from_evidence (p : InputDevicePacket)
    (e : InputDevicePacketEvidence p) : InputDevicePacketClosed p := by
  exact And.intro e.sourceDeviceValid (And.intro e.dataNonEmpty (And.intro e.checksumValid e.timestampCurrent))

end HciInputDevicesCanonicalLaneLean
end HautevilleHouse