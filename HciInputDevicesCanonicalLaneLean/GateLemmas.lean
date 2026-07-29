import HciInputDevicesCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace HciInputDevicesCanonicalLaneLean

def gateClosed (A : AdmittedHciInputDeviceObject) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmittedHciInputDeviceObject) :
    gateClosed A := by
  exact A.gateWitness

end HciInputDevicesCanonicalLaneLean
end HautevilleHouse