import HautevilleHouse.HciInputDevicesCanonicalLaneLean.AdmissibleClass

/-!
# UsabilityErgonomics Package
-/

namespace HautevilleHouse
namespace HciInputDevicesCanonicalLaneLean

structure AnthropometricCompliance where
  handSizePercentileLow : ℕ
  handSizePercentileHigh : ℕ
  forceActuationRangeNewtons : ℝ × ℝ
  keyTravelRangeMm : ℝ × ℝ

structure UsabilityErgonomicsPackage where
  anthropometric : AnthropometricCompliance
  userSatisfactionScore : ℝ
  fatigueReductionIndex : ℝ
  accessibilityCertified : Prop
  blindAccessible : Prop
  feedbackMultiModal : Prop

structure UsabilityErgonomicsEvidence (U : UsabilityErgonomicsPackage) where
  accessibilityCertifiedClosed : U.accessibilityCertified
  blindAccessibleClosed : U.blindAccessible
  satisfactionAboveThreshold : U.userSatisfactionScore ≥ 4.0

def UsabilityErgonomicsClosed (U : UsabilityErgonomicsPackage) : Prop :=
  U.accessibilityCertified ∧ U.blindAccessible ∧ U.userSatisfactionScore ≥ 4.0

theorem usability_ergonomics_closed_from_evidence (U : UsabilityErgonomicsPackage) (E : UsabilityErgonomicsEvidence U) : UsabilityErgonomicsClosed U := by
  exact And.intro E.accessibilityCertifiedClosed (And.intro E.blindAccessibleClosed E.satisfactionAboveThreshold)

end HciInputDevicesCanonicalLaneLean
end HautevilleHouse
