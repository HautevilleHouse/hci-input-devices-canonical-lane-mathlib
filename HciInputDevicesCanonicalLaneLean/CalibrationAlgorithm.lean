import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.HciInputDevicesCanonicalLaneLean.SamplingQuantization

namespace HautevilleHouse
namespace HciInputDevicesCanonicalLaneLean

structure CalibrationModel where
  baselineOffset : Float
  sensitivityCoeff : Float
  nonlinearCorrection : Type
  temperatureDriftModel : Prop
  ageDegradationModel : Prop

structure CalibrationAlgorithmPackage {C : InputCapacitancePackage}
    {CapPkg : CapacitanceEvidence C}
    {T : TransferFunctionPackage CapPkg}
    {TE : TransferFunctionEvidence T}
    {S : SamplingQuantizationPackage TE}
    (SE : SamplingEvidence S) where
  calibration : CalibrationModel
  initialCalibrationPerformed : Prop
  adaptiveTrackingEnabled : Prop

structure CalibrationEvidence {C : InputCapacitancePackage}
    {CapPkg : CapacitanceEvidence C}
    {T : TransferFunctionPackage CapPkg}
    {TE : TransferFunctionEvidence T}
    {S : SamplingQuantizationPackage TE}
    {SE : SamplingEvidence S}
    (A : CalibrationAlgorithmPackage SE) where
  initialCalibrationPerformedClosed : A.initialCalibrationPerformed
  adaptiveTrackingEnabledClosed : A.adaptiveTrackingEnabled

def CalibrationClosed {C : InputCapacitancePackage}
    {CapPkg : CapacitanceEvidence C}
    {T : TransferFunctionPackage CapPkg}
    {TE : TransferFunctionEvidence T}
    {S : SamplingQuantizationPackage TE}
    {SE : SamplingEvidence S}
    (A : CalibrationAlgorithmPackage SE) : Prop :=
  A.initialCalibrationPerformed ∧ A.adaptiveTrackingEnabled

theorem calibration_closed_from_evidence {C : InputCapacitancePackage}
    {CapPkg : CapacitanceEvidence C}
    {T : TransferFunctionPackage CapPkg}
    {TE : TransferFunctionEvidence T}
    {S : SamplingQuantizationPackage TE}
    {SE : SamplingEvidence S}
    (A : CalibrationAlgorithmPackage SE) (E : CalibrationEvidence A) :
    CalibrationClosed A := by
  exact And.intro E.initialCalibrationPerformedClosed E.adaptiveTrackingEnabledClosed

end HciInputDevicesCanonicalLaneLean
end HautevilleHouse
