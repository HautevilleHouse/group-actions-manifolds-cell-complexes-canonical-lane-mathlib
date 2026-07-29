import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace GroupActionsManifoldsCellComplexesCanonicalLaneLean

structure AdmittedObject where
  carrier : Type
  topology : TopologicalSpace carrier
  manifoldStructure : Prop
  groupAction : carrier → carrier → carrier
  groupActionContinuous : Prop
  fixedPointSet : Set carrier
  cellComplexStructure : Prop
  closureCondition : Prop

def AdmittedObjectClosed (O : AdmittedObject) : Prop :=
  O.manifoldStructure ∧ O.groupActionContinuous ∧ O.cellComplexStructure ∧ O.closureCondition

end GroupActionsManifoldsCellComplexesCanonicalLaneLean
end HautevilleHouse