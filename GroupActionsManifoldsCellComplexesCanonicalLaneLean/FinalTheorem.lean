import canonicalLaneMathlib.AdmissibleClass
import GroupActionsManifoldsCellComplexesCanonicalLaneLean.GroupActionCW
import GroupActionsManifoldsCellComplexesCanonicalLaneLean.EquivariantBordism
import GroupActionsManifoldsCellComplexesCanonicalLaneLean.FixedPointStratification

namespace HautevilleHouse
namespace GroupActionsManifoldsCellComplexesCanonicalLaneLean

def ConstrainedGroupActionsClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_group_actions_endgame (A : AdmissibleClass) :
    ConstrainedGroupActionsClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end GroupActionsManifoldsCellComplexesCanonicalLaneLean
end HautevilleHouse
