import 'package:built_value/built_value.dart';

part 'internal_user.sg.g.dart';

abstract class InternalUser
    implements Built<InternalUser, InternalUserBuilder> {
  String get username;
  String get pfpId;

  InternalUser._();

  factory InternalUser({required userName, required pfpId}) =>
      _$InternalUser((InternalUserBuilder b) => b
        ..username = userName
        ..pfpId = pfpId);
}
