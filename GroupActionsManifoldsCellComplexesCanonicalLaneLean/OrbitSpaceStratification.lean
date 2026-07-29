import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GroupActionsManifoldsCellComplexesCanonicalLaneLean

structure OrbitSpaceStratification where
  orbitSpace : Type u
  topology : TopologicalSpace orbitSpace
  strata : Set (Set orbitSpace)
  decomposition : Prop
  frontierCondition : Prop
  equisingularity : Prop

structure OrbitSpaceStratificationEvidence (O : OrbitSpaceStratification) where
  decompositionClosed : O.decomposition
  frontierConditionClosed : O.frontierCondition
  equisingularityClosed : O.equisingularity

def OrbitSpaceStratificationClosed (O : OrbitSpaceStratification) : Prop :=
  O.decomposition ∧ O.frontierCondition ∧ O.equisingularity

theorem orbit_space_stratification_closed_from_evidence (O : OrbitSpaceStratification) (E : OrbitSpaceStratificationEvidence O) :
    OrbitSpaceStratificationClosed O := by
  exact And.intro E.decompositionClosed (And.intro E.frontierConditionClosed E.equisingularityClosed)

end GroupActionsManifoldsCellComplexesCanonicalLaneLean
end HautevilleHouse