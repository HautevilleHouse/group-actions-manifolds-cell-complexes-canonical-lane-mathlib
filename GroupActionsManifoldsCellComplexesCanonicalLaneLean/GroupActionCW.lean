import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GroupActionsManifoldsCellComplexesCanonicalLaneLean

structure GroupActionCWComplex where
  group : Type u
  groupMul : group → group → group
  groupInv : group → group
  groupId : group
  groupAssoc : ∀ a b c : group, groupMul (groupMul a b) c = groupMul a (groupMul b c)
  groupInvLeft : ∀ a : group, groupMul (groupInv a) a = groupId
  groupIdLeft : ∀ a : group, groupMul groupId a = a
  space : Type v
  topology : TopologicalSpace space
  cellStructure : List (ℕ × TopologicalSpace space)
  action : group → space → space
  actionContinuous : Continuous (λ (g : group) (x : space) => action g x)
  actionCompatCW : CompatibleWithCW action cellStructure

structure GroupActionCWEvidence (C : GroupActionCWComplex) where
  actionContinuousClosed : C.actionContinuous
  actionCompatCWClosed : C.actionCompatCW

def GroupActionCWClosed (C : GroupActionCWComplex) : Prop :=
  C.actionContinuous ∧ C.actionCompatCW

theorem group_action_cw_closed_from_evidence (C : GroupActionCWComplex) (E : GroupActionCWEvidence C) :
    GroupActionCWClosed C := by
  exact And.intro E.actionContinuousClosed E.actionCompatCWClosed

end GroupActionsManifoldsCellComplexesCanonicalLaneLean
end HautevilleHouse
