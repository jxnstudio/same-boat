import 'package:same_boat/src/data/records/boat_record.dart';
import 'package:same_boat/src/models/internal_user.sg.dart';
import 'package:same_boat/src/models/json/records/boat_record.dart';

import '../../models/internal_boat.sg.dart';

class BoatFacade {
  final BoatRecord record;

  static BoatFacade createBoatForUser(
    InternalUser user,
  ) {
    const boatId = 'newBoatId';
    final record = BoatRecord.forNewBoat(boatId, user);

    return BoatFacade._(record);
  }

  static BoatFacade loadFromJson(String boatId, Map<String, dynamic> json) {
    final record = BoatRecord.fromJson(boatId, json);

    return BoatFacade._(record);
  }

  BoatFacade._(this.record);

  InternalBoat toInternal() {
    final captainId = record.getFieldValue(BoatRecordFields.captainId)!;

    return InternalBoat(captainId: captainId, boatMembers: );
  }
}
