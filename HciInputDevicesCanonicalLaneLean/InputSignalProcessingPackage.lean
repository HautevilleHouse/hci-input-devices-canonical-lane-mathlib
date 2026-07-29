import HciInputDevicesCanonicalLaneLean.HciInputDeviceAdmissibleClass

namespace HautevilleHouse
namespace HciInputDevicesCanonicalLaneLean

structure InputSignalProcessingPackage where
  signalAcquisition : Prop
  noiseFiltering : Prop
  featureExtraction : Prop
  gestureRecognition : Prop

def InputSignalProcessingClosed (P : InputSignalProcessingPackage) : Prop :=
  P.signalAcquisition ∧ P.noiseFiltering ∧ P.featureExtraction ∧ P.gestureRecognition

structure InputSignalProcessingEvidence (P : InputSignalProcessingPackage) where
  signalAcquisitionClosed : P.signalAcquisition
  noiseFilteringClosed : P.noiseFiltering
  featureExtractionClosed : P.featureExtraction
  gestureRecognitionClosed : P.gestureRecognition

theorem input_signal_processing_closed_from_evidence (P : InputSignalProcessingPackage)
    (E : InputSignalProcessingEvidence P) : InputSignalProcessingClosed P := by
  exact And.intro E.signalAcquisitionClosed
    (And.intro E.noiseFilteringClosed
      (And.intro E.featureExtractionClosed E.gestureRecognitionClosed))

end HciInputDevicesCanonicalLaneLean
end HautevilleHouse