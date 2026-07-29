import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace HciInputDevicesCanonicalLaneLean

structure AdmittedInputObject where
  deviceType : String
  inputCategory : String
  protocolCertified : Prop
  bitrateStable : Prop
  latencyBounded : Prop
  electroMechanicalTestPassed : Prop
  protocolCertifiedTerm : protocolCertified
  bitrateStableTerm : bitrateStable
  latencyBoundedTerm : latencyBounded
  electroMechanicalTestPassedTerm : electroMechanicalTestPassed

structure AdmittedObject where
  object : AdmittedInputObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmittedObject) : Prop :=
  (A.object.protocolCertified ∧ A.object.bitrateStable ∧ A.object.latencyBounded ∧ A.object.electroMechanicalTestPassed) ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end HciInputDevicesCanonicalLaneLean
end HautevilleHouse
