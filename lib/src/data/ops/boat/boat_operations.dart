import 'package:same_boat/src/services/data_access_service.dart';
import 'package:same_boat/src/models/data/internal_boat.sg.dart';

import '../base_operations.dart';

class SubscribeToBoatOp extends SubscribeOp<InternalBoat> {
  final String boatId;

  SubscribeToBoatOp(this.boatId);

  @override
  Stream<InternalBoat> execute(SubscribeService service) {
    final stream = service.getBoatUpdateStream(boatId).map(
          (updateData) => InternalBoat(captainId: 'captainId', boatMembers: []),
        );

    return stream;
  }
}

class JoinBoatQueueOp extends WriteOp<String> {
  final String userId;

  JoinBoatQueueOp(this.userId);

  @override
  Future<String> execute(WriteService service) async {
    await service.addUserToSearchQueue(userId);

    return 'yay';
  }
}
