import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GroupActionsManifoldsCellComplexesCanonicalLaneLean

structure EquivariantBordismClass where
  group : Type u
  groupOp : group → group → group
  groupAssoc : ∀ a b c : group, groupOp (groupOp a b) c = groupOp a (groupOp b c)
  groupId : group
  groupIdLeft : ∀ a : group, groupOp groupId a = a
  groupInv : group → group
  groupInvLeft : ∀ a : group, groupOp (groupInv a) a = groupId
  groupTopology : TopologicalSpace group
  continuousGroupOp : Continuous (λ (p : group × group) => groupOp p.1 p.2)
  continuousGroupInv : Continuous (λ (g : group) => groupInv g)
  manifold : Type v
  manifoldTopology : TopologicalSpace manifold
  smoothStructure : ContDiff ⊤ (λ () => ())
  groupAction : group → manifold → manifold
  groupActionSmooth : ContDiff ⊤ (λ (g : group) (x : manifold) => groupAction g x)
  bordismRelation : List (EquivariantBordismClass → EquivariantBordismClass → Prop)
  relationEquivalence : ∀ (C : EquivariantBordismClass), bordismRelation C C
  relationSymm : ∀ (C D : EquivariantBordismClass), bordismRelation C D → bordismRelation D C
  relationTrans : ∀ (C D E : EquivariantBordismClass), bordismRelation C D → bordismRelation D E → bordismRelation C E

def EquivariantBordismClassClosed (C : EquivariantBordismClass) : Prop :=
  C.groupActionSmooth ∧ C.relationEquivalence C

theorem equivariant_bordism_class_closed (C : EquivariantBordismClass) :
    EquivariantBordismClassClosed C := by
  refine And.intro C.groupActionSmooth (C.relationEquivalence C)

end GroupActionsManifoldsCellComplexesCanonicalLaneLean
end HautevilleHouse
