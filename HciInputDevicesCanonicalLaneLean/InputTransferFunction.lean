import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.HciInputDevicesCanonicalLaneLean.InputCapacitanceAnalysis

namespace HautevilleHouse
namespace HciInputDevicesCanonicalLaneLean

structure TransferFunction where
  impulseResponse : Type
  frequencyResponse : Type
  riseTime : Float
  bandwidth : Float
  monotonicStep : Prop
  linearPhaseRegion : Prop

structure TransferFunctionPackage {C : InputCapacitancePackage}
    (CapPkg : CapacitanceEvidence C) where
  transferFunction : TransferFunction
  stepResponseMonotonic : Prop
  bandwidthSufficient : Prop

structure TransferFunctionEvidence {C : InputCapacitancePackage}
    {CapPkg : CapacitanceEvidence C}
    (T : TransferFunctionPackage CapPkg) where
  stepResponseMonotonicClosed : T.stepResponseMonotonic
  bandwidthSufficientClosed : T.bandwidthSufficient

def TransferFunctionClosed {C : InputCapacitancePackage}
    {CapPkg : CapacitanceEvidence C}
    (T : TransferFunctionPackage CapPkg) : Prop :=
  T.stepResponseMonotonic ∧ T.bandwidthSufficient

theorem transfer_function_closed_from_evidence {C : InputCapacitancePackage}
    {CapPkg : CapacitanceEvidence C}
    (T : TransferFunctionPackage CapPkg)
    (E : TransferFunctionEvidence T) : TransferFunctionClosed T := by
  exact And.intro E.stepResponseMonotonicClosed E.bandwidthSufficientClosed

end HciInputDevicesCanonicalLaneLean
end HautevilleHouse
