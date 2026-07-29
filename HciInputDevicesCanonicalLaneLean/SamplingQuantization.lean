import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.HciInputDevicesCanonicalLaneLean.InputTransferFunction

namespace HautevilleHouse
namespace HciInputDevicesCanonicalLaneLean

structure SamplingParameters where
  sampleRate : Float
  adcResolution : Nat
  quantizerModel : Type
  antiAliasFilter : Prop
  nyquistCondition : Prop
  quantizationNoiseModel : Prop

structure SamplingQuantizationPackage {C : InputCapacitancePackage}
    {CapPkg : CapacitanceEvidence C}
    {T : TransferFunctionPackage CapPkg}
    (TE : TransferFunctionEvidence T) where
  samplingParams : SamplingParameters
  antiAliasActive : Prop
  noiseBudgetMet : Prop

structure SamplingEvidence {C : InputCapacitancePackage}
    {CapPkg : CapacitanceEvidence C}
    {T : TransferFunctionPackage CapPkg}
    {TE : TransferFunctionEvidence T}
    (S : SamplingQuantizationPackage TE) where
  antiAliasActiveClosed : S.antiAliasActive
  noiseBudgetMetClosed : S.noiseBudgetMet

def SamplingClosed {C : InputCapacitancePackage}
    {CapPkg : CapacitanceEvidence C}
    {T : TransferFunctionPackage CapPkg}
    {TE : TransferFunctionEvidence T}
    (S : SamplingQuantizationPackage TE) : Prop :=
  S.antiAliasActive ∧ S.noiseBudgetMet

theorem sampling_closed_from_evidence {C : InputCapacitancePackage}
    {CapPkg : CapacitanceEvidence C}
    {T : TransferFunctionPackage CapPkg}
    {TE : TransferFunctionEvidence T}
    (S : SamplingQuantizationPackage TE) (E : SamplingEvidence S) :
    SamplingClosed S := by
  exact And.intro E.antiAliasActiveClosed E.noiseBudgetMetClosed

end HciInputDevicesCanonicalLaneLean
end HautevilleHouse
