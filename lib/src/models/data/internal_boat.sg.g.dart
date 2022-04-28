// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'internal_boat.sg.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$InternalBoat extends InternalBoat {
  @override
  final BuiltList<InternalUser> boatMembers;
  @override
  final String captainId;

  factory _$InternalBoat([void Function(InternalBoatBuilder)? updates]) =>
      (new InternalBoatBuilder()..update(updates)).build();

  _$InternalBoat._({required this.boatMembers, required this.captainId})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        boatMembers, 'InternalBoat', 'boatMembers');
    BuiltValueNullFieldError.checkNotNull(
        captainId, 'InternalBoat', 'captainId');
  }

  @override
  InternalBoat rebuild(void Function(InternalBoatBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InternalBoatBuilder toBuilder() => new InternalBoatBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InternalBoat &&
        boatMembers == other.boatMembers &&
        captainId == other.captainId;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, boatMembers.hashCode), captainId.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('InternalBoat')
          ..add('boatMembers', boatMembers)
          ..add('captainId', captainId))
        .toString();
  }
}

class InternalBoatBuilder
    implements Builder<InternalBoat, InternalBoatBuilder> {
  _$InternalBoat? _$v;

  ListBuilder<InternalUser>? _boatMembers;
  ListBuilder<InternalUser> get boatMembers =>
      _$this._boatMembers ??= new ListBuilder<InternalUser>();
  set boatMembers(ListBuilder<InternalUser>? boatMembers) =>
      _$this._boatMembers = boatMembers;

  String? _captainId;
  String? get captainId => _$this._captainId;
  set captainId(String? captainId) => _$this._captainId = captainId;

  InternalBoatBuilder();

  InternalBoatBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _boatMembers = $v.boatMembers.toBuilder();
      _captainId = $v.captainId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(InternalBoat other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$InternalBoat;
  }

  @override
  void update(void Function(InternalBoatBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$InternalBoat build() {
    _$InternalBoat _$result;
    try {
      _$result = _$v ??
          new _$InternalBoat._(
              boatMembers: boatMembers.build(),
              captainId: BuiltValueNullFieldError.checkNotNull(
                  captainId, 'InternalBoat', 'captainId'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'boatMembers';
        boatMembers.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'InternalBoat', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
