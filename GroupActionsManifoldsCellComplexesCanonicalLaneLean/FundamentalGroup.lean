import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GroupActionsManifoldsCellComplexesCanonicalLaneLean

structure FundamentalGroupPackage (M : Type u) [TopologicalSpace M] where
  basepoint : M
  loops : Type v
  groupStructure : Group loops
  groupTopology : TopologicalSpace loops
  continuousGroup : TopologicalGroup loops
  pathConnected : Prop
  simpleConnected : Prop

structure FundamentalGroupEvidence {M : Type u} [TopologicalSpace M] (F : FundamentalGroupPackage M) where
  pathConnectedClosed : F.pathConnected
  simpleConnectedClosed : F.simpleConnected
  groupStructureClosed : Group F.loops

def FundamentalGroupClosed {M : Type u} [TopologicalSpace M] (F : FundamentalGroupPackage M) : Prop :=
  F.pathConnected ∧ F.simpleConnected

theorem fundamental_group_closed_from_evidence {M : Type u} [TopologicalSpace M] (F : FundamentalGroupPackage M)
    (E : FundamentalGroupEvidence F) : FundamentalGroupClosed F := by
  exact And.intro E.pathConnectedClosed E.simpleConnectedClosed

end GroupActionsManifoldsCellComplexesCanonicalLaneLean
end HautevilleHouse