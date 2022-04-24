import '../models/internal_user.sg.dart';

abstract class QueueService {
  Future<void> addUserToQueue(InternalUser user);

  Future<void> dequeueUser(InternalUser user);
}
