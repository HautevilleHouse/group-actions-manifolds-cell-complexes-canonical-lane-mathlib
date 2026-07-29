import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GroupActionsManifoldsCellComplexesCanonicalLaneLean

structure EquivariantCohomologyTheory where
  group : Type u
  groupTopology : TopologicalSpace group
  cohomologyGroups : ℤ → Type v
  longExactSequence : Prop
  excision : Prop
  homotopyInvariance : Prop
  suspensionIsomorphism : Prop
  dimensionAxiom : Prop

structure EquivariantCohomologyEvidence (E : EquivariantCohomologyTheory) where
  longExactSequenceClosed : E.longExactSequence
  excisionClosed : E.excision
  homotopyInvarianceClosed : E.homotopyInvariance
  suspensionIsomorphismClosed : E.suspensionIsomorphism
  dimensionAxiomClosed : E.dimensionAxiom

def EquivariantCohomologyClosed (E : EquivariantCohomologyTheory) : Prop :=
  E.longExactSequence ∧ E.excision ∧ E.homotopyInvariance ∧
  E.suspensionIsomorphism ∧ E.dimensionAxiom

theorem equivariant_cohomology_closed_from_evidence
    (E : EquivariantCohomologyTheory) (Ev : EquivariantCohomologyEvidence E) :
    EquivariantCohomologyClosed E := by
  exact And.intro Ev.longExactSequenceClosed
    (And.intro Ev.excisionClosed
      (And.intro Ev.homotopyInvarianceClosed
        (And.intro Ev.suspensionIsomorphismClosed Ev.dimensionAxiomClosed)))

end GroupActionsManifoldsCellComplexesCanonicalLaneLean
end HautevilleHouse
