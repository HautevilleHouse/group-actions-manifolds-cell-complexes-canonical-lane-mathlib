import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GroupActionsManifoldsCellComplexesCanonicalLaneLean.GroupActionManifold
import HautevilleHouse.GroupActionsManifoldsCellComplexesCanonicalLaneLean.OrbitSpaceStratification

namespace HautevilleHouse
namespace GroupActionsManifoldsCellComplexesCanonicalLaneLean

structure EquivariantCellComplex (G : GroupActionManifold) (O : OrbitSpaceStratification) where
  cells : Set (Set G.manifold)
  attachingMaps : Prop
  equivariance : Prop
  cellDecomposition : Prop
  closureFinite : Prop
  weakTopology : Prop

structure EquivariantCellComplexEvidence {G : GroupActionManifold} {O : OrbitSpaceStratification} (C : EquivariantCellComplex G O) where
  attachingMapsClosed : C.attachingMaps
  equivarianceClosed : C.equivariance
  cellDecompositionClosed : C.cellDecomposition
  closureFiniteClosed : C.closureFinite
  weakTopologyClosed : C.weakTopology

def EquivariantCellComplexClosed {G : GroupActionManifold} {O : OrbitSpaceStratification} (C : EquivariantCellComplex G O) : Prop :=
  C.attachingMaps ∧ C.equivariance ∧ C.cellDecomposition ∧ C.closureFinite ∧ C.weakTopology

theorem equivariant_cell_complex_closed_from_evidence {G : GroupActionManifold} {O : OrbitSpaceStratification} (C : EquivariantCellComplex G O) (E : EquivariantCellComplexEvidence C) :
    EquivariantCellComplexClosed C := by
  exact And.intro E.attachingMapsClosed (And.intro E.equivarianceClosed (And.intro E.cellDecompositionClosed (And.intro E.closureFiniteClosed E.weakTopologyClosed)))

end GroupActionsManifoldsCellComplexesCanonicalLaneLean
end HautevilleHouse