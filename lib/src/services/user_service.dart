import '../models/internal_user.sg.dart';

abstract class UserService {
  Future<void> updateUser(InternalUser user);
}
