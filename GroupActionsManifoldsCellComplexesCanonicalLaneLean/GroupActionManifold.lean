import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GroupActionsManifoldsCellComplexesCanonicalLaneLean

structure GroupActionManifold where
  manifold : Type u
  topology : TopologicalSpace manifold
  group : Type v
  groupOp : Group group
  action : group → manifold → manifold
  continuousAction : Prop
  smoothAction : Prop
  properAction : Prop

structure GroupActionManifoldEvidence (G : GroupActionManifold) where
  continuousActionClosed : G.continuousAction
  smoothActionClosed : G.smoothAction
  properActionClosed : G.properAction

def GroupActionManifoldClosed (G : GroupActionManifold) : Prop :=
  G.continuousAction ∧ G.smoothAction ∧ G.properAction

theorem group_action_manifold_closed_from_evidence (G : GroupActionManifold) (E : GroupActionManifoldEvidence G) :
    GroupActionManifoldClosed G := by
  exact And.intro E.continuousActionClosed (And.intro E.smoothActionClosed E.properActionClosed)

end GroupActionsManifoldsCellComplexesCanonicalLaneLean
end HautevilleHouse