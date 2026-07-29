import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GroupActionsManifoldsCellComplexesCanonicalLaneLean

structure CellComplexPackage (M : Type u) [TopologicalSpace M] where
  cells : ℕ → Set M
  attachingMaps : ℕ → (Sⁿ → M)
  closureFinite : Prop
  weakTopology : Prop
  CWComplex : Prop

structure CellComplexEvidence (C : CellComplexPackage M) where
  closureFiniteClosed : C.closureFinite
  weakTopologyClosed : C.weakTopology
  CWComplexClosed : C.CWComplex

def CellComplexClosed (C : CellComplexPackage M) : Prop :=
  C.closureFinite ∧ C.weakTopology ∧ C.CWComplex

theorem cell_complex_closed_from_evidence (C : CellComplexPackage M) (E : CellComplexEvidence C) :
    CellComplexClosed C := by
  exact And.intro E.closureFiniteClosed (And.intro E.weakTopologyClosed E.CWComplexClosed)

end GroupActionsManifoldsCellComplexesCanonicalLaneLean
end HautevilleHouse