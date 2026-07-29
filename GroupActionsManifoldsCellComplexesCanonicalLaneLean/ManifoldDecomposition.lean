import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GroupActionsManifoldsCellComplexesCanonicalLaneLean

structure ManifoldDecompositionPackage (M : Type u) [TopologicalSpace M] [Manifold M] where
  cellComplex : Type v
  cellComplexStructure : CellComplexStructure cellComplex
  characteristicMap : cellComplex → M → Prop
  closureFinite : Prop
  weakTopology : Prop
  boundaryIdentification : Prop
  decompositionContinuous : Continuous (Function.uncurry characteristicMap)

structure ManifoldDecompositionEvidence {M : Type u} [TopologicalSpace M] [Manifold M]
  (D : ManifoldDecompositionPackage M) where
  closureFiniteClosed : D.closureFinite
  weakTopologyClosed : D.weakTopology
  boundaryIdentificationClosed : D.boundaryIdentification
  decompositionContinuousClosed : D.decompositionContinuous

def ManifoldDecompositionClosed {M : Type u} [TopologicalSpace M] [Manifold M]
  (D : ManifoldDecompositionPackage M) : Prop :=
  D.closureFinite ∧ D.weakTopology ∧ D.boundaryIdentification ∧ D.decompositionContinuous

theorem manifold_decomposition_closed_from_evidence {M : Type u} [TopologicalSpace M] [Manifold M]
  (D : ManifoldDecompositionPackage M) (E : ManifoldDecompositionEvidence D) :
  ManifoldDecompositionClosed D := by
  exact And.intro E.closureFiniteClosed
    (And.intro E.weakTopologyClosed
      (And.intro E.boundaryIdentificationClosed E.decompositionContinuousClosed))

end GroupActionsManifoldsCellComplexesCanonicalLaneLean
end HautevilleHouse
