import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GroupActionsManifoldsCellComplexesCanonicalLaneLean

structure CoveringSpacePackage (M N : Type u) [TopologicalSpace M] [TopologicalSpace N] where
  coveringMap : N → M
  localHomeomorphism : ∀ x : N, ∃ U ∈ 𝓝 x, (coveringMap '' U) ∈ 𝓝 (coveringMap x) ∧ coveringMap ∘ (fun y : U => y) = (fun y : U => coveringMap y)
  discreteFiber : Prop
  deckTransformationGroup : Group (N → N)
  properlyDiscontinuousDeck : Prop

structure CoveringSpaceEvidence {M N : Type u} [TopologicalSpace M] [TopologicalSpace N]
    (C : CoveringSpacePackage M N) where
  discreteFiberClosed : C.discreteFiber
  properlyDiscontinuousDeckClosed : C.properlyDiscontinuousDeck

def CoveringSpaceClosed {M N : Type u} [TopologicalSpace M] [TopologicalSpace N]
    (C : CoveringSpacePackage M N) : Prop :=
  C.discreteFiber ∧ C.properlyDiscontinuousDeck

theorem covering_space_closed_from_evidence {M N : Type u} [TopologicalSpace M] [TopologicalSpace N]
    (C : CoveringSpacePackage M N) (E : CoveringSpaceEvidence C) : CoveringSpaceClosed C := by
  exact And.intro E.discreteFiberClosed E.properlyDiscontinuousDeckClosed

end GroupActionsManifoldsCellComplexesCanonicalLaneLean
end HautevilleHouse