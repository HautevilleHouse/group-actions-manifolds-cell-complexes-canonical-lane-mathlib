import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GroupActionsManifoldsCellComplexesCanonicalLaneLean.FixedPointStratification

namespace HautevilleHouse
namespace GroupActionsManifoldsCellComplexesCanonicalLaneLean

structure EquivariantTransversal (X : AdmittedObject) where
  transversal : Set X.carrier
  transversalToOrbits : Prop
  intersectsFixedPointCleanly : Prop
  cleanIntersectionTerm : intersectsFixedPointCleanly
  transversalTerm : transversalToOrbits

def EquivariantTransversalClosed {X : AdmittedObject} (T : EquivariantTransversal X) : Prop :=
  T.transversalToOrbits ∧ T.intersectsFixedPointCleanly

end GroupActionsManifoldsCellComplexesCanonicalLaneLean
end HautevilleHouse