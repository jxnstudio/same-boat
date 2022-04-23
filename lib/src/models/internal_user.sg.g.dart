// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'internal_user.sg.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$InternalUser extends InternalUser {
  @override
  final String username;
  @override
  final String pfpId;

  factory _$InternalUser([void Function(InternalUserBuilder)? updates]) =>
      (new InternalUserBuilder()..update(updates)).build();

  _$InternalUser._({required this.username, required this.pfpId}) : super._() {
    BuiltValueNullFieldError.checkNotNull(username, 'InternalUser', 'username');
    BuiltValueNullFieldError.checkNotNull(pfpId, 'InternalUser', 'pfpId');
  }

  @override
  InternalUser rebuild(void Function(InternalUserBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InternalUserBuilder toBuilder() => new InternalUserBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InternalUser &&
        username == other.username &&
        pfpId == other.pfpId;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, username.hashCode), pfpId.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('InternalUser')
          ..add('username', username)
          ..add('pfpId', pfpId))
        .toString();
  }
}

class InternalUserBuilder
    implements Builder<InternalUser, InternalUserBuilder> {
  _$InternalUser? _$v;

  String? _username;
  String? get username => _$this._username;
  set username(String? username) => _$this._username = username;

  String? _pfpId;
  String? get pfpId => _$this._pfpId;
  set pfpId(String? pfpId) => _$this._pfpId = pfpId;

  InternalUserBuilder();

  InternalUserBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _username = $v.username;
      _pfpId = $v.pfpId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(InternalUser other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$InternalUser;
  }

  @override
  void update(void Function(InternalUserBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$InternalUser build() {
    final _$result = _$v ??
        new _$InternalUser._(
            username: BuiltValueNullFieldError.checkNotNull(
                username, 'InternalUser', 'username'),
            pfpId: BuiltValueNullFieldError.checkNotNull(
                pfpId, 'InternalUser', 'pfpId'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
