import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GroupActionsManifoldsCellComplexesCanonicalLaneLean

structure EquivariantCellDecomposition where
  group : Type u
  groupTopology : TopologicalSpace group
  underlyingCW : CWComplex
  actionOnCells : group → underlyingCW.skeletonSequence 0 → underlyingCW.skeletonSequence 0
  cellPermutes : Prop
  equivariantAttaching : Prop
  orbitCellStructure : Prop

structure EquivariantCellDecompositionEvidence
    (D : EquivariantCellDecomposition) where
  cellPermutesClosed : D.cellPermutes
  equivariantAttachingClosed : D.equivariantAttaching
  orbitCellStructureClosed : D.orbitCellStructure

def EquivariantCellDecompositionClosed (D : EquivariantCellDecomposition) : Prop :=
  D.cellPermutes ∧ D.equivariantAttaching ∧ D.orbitCellStructure

theorem equivariant_cell_decomposition_closed_from_evidence
    (D : EquivariantCellDecomposition)
    (E : EquivariantCellDecompositionEvidence D) :
    EquivariantCellDecompositionClosed D := by
  exact And.intro E.cellPermutesClosed
    (And.intro E.equivariantAttachingClosed E.orbitCellStructureClosed)

end GroupActionsManifoldsCellComplexesCanonicalLaneLean
end HautevilleHouse
