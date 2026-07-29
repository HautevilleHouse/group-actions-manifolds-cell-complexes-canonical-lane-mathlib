import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GroupActionsManifoldsCellComplexesCanonicalLaneLean

structure GroupActionPackage (M : Type u) [TopologicalSpace M] where
  group : Type v
  groupTopology : TopologicalSpace group
  groupMultiplication : group → group → group
  groupInverse : group → group
  groupIdentity : group
  action : group → M → M
  continuousAction : Continuous (Function.uncurry action)
  actionIdentity : ∀ x : M, action groupIdentity x = x
  actionCompatibility : ∀ (g h : group) (x : M), action (groupMultiplication g h) x = action g (action h x)

structure GroupActionEvidence {M : Type u} [TopologicalSpace M] (G : GroupActionPackage M) where
  continuousActionClosed : G.continuousAction
  actionIdentityClosed : G.actionIdentity
  actionCompatibilityClosed : G.actionCompatibility

def GroupActionClosed {M : Type u} [TopologicalSpace M] (G : GroupActionPackage M) : Prop :=
  G.continuousAction ∧ G.actionIdentity ∧ G.actionCompatibility

theorem group_action_closed_from_evidence {M : Type u} [TopologicalSpace M] (G : GroupActionPackage M)
  (E : GroupActionEvidence G) : GroupActionClosed G := by
  exact And.intro E.continuousActionClosed (And.intro E.actionIdentityClosed E.actionCompatibilityClosed)

end GroupActionsManifoldsCellComplexesCanonicalLaneLean
end HautevilleHouse
