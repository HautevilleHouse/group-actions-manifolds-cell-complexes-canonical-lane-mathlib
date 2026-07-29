import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GroupActionsManifoldsCellComplexesCanonicalLaneLean

structure FixedPointStratum where
  stratumType : Type u
  stratumTopology : TopologicalSpace stratumType
  groupAction : G → stratumType → stratumType
  isFixed : ∀ (g : G) (x : stratumType), groupAction g x = x
  manifoldStructure : Manifold stratumType
  cellDecomposition : List (ℕ × Set stratumType)

def FixedPointStratumClosed (S : FixedPointStratum) : Prop :=
  S.isFixed ∧ S.manifoldStructure

theorem fixed_point_stratum_closed (S : FixedPointStratum) : FixedPointStratumClosed S :=
  And.intro S.isFixed S.manifoldStructure

structure Stratification where
  ambientSpace : Type v
  ambientTopology : TopologicalSpace ambientSpace
  action : G → ambientSpace → ambientSpace
  strata : List FixedPointStratum
  coveringProperty : ∀ (x : ambientSpace), ∃ (S : strata), x ∈ S.stratumType
  closureCondition : ∀ (S : strata), closure (S.stratumType) ⊆ ⋃ (T : strata), T.stratumType

def StratificationClosed (Str : Stratification) : Prop :=
  (∀ (S : Str.strata), FixedPointStratumClosed S) ∧ Str.coveringProperty

theorem stratification_closed (Str : Stratification) : StratificationClosed Str := by
  refine And.intro (λ S => fixed_point_stratum_closed S) Str.coveringProperty

end GroupActionsManifoldsCellComplexesCanonicalLaneLean
end HautevilleHouse
