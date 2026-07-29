import canonicalLaneMathlib.AdmissibleClass
import HciInputDevicesCanonicalLaneLean.DeviceTaxonomy

namespace HautevilleHouse
namespace HciInputDevicesCanonicalLaneLean

structure DeviceControllerBridgePackage where
  device : InputDevice
  controllerFirmwareVersion : String
  bridgeProtocol : String
  pairingCompleted : Prop
  dataChannelOpen : Prop

structure DeviceControllerBridgeEvidence (B : DeviceControllerBridgePackage) where
  pairingCompletedClosed : B.pairingCompleted
  dataChannelOpenClosed : B.dataChannelOpen

def DeviceControllerBridgeClosed (B : DeviceControllerBridgePackage) : Prop :=
  B.pairingCompleted ∧ B.dataChannelOpen

theorem device_controller_bridge_closed_from_evidence (B : DeviceControllerBridgePackage) (E : DeviceControllerBridgeEvidence B) : DeviceControllerBridgeClosed B := by
  exact And.intro E.pairingCompletedClosed E.dataChannelOpenClosed

end HciInputDevicesCanonicalLaneLean
end HautevilleHouse