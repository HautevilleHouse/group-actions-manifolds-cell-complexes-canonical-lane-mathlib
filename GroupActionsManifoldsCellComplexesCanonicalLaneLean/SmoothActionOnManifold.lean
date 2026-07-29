import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GroupActionsManifoldsCellComplexesCanonicalLaneLean

structure SmoothActionPackage (M : Type u) [TopologicalSpace M] [SmoothManifold M] where
  group : Type v
  groupSmoothStructure : SmoothManifold group
  smoothAction : group → M → M
  actionSmooth : Smooth (Product.group group M) M (Function.uncurry smoothAction)
  actionIdentitySmooth : ∀ x : M, smoothAction (1 : group) x = x
  actionCompatibilitySmooth : ∀ (g h : group) (x : M), smoothAction (g * h) x = smoothAction g (smoothAction h x)
  fixedPointSet : Set M
  isotropySubgroups : group → Set group
  orbitTypeStratification : Prop

structure SmoothActionEvidence {M : Type u} [TopologicalSpace M] [SmoothManifold M] (SA : SmoothActionPackage M) where
  actionSmoothClosed : SA.actionSmooth
  actionIdentitySmoothClosed : SA.actionIdentitySmooth
  actionCompatibilitySmoothClosed : SA.actionCompatibilitySmooth
  orbitTypeStratificationClosed : SA.orbitTypeStratification

def SmoothActionClosed {M : Type u} [TopologicalSpace M] [SmoothManifold M] (SA : SmoothActionPackage M) : Prop :=
  SA.actionSmooth ∧ SA.actionIdentitySmooth ∧ SA.actionCompatibilitySmooth ∧ SA.orbitTypeStratification

theorem smooth_action_closed_from_evidence {M : Type u} [TopologicalSpace M] [SmoothManifold M]
  (SA : SmoothActionPackage M) (E : SmoothActionEvidence SA) : SmoothActionClosed SA := by
  exact And.intro E.actionSmoothClosed
    (And.intro E.actionIdentitySmoothClosed
      (And.intro E.actionCompatibilitySmoothClosed E.orbitTypeStratificationClosed))

end GroupActionsManifoldsCellComplexesCanonicalLaneLean
end HautevilleHouse
