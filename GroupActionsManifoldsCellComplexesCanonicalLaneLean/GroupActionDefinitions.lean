import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GroupActionsManifoldsCellComplexesCanonicalLaneLean

structure GroupActionPackage (M : Type u) [TopologicalSpace M] where
  group : Type v
  groupTopology : TopologicalSpace group
  topologicalGroup : TopologicalGroup group
  action : group → M → M
  continuousAction : Continuous (Function.uncurry action)
  faithfulAction : Prop
  transitiveAction : Prop
  properlyDiscontinuousAction : Prop

structure GroupActionEvidence {M : Type u} [TopologicalSpace M] (G : GroupActionPackage M) where
  faithfulActionClosed : G.faithfulAction
  transitiveActionClosed : G.transitiveAction
  properlyDiscontinuousActionClosed : G.properlyDiscontinuousAction

def GroupActionClosed {M : Type u} [TopologicalSpace M] (G : GroupActionPackage M) : Prop :=
  G.faithfulAction ∧ G.transitiveAction ∧ G.properlyDiscontinuousAction

theorem group_action_closed_from_evidence {M : Type u} [TopologicalSpace M] (G : GroupActionPackage M)
    (E : GroupActionEvidence G) : GroupActionClosed G := by
  exact And.intro E.faithfulActionClosed (And.intro E.transitiveActionClosed E.properlyDiscontinuousActionClosed)

end GroupActionsManifoldsCellComplexesCanonicalLaneLean
end HautevilleHouse