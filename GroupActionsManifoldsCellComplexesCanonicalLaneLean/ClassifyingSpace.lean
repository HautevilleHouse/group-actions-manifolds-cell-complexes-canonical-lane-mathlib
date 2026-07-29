import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GroupActionsManifoldsCellComplexesCanonicalLaneLean

structure ClassifyingSpace where
  group : Type u
  groupTopology : TopologicalSpace group
  classifyingSpace : Type v
  classifyingTopology : TopologicalSpace classifyingSpace
  universalBundle : Type w
  universalTotalSpace : TopologicalSpace universalBundle
  projection : universalBundle → classifyingSpace
  contractibleTotalSpace : Prop
  freeGroupAction : Prop
  numerableLocalTriviality : Prop
  principalBundleClassification : Prop

structure ClassifyingSpaceEvidence (B : ClassifyingSpace) where
  contractibleTotalSpaceClosed : B.contractibleTotalSpace
  freeGroupActionClosed : B.freeGroupAction
  numerableLocalTrivialityClosed : B.numerableLocalTriviality
  principalBundleClassificationClosed : B.principalBundleClassification

def ClassifyingSpaceClosed (B : ClassifyingSpace) : Prop :=
  B.contractibleTotalSpace ∧ B.freeGroupAction ∧
  B.numerableLocalTriviality ∧ B.principalBundleClassification

theorem classifying_space_closed_from_evidence (B : ClassifyingSpace)
    (E : ClassifyingSpaceEvidence B) : ClassifyingSpaceClosed B := by
  exact And.intro E.contractibleTotalSpaceClosed
    (And.intro E.freeGroupActionClosed
      (And.intro E.numerableLocalTrivialityClosed E.principalBundleClassificationClosed))

end GroupActionsManifoldsCellComplexesCanonicalLaneLean
end HautevilleHouse
