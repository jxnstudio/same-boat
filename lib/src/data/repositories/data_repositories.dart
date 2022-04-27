import 'package:same_boat/src/data/repositories/device_data.dart';
import 'package:same_boat/src/data/repositories/firebase_realtime_database.dart';

class DataRepositories {
  static DataRepositories? _instance;

  final DeviceData deviceData;
  final FirebaseRealtimeDatabase database;

  static Future<DataRepositories> create() async {
    if (_instance == null) {
      final deviceData = await DeviceData.create();
      final database = FirebaseRealtimeDatabase();
      _instance = DataRepositories._(deviceData, database);
    }

    return _instance!;
  }

  DataRepositories._(this.deviceData, this.database);
}
