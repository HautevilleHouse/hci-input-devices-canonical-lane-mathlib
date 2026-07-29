import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.HciInputDevicesCanonicalLaneLean.HciInputDevices

namespace HautevilleHouse
namespace HciInputDevicesCanonicalLaneLean

def ConstrainedHciInputDevicesClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_hci_input_devices_endgame (A : AdmissibleClass) :
    ConstrainedHciInputDevicesClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end HciInputDevicesCanonicalLaneLean
end HautevilleHouse
