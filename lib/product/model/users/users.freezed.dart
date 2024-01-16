// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'users.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Users _$UsersFromJson(Map<String, dynamic> json) {
  return _Users.fromJson(json);
}

/// @nodoc
mixin _$Users {
  /// name
// ignore: invalid_annotation_target
  @JsonKey(name: 'subscription_list')
  List<Subscriptions>? get subscriptionList =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: 'username')
  String? get username => throw _privateConstructorUsedError;

  /// icon
// ignore: invalid_annotation_target
  @JsonKey(name: 'email')
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'usersUid')
  String? get usersUid => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UsersCopyWith<Users> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UsersCopyWith<$Res> {
  factory $UsersCopyWith(Users value, $Res Function(Users) then) =
      _$UsersCopyWithImpl<$Res, Users>;
  @useResult
  $Res call(
      {@JsonKey(name: 'subscription_list')
      List<Subscriptions>? subscriptionList,
      @JsonKey(name: 'username') String? username,
      @JsonKey(name: 'email') String? email,
      @JsonKey(name: 'usersUid') String? usersUid});
}

/// @nodoc
class _$UsersCopyWithImpl<$Res, $Val extends Users>
    implements $UsersCopyWith<$Res> {
  _$UsersCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subscriptionList = freezed,
    Object? username = freezed,
    Object? email = freezed,
    Object? usersUid = freezed,
  }) {
    return _then(_value.copyWith(
      subscriptionList: freezed == subscriptionList
          ? _value.subscriptionList
          : subscriptionList // ignore: cast_nullable_to_non_nullable
              as List<Subscriptions>?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      usersUid: freezed == usersUid
          ? _value.usersUid
          : usersUid // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UsersImplCopyWith<$Res> implements $UsersCopyWith<$Res> {
  factory _$$UsersImplCopyWith(
          _$UsersImpl value, $Res Function(_$UsersImpl) then) =
      __$$UsersImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'subscription_list')
      List<Subscriptions>? subscriptionList,
      @JsonKey(name: 'username') String? username,
      @JsonKey(name: 'email') String? email,
      @JsonKey(name: 'usersUid') String? usersUid});
}

/// @nodoc
class __$$UsersImplCopyWithImpl<$Res>
    extends _$UsersCopyWithImpl<$Res, _$UsersImpl>
    implements _$$UsersImplCopyWith<$Res> {
  __$$UsersImplCopyWithImpl(
      _$UsersImpl _value, $Res Function(_$UsersImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subscriptionList = freezed,
    Object? username = freezed,
    Object? email = freezed,
    Object? usersUid = freezed,
  }) {
    return _then(_$UsersImpl(
      subscriptionList: freezed == subscriptionList
          ? _value._subscriptionList
          : subscriptionList // ignore: cast_nullable_to_non_nullable
              as List<Subscriptions>?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      usersUid: freezed == usersUid
          ? _value.usersUid
          : usersUid // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UsersImpl implements _Users {
  const _$UsersImpl(
      {@JsonKey(name: 'subscription_list')
      final List<Subscriptions>? subscriptionList,
      @JsonKey(name: 'username') this.username,
      @JsonKey(name: 'email') this.email,
      @JsonKey(name: 'usersUid') this.usersUid})
      : _subscriptionList = subscriptionList;

  factory _$UsersImpl.fromJson(Map<String, dynamic> json) =>
      _$$UsersImplFromJson(json);

  /// name
// ignore: invalid_annotation_target
  final List<Subscriptions>? _subscriptionList;

  /// name
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'subscription_list')
  List<Subscriptions>? get subscriptionList {
    final value = _subscriptionList;
    if (value == null) return null;
    if (_subscriptionList is EqualUnmodifiableListView)
      return _subscriptionList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'username')
  final String? username;

  /// icon
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'email')
  final String? email;
  @override
  @JsonKey(name: 'usersUid')
  final String? usersUid;

  @override
  String toString() {
    return 'Users(subscriptionList: $subscriptionList, username: $username, email: $email, usersUid: $usersUid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UsersImpl &&
            const DeepCollectionEquality()
                .equals(other._subscriptionList, _subscriptionList) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.usersUid, usersUid) ||
                other.usersUid == usersUid));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_subscriptionList),
      username,
      email,
      usersUid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UsersImplCopyWith<_$UsersImpl> get copyWith =>
      __$$UsersImplCopyWithImpl<_$UsersImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UsersImplToJson(
      this,
    );
  }
}

abstract class _Users implements Users {
  const factory _Users(
      {@JsonKey(name: 'subscription_list')
      final List<Subscriptions>? subscriptionList,
      @JsonKey(name: 'username') final String? username,
      @JsonKey(name: 'email') final String? email,
      @JsonKey(name: 'usersUid') final String? usersUid}) = _$UsersImpl;

  factory _Users.fromJson(Map<String, dynamic> json) = _$UsersImpl.fromJson;

  @override

  /// name
// ignore: invalid_annotation_target
  @JsonKey(name: 'subscription_list')
  List<Subscriptions>? get subscriptionList;
  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'username')
  String? get username;
  @override

  /// icon
// ignore: invalid_annotation_target
  @JsonKey(name: 'email')
  String? get email;
  @override
  @JsonKey(name: 'usersUid')
  String? get usersUid;
  @override
  @JsonKey(ignore: true)
  _$$UsersImplCopyWith<_$UsersImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
