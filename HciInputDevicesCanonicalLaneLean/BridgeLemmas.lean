import HciInputDevicesCanonicalLaneLean.HciInputDeviceAdmissibleClass

namespace HautevilleHouse
namespace HciInputDevicesCanonicalLaneLean

def bridgeClosed (A : AdmittedHciInputDeviceObject) : Prop :=
  A.object.conclusion

theorem bridge_from_admissible_class (A : AdmittedHciInputDeviceObject) :
    bridgeClosed A := by
  exact A.object.conclusion

end HciInputDevicesCanonicalLaneLean
end HautevilleHouse