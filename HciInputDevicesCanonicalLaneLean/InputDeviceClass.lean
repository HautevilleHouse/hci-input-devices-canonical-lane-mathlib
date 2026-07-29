import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace HciInputDevicesCanonicalLaneLean

structure InputDevice where
  deviceCarrier : Type
  eventStream : Type
  physicalInputBound : Prop
  digitalEncoding : Prop
  humanFeedbackLoop : Prop

def HciInputDeviceClosed (D : InputDevice) : Prop :=
  D.physicalInputBound ∧ D.digitalEncoding ∧ D.humanFeedbackLoop

structure HciAdmittedObject where
  device : InputDevice
  deviceClosed : HciInputDeviceClosed device

end HciInputDevicesCanonicalLaneLean
end HautevilleHouse
