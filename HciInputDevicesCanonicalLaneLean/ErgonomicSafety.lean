import canonicalLaneMathlib.AdmissibleClass
import HciInputDevicesCanonicalLaneLean.DeviceTaxonomy

namespace HautevilleHouse
namespace HciInputDevicesCanonicalLaneLean

structure ErgonomicSafetyPackage (D : InputDevice) where
  wristSupport : Bool
  buttonActuationForce : Nat
  repeatedUseSafe : Prop
  adjustableAngles : Bool
  safetyCertificationObtained : Prop

structure ErgonomicSafetyEvidence {D : InputDevice} (E : ErgonomicSafetyPackage D) where
  wristSupportClosed : E.wristSupport = true
  safetyCertClosed : E.safetyCertificationObtained

def ErgonomicSafetyClosed {D : InputDevice} (E : ErgonomicSafetyPackage D) : Prop :=
  E.wristSupport ∧ E.safetyCertificationObtained

theorem ergonomic_safety_closed_from_evidence {D : InputDevice} (E : ErgonomicSafetyPackage D) (Ev : ErgonomicSafetyEvidence E) : ErgonomicSafetyClosed E := by
  exact And.intro Ev.wristSupportClosed Ev.safetyCertClosed

end HciInputDevicesCanonicalLaneLean
end HautevilleHouse