import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace HciInputDevicesCanonicalLaneLean

structure SignalProcessingPackage where
  filterType : String
  cutoffFreq : Nat
  samplingRate : Nat
  processingLatency : Prop

structure SignalProcessingEvidence (S : SignalProcessingPackage) where
  filterApplied : S.filterType ≠ ""
  cutoffValid : S.cutoffFreq > 0
  samplingValid : S.samplingRate > 0
  latencyAcceptable : S.processingLatency

def SignalProcessingClosed (S : SignalProcessingPackage) : Prop :=
  S.filterType ≠ "" ∧ S.cutoffFreq > 0 ∧ S.samplingRate > 0 ∧ S.processingLatency

theorem signal_processing_closed_from_evidence (S : SignalProcessingPackage)
    (e : SignalProcessingEvidence S) : SignalProcessingClosed S := by
  exact And.intro e.filterApplied (And.intro e.cutoffValid (And.intro e.samplingValid e.latencyAcceptable))

end HciInputDevicesCanonicalLaneLean
end HautevilleHouse