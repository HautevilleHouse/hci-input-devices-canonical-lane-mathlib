import canonicalLaneMathlib.AdmissibleClass
import HciInputDevicesCanonicalLaneLean.DeviceTaxonomy

namespace HautevilleHouse
namespace HciInputDevicesCanonicalLaneLean

structure InputLatencyModelPackage (D : InputDevice) where
  hardwareLatency : Nat
  softwareLatency : Nat
  transportLatency : Nat
  totalLatency : Nat
  latencyConstraint : totalLatency ≤ 100

structure InputLatencyModelEvidence {D : InputDevice} (L : InputLatencyModelPackage D) where
  hardwareLatencyClosed : L.hardwareLatency ≤ 10
  softwareLatencyClosed : L.softwareLatency ≤ 50
  transportLatencyClosed : L.transportLatency ≤ 40
  totalLatencyClosed : L.latencyConstraint

def InputLatencyModelClosed {D : InputDevice} (L : InputLatencyModelPackage D) : Prop :=
  L.hardwareLatency ≤ 10 ∧ L.softwareLatency ≤ 50 ∧ L.transportLatency ≤ 40 ∧ L.latencyConstraint

theorem input_latency_model_closed_from_evidence {D : InputDevice} (L : InputLatencyModelPackage D) (E : InputLatencyModelEvidence L) : InputLatencyModelClosed L := by
  exact And.intro E.hardwareLatencyClosed (And.intro E.softwareLatencyClosed (And.intro E.transportLatencyClosed E.totalLatencyClosed))

end HciInputDevicesCanonicalLaneLean
end HautevilleHouse