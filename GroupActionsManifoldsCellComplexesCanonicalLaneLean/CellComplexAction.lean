import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GroupActionsManifoldsCellComplexesCanonicalLaneLean

structure CellComplexActionPackage {M : Type u} [TopologicalSpace M] [Manifold M]
  (G : GroupActionPackage M) (D : ManifoldDecompositionPackage M) where
  groupActionPreservesDecomposition : Prop
  cellPermutation : G.group → D.cellComplex → D.cellComplex
  permutationCompatible : Prop
  inducedActionOnCells : Prop
  orbitStructureWellDefined : Prop
  actionOnBoundaryCompatible : Prop

structure CellComplexActionEvidence {M : Type u} [TopologicalSpace M] [Manifold M]
  {G : GroupActionPackage M} {D : ManifoldDecompositionPackage M}
  (C : CellComplexActionPackage G D) where
  groupActionPreservesDecompositionClosed : C.groupActionPreservesDecomposition
  permutationCompatibleClosed : C.permutationCompatible
  inducedActionOnCellsClosed : C.inducedActionOnCells
  orbitStructureWellDefinedClosed : C.orbitStructureWellDefined
  actionOnBoundaryCompatibleClosed : C.actionOnBoundaryCompatible

def CellComplexActionClosed {M : Type u} [TopologicalSpace M] [Manifold M]
  {G : GroupActionPackage M} {D : ManifoldDecompositionPackage M}
  (C : CellComplexActionPackage G D) : Prop :=
  C.groupActionPreservesDecomposition ∧ C.permutationCompatible ∧
  C.inducedActionOnCells ∧ C.orbitStructureWellDefined ∧ C.actionOnBoundaryCompatible

theorem cell_complex_action_closed_from_evidence {M : Type u} [TopologicalSpace M] [Manifold M]
  {G : GroupActionPackage M} {D : ManifoldDecompositionPackage M}
  (C : CellComplexActionPackage G D) (E : CellComplexActionEvidence C) :
  CellComplexActionClosed C := by
  exact And.intro E.groupActionPreservesDecompositionClosed
    (And.intro E.permutationCompatibleClosed
      (And.intro E.inducedActionOnCellsClosed
        (And.intro E.orbitStructureWellDefinedClosed E.actionOnBoundaryCompatibleClosed)))

end GroupActionsManifoldsCellComplexesCanonicalLaneLean
end HautevilleHouse
