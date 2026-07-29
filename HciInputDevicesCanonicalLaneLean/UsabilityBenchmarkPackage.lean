import HciInputDevicesCanonicalLaneLean.InteractionLayerPackage

namespace HautevilleHouse
namespace HciInputDevicesCanonicalLaneLean

structure UsabilityBenchmarkPackage {P : InputSignalProcessingPackage} {I : InteractionLayerPackage P} where
  responseTime : Prop
  accuracy : Prop
  userSatisfaction : Prop
  learningCurve : Prop

def UsabilityBenchmarkClosed {P : InputSignalProcessingPackage} {I : InteractionLayerPackage P}
    (U : UsabilityBenchmarkPackage I) : Prop :=
  U.responseTime ∧ U.accuracy ∧ U.userSatisfaction ∧ U.learningCurve

structure UsabilityBenchmarkEvidence {P : InputSignalProcessingPackage} {I : InteractionLayerPackage P}
    (U : UsabilityBenchmarkPackage I) where
  responseTimeClosed : U.responseTime
  accuracyClosed : U.accuracy
  userSatisfactionClosed : U.userSatisfaction
  learningCurveClosed : U.learningCurve

theorem usability_benchmark_closed_from_evidence {P : InputSignalProcessingPackage}
    {I : InteractionLayerPackage P} (U : UsabilityBenchmarkPackage I)
    (E : UsabilityBenchmarkEvidence U) : UsabilityBenchmarkClosed U := by
  exact And.intro E.responseTimeClosed
    (And.intro E.accuracyClosed
      (And.intro E.userSatisfactionClosed E.learningCurveClosed))

end HciInputDevicesCanonicalLaneLean
end HautevilleHouse