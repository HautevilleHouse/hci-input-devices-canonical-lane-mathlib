import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace HciInputDevicesCanonicalLaneLean

structure HciInputDeviceObject where
  deviceType : Type
  inputSignalModel : Prop
  interactionLayer : Prop
  conclusion : inputSignalModel ∧ interactionLayer

structure AdmittedHciInputDeviceObject where
  object : HciInputDeviceObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmittedHciInputDeviceObject) : Prop :=
  (A.object.conclusion) ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end HciInputDevicesCanonicalLaneLean
end HautevilleHouse