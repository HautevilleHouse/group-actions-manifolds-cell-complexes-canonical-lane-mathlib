import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GroupActionsManifoldsCellComplexesCanonicalLaneLean.GroupActionsManifoldsCellComplexes

namespace HautevilleHouse
namespace GroupActionsManifoldsCellComplexesCanonicalLaneLean

structure EquivariantMap (X Y : AdmittedObject) where
  map : X.carrier → Y.carrier
  continuous : Prop
  equivariant : ∀ (g : X.carrier → X.carrier) (x : X.carrier), map (g x) = (Y.groupAction (map x)) ?_
  continuousTerm : continuous
  equivariantTerm : equivariant

def EquivariantMapClosed {X Y : AdmittedObject} (φ : EquivariantMap X Y) : Prop :=
  φ.continuous ∧ φ.equivariant

end GroupActionsManifoldsCellComplexesCanonicalLaneLean
end HautevilleHouse