import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace HciInputDevicesCanonicalLaneLean

structure InputDevice where
  deviceType : String
  connectivity : String
  pollingRate : Nat

structure DeviceCategory where
  pointing : Bool
  textEntry : Bool
  gesture : Bool
  haptic : Bool

structure DeviceTaxonomyPackage where
  device : InputDevice
  category : DeviceCategory
  ergonomicScore : Nat
  reportedLatency : Nat
  driverAvailability : Prop

structure DeviceTaxonomyEvidence (D : DeviceTaxonomyPackage) where
  pointingCatClosed : D.category.pointing = true
  textEntryCatClosed : D.category.textEntry = true
  driverAvailableClosed : D.driverAvailability

def DeviceTaxonomyClosed (D : DeviceTaxonomyPackage) : Prop :=
  D.category.pointing ∧ D.category.textEntry ∧ D.driverAvailability

theorem device_taxonomy_closed_from_evidence (D : DeviceTaxonomyPackage) (E : DeviceTaxonomyEvidence D) : DeviceTaxonomyClosed D := by
  exact And.intro E.pointingCatClosed (And.intro E.textEntryCatClosed E.driverAvailableClosed)

end HciInputDevicesCanonicalLaneLean
end HautevilleHouse