import 'package:device_info_plus/device_info_plus.dart';

class DeviceData {
  static DeviceData? _instance;

  final BaseDeviceInfo baseDeviceInfo;

  static Future<DeviceData> create() async {
    if (_instance == null) {
      final deviceInfoPlugin = DeviceInfoPlugin();
      final baseInfo = await deviceInfoPlugin.deviceInfo;
      _instance = DeviceData._(baseInfo);
    }

    return _instance!;
  }

  DeviceData._(this.baseDeviceInfo);
}
