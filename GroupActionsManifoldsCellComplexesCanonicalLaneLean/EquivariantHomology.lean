import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GroupActionsManifoldsCellComplexesCanonicalLaneLean.EquivariantCellComplex

namespace HautevilleHouse
namespace GroupActionsManifoldsCellComplexesCanonicalLaneLean

structure EquivariantHomology {G : GroupActionManifold} {O : OrbitSpaceStratification} (C : EquivariantCellComplex G O) where
  chainComplex : Type u
  homologyGroups : ℕ → Type v
  boundaryMaps : Prop
  exactness : Prop
  equivariantStructure : Prop

structure EquivariantHomologyEvidence {G : GroupActionManifold} {O : OrbitSpaceStratification} {C : EquivariantCellComplex G O} (H : EquivariantHomology C) where
  boundaryMapsClosed : H.boundaryMaps
  exactnessClosed : H.exactness
  equivariantStructureClosed : H.equivariantStructure

def EquivariantHomologyClosed {G : GroupActionManifold} {O : OrbitSpaceStratification} {C : EquivariantCellComplex G O} (H : EquivariantHomology C) : Prop :=
  H.boundaryMaps ∧ H.exactness ∧ H.equivariantStructure

theorem equivariant_homology_closed_from_evidence {G : GroupActionManifold} {O : OrbitSpaceStratification} {C : EquivariantCellComplex G O} (H : EquivariantHomology C) (E : EquivariantHomologyEvidence H) :
    EquivariantHomologyClosed H := by
  exact And.intro E.boundaryMapsClosed (And.intro E.exactnessClosed E.equivariantStructureClosed)

end GroupActionsManifoldsCellComplexesCanonicalLaneLean
end HautevilleHouse