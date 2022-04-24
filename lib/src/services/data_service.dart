abstract class DataService {
  Stream getBoatUpdateStream(String boatId);

  Stream getQueueUpdateStream(String userId);

  Future<void> createBoatForUser(String userId);

  Future<void> addUserToSearchQueue(String userId);

  Future<void> removeUserFromSearchQueue(String userId);
}
