import HautevilleHouse.HciInputDevicesCanonicalLaneLean.AdmissibleClass

/-!
# ElectromechanicalRobustness Package
-/

namespace HautevilleHouse
namespace HciInputDevicesCanonicalLaneLean

structure ElectromechanicalRobustnessPackage where
  environmentalSealing : Prop
  shockResistanceG : ℕ
  vibrationToleranceHz : ℕ
  expectedLifetimeCycles : ℕ
  meanTimeBetweenFailuresHours : ℕ
  tamperResistance : Prop

structure ElectromechanicalRobustnessEvidence (E : ElectromechanicalRobustnessPackage) where
  environmentalSealingClosed : E.environmentalSealing
  tamperResistanceClosed : E.tamperResistance
  mtbfSufficient : E.meanTimeBetweenFailuresHours ≥ 100000

def ElectromechanicalRobustnessClosed (E : ElectromechanicalRobustnessPackage) : Prop :=
  E.environmentalSealing ∧ E.tamperResistance ∧ E.meanTimeBetweenFailuresHours ≥ 100000

theorem electromechanical_robustness_closed_from_evidence (E : ElectromechanicalRobustnessPackage) (Ev : ElectromechanicalRobustnessEvidence E) : ElectromechanicalRobustnessClosed E := by
  exact And.intro Ev.environmentalSealingClosed (And.intro Ev.tamperResistanceClosed Ev.mtbfSufficient)

end HciInputDevicesCanonicalLaneLean
end HautevilleHouse
