import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GroupActionsManifoldsCellComplexesCanonicalLaneLean

structure CWComplex where
  skeletonSequence : ℕ → Type u
  attachingMaps : ℕ → Type v
  topology : TopologicalSpace (⋃ n, skeletonSequence n)
  closureFinite : Prop
  weakTopology : Prop
  dimension : ℕ

structure CWComplexEvidence (X : CWComplex) where
  closureFiniteClosed : X.closureFinite
  weakTopologyClosed : X.weakTopology

def CWComplexClosed (X : CWComplex) : Prop :=
  X.closureFinite ∧ X.weakTopology

theorem cw_complex_closed_from_evidence (X : CWComplex)
    (E : CWComplexEvidence X) : CWComplexClosed X := by
  exact And.intro E.closureFiniteClosed E.weakTopologyClosed

end GroupActionsManifoldsCellComplexesCanonicalLaneLean
end HautevilleHouse
