import HautevilleHouse.HciInputDevicesCanonicalLaneLean.AdmissibleClass

/-!
# LatencyAnalysis Package
-/

namespace HautevilleHouse
namespace HciInputDevicesCanonicalLaneLean

structure LatencyBudgetProfile where
  averageLatencyMicros : ℕ
  maxLatencyMicros : ℕ
  jitterMicros : ℕ
  deadlineMissRatio : ℝ

structure LatencyAnalysisPackage where
  profile : LatencyBudgetProfile
  boundedUnderLoad : Prop
  preemptiveScheduling : Prop
  priorityInversionMitigated : Prop
  worstCaseAnalysisCertified : Prop

structure LatencyAnalysisEvidence (L : LatencyAnalysisPackage) where
  boundedUnderLoadClosed : L.boundedUnderLoad
  worstCaseAnalysisCertifiedClosed : L.worstCaseAnalysisCertified
  deadlineMet : L.profile.deadlineMissRatio ≤ 0.01

def LatencyAnalysisClosed (L : LatencyAnalysisPackage) : Prop :=
  L.boundedUnderLoad ∧ L.worstCaseAnalysisCertified ∧ L.profile.deadlineMissRatio ≤ 0.01

theorem latency_analysis_closed_from_evidence (L : LatencyAnalysisPackage) (E : LatencyAnalysisEvidence L) : LatencyAnalysisClosed L := by
  exact And.intro E.boundedUnderLoadClosed (And.intro E.worstCaseAnalysisCertifiedClosed E.deadlineMet)

end HciInputDevicesCanonicalLaneLean
end HautevilleHouse
