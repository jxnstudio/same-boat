import 'package:built_value/built_value.dart';

part 'internal_user.sg.g.dart';

abstract class InternalUser
    implements Built<InternalUser, InternalUserBuilder> {
  String get id;
  String get username;
  String get pfpId;

  InternalUser._();

  factory InternalUser({
    required String id,
    required String userName,
    required String pfpId,
  }) =>
      _$InternalUser((InternalUserBuilder b) => b
        ..id = id
        ..username = userName
        ..pfpId = pfpId);
}
