import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GroupActionsManifoldsCellComplexesCanonicalLaneLean.EquivariantTransversal

namespace HautevilleHouse
namespace GroupActionsManifoldsCellComplexesCanonicalLaneLean

structure LefschetzFixedPointData (X : AdmittedObject) (f : X.carrier → X.carrier) where
  fixedPointSetFinite : Prop
  lefschetzNumber : ℤ
  algebraicCount : ℤ
  summationEqualsIndex : lefschetzNumber = algebraicCount
  fixedPointSetFiniteTerm : fixedPointSetFinite
  summationTerm : summationEqualsIndex

def LefschetzFixedPointClosed {X : AdmittedObject} {f : X.carrier → X.carrier} (L : LefschetzFixedPointData X f) : Prop :=
  L.fixedPointSetFinite ∧ L.summationEqualsIndex

end GroupActionsManifoldsCellComplexesCanonicalLaneLean
end HautevilleHouse