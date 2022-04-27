import 'repositories/data_repositories.dart';

class DataUpdateManager {
  static DataUpdateManager? _instance;
  final DataRepositories dataRepos;

  static Future<DataUpdateManager> create() async {
    if (_instance == null) {
      final repos = await DataRepositories.create();
      _instance = DataUpdateManager._(repos);
    }

    return _instance!;
  }

  DataUpdateManager._(this.dataRepos);
}
