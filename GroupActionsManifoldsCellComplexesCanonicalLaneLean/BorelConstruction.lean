import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GroupActionsManifoldsCellComplexesCanonicalLaneLean.EquivariantCohomology

namespace HautevilleHouse
namespace GroupActionsManifoldsCellComplexesCanonicalLaneLean

structure BorelConstruction (G : GroupActionManifold) where
  classifyingSpace : Type u
  universalBundle : Type v
  homotopyQuotient : Type w
  fibration : Prop
  homotopyEquiv : Prop
  cohomologyIso : Prop

structure BorelConstructionEvidence (B : BorelConstruction G) where
  fibrationClosed : B.fibration
  homotopyEquivClosed : B.homotopyEquiv
  cohomologyIsoClosed : B.cohomologyIso

def BorelConstructionClosed (B : BorelConstruction G) : Prop :=
  B.fibration ∧ B.homotopyEquiv ∧ B.cohomologyIso

theorem borel_construction_closed_from_evidence (B : BorelConstruction G) (E : BorelConstructionEvidence B) :
    BorelConstructionClosed B := by
  exact And.intro E.fibrationClosed (And.intro E.homotopyEquivClosed E.cohomologyIsoClosed)

end GroupActionsManifoldsCellComplexesCanonicalLaneLean
end HautevilleHouse