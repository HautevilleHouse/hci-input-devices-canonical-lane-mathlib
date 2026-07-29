import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace HciInputDevicesCanonicalLaneLean

structure DeviceDriverPackage where
  driverName : String
  driverVersion : String
  compatibility : Prop
  interruptHandling : Prop

structure DeviceDriverEvidence (D : DeviceDriverPackage) where
  driverNameNonEmpty : D.driverName ≠ ""
  versionValid : D.driverVersion ≠ ""
  compatibilityVerified : D.compatibility
  interruptOk : D.interruptHandling

def DeviceDriverClosed (D : DeviceDriverPackage) : Prop :=
  D.driverName ≠ "" ∧ D.driverVersion ≠ "" ∧ D.compatibility ∧ D.interruptHandling

theorem device_driver_closed_from_evidence (D : DeviceDriverPackage)
    (e : DeviceDriverEvidence D) : DeviceDriverClosed D := by
  exact And.intro e.driverNameNonEmpty (And.intro e.versionValid (And.intro e.compatibilityVerified e.interruptOk))

end HciInputDevicesCanonicalLaneLean
end HautevilleHouse