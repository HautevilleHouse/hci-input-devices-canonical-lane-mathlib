import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.HciInputDevicesCanonicalLaneLean.InputDeviceClass

namespace HautevilleHouse
namespace HciInputDevicesCanonicalLaneLean

structure ElectrodeGeometry where
  contactArea : Float
  dielectricThickness : Float
  dielectricConstant : Float
  selfCapacitanceComputed : Prop
  mutualCapacitanceComputed : Prop

structure InputCapacitancePackage where
  electrode : ElectrodeGeometry
  buttonInductionModel : Prop
  noiseFloorEstimate : Float
  signalToNoiseRatio : Prop

structure CapacitanceEvidence (C : InputCapacitancePackage) where
  buttonInductionModelClosed : C.buttonInductionModel
  signalToNoiseRatioClosed : C.signalToNoiseRatio

def CapacitanceClosed (C : InputCapacitancePackage) : Prop :=
  C.buttonInductionModel ∧ C.signalToNoiseRatio

theorem capacitance_closed_from_evidence (C : InputCapacitancePackage)
    (E : CapacitanceEvidence C) : CapacitanceClosed C := by
  exact And.intro E.buttonInductionModelClosed E.signalToNoiseRatioClosed

end HciInputDevicesCanonicalLaneLean
end HautevilleHouse
