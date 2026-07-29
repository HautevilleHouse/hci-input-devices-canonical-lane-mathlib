import HautevilleHouse.HciInputDevicesCanonicalLaneLean.AdmissibleClass

/-!
# ProtocolCertification Package
-/

namespace HautevilleHouse
namespace HciInputDevicesCanonicalLaneLean

structure ProtocolCertificationPackage where
  protocolStandard : String
  certificationAuthority : String
  testSuitePassed : Prop
  complianceLevel : Nat
  interoperabilityTested : Prop
  hysteresisMargin : ℝ

structure ProtocolCertificationEvidence (P : ProtocolCertificationPackage) where
  testSuitePassedClosed : P.testSuitePassed
  interoperabilityTestedClosed : P.interoperabilityTested
  hysteresisMarginPositive : P.hysteresisMargin > 0

def ProtocolCertificationClosed (P : ProtocolCertificationPackage) : Prop :=
  P.testSuitePassed ∧ P.interoperabilityTested ∧ P.hysteresisMargin > 0

theorem protocol_certification_closed_from_evidence (P : ProtocolCertificationPackage) (E : ProtocolCertificationEvidence P) : ProtocolCertificationClosed P := by
  exact And.intro E.testSuitePassedClosed (And.intro E.interoperabilityTestedClosed E.hysteresisMarginPositive)

end HciInputDevicesCanonicalLaneLean
end HautevilleHouse
