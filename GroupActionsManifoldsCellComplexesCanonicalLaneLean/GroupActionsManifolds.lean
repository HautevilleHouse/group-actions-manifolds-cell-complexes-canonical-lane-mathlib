import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GroupActionsManifoldsCellComplexesCanonicalLaneLean

structure GroupActionManifold where
  manifold : Type u
  topology : TopologicalSpace manifold
  group : Type v
  groupTopology : TopologicalSpace group
  groupMul : group → group → group
  groupInv : group → group
  groupId : group
  action : group → manifold → manifold
  continuousAction : Prop
  properAction : Prop
  freeAction : Prop
  orbitSpaceQuotient : Prop

structure GroupActionEvidence (M : GroupActionManifold) where
  continuousActionClosed : M.continuousAction
  properActionClosed : M.properAction
  freeActionClosed : M.freeAction
  orbitSpaceQuotientClosed : M.orbitSpaceQuotient

def GroupActionManifoldClosed (M : GroupActionManifold) : Prop :=
  M.continuousAction ∧ M.properAction ∧ M.freeAction ∧ M.orbitSpaceQuotient

theorem group_action_manifold_closed_from_evidence (M : GroupActionManifold)
    (E : GroupActionEvidence M) : GroupActionManifoldClosed M := by
  exact And.intro E.continuousActionClosed
    (And.intro E.properActionClosed
      (And.intro E.freeActionClosed E.orbitSpaceQuotientClosed))

end GroupActionsManifoldsCellComplexesCanonicalLaneLean
end HautevilleHouse
