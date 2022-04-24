import 'package:firebase_database/firebase_database.dart';

import 'update_service.dart';

class UpdateServiceImpl implements UpdateService {
  late DatabaseReference _ref;

  void start() {
    _ref = FirebaseDatabase.instance.ref();
  }

  void stop() {
    _ref.
  }
}
