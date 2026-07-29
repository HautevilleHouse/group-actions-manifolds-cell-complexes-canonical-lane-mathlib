import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GroupActionsManifoldsCellComplexesCanonicalLaneLean.GroupActionsManifoldsCellComplexes

namespace HautevilleHouse
namespace GroupActionsManifoldsCellComplexesCanonicalLaneLean

structure CWComplexStructure (X : AdmittedObject) where
  skeleton : ℕ → Set X.carrier
  attachingMaps : ℕ → Type
  cellDecomposition : Prop
  closureFinite : Prop
  weakTopology : Prop
  cellDecompositionTerm : cellDecomposition
  closureFiniteTerm : closureFinite
  weakTopologyTerm : weakTopology

def CWComplexStructureClosed {X : AdmittedObject} (C : CWComplexStructure X) : Prop :=
  C.cellDecomposition ∧ C.closureFinite ∧ C.weakTopology

end GroupActionsManifoldsCellComplexesCanonicalLaneLean
end HautevilleHouse