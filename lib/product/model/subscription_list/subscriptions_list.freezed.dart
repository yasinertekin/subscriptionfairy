// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subscriptions_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SubscriptionsList _$SubscriptionsListFromJson(Map<String, dynamic> json) {
  return _SubscriptionsList.fromJson(json);
}

/// @nodoc
mixin _$SubscriptionsList {
  /// name
// ignore: invalid_annotation_target
  @JsonKey(name: 'subscription_list')
  List<Subscriptions>? get name =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: 'subscription_name')
  String? get subscriptionName => throw _privateConstructorUsedError;
  @JsonKey(name: 'subscription_icon')
  String? get subscriptionIcon => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubscriptionsListCopyWith<SubscriptionsList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubscriptionsListCopyWith<$Res> {
  factory $SubscriptionsListCopyWith(
          SubscriptionsList value, $Res Function(SubscriptionsList) then) =
      _$SubscriptionsListCopyWithImpl<$Res, SubscriptionsList>;
  @useResult
  $Res call(
      {@JsonKey(name: 'subscription_list') List<Subscriptions>? name,
      @JsonKey(name: 'subscription_name') String? subscriptionName,
      @JsonKey(name: 'subscription_icon') String? subscriptionIcon});
}

/// @nodoc
class _$SubscriptionsListCopyWithImpl<$Res, $Val extends SubscriptionsList>
    implements $SubscriptionsListCopyWith<$Res> {
  _$SubscriptionsListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? subscriptionName = freezed,
    Object? subscriptionIcon = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as List<Subscriptions>?,
      subscriptionName: freezed == subscriptionName
          ? _value.subscriptionName
          : subscriptionName // ignore: cast_nullable_to_non_nullable
              as String?,
      subscriptionIcon: freezed == subscriptionIcon
          ? _value.subscriptionIcon
          : subscriptionIcon // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SubscriptionsListImplCopyWith<$Res>
    implements $SubscriptionsListCopyWith<$Res> {
  factory _$$SubscriptionsListImplCopyWith(_$SubscriptionsListImpl value,
          $Res Function(_$SubscriptionsListImpl) then) =
      __$$SubscriptionsListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'subscription_list') List<Subscriptions>? name,
      @JsonKey(name: 'subscription_name') String? subscriptionName,
      @JsonKey(name: 'subscription_icon') String? subscriptionIcon});
}

/// @nodoc
class __$$SubscriptionsListImplCopyWithImpl<$Res>
    extends _$SubscriptionsListCopyWithImpl<$Res, _$SubscriptionsListImpl>
    implements _$$SubscriptionsListImplCopyWith<$Res> {
  __$$SubscriptionsListImplCopyWithImpl(_$SubscriptionsListImpl _value,
      $Res Function(_$SubscriptionsListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? subscriptionName = freezed,
    Object? subscriptionIcon = freezed,
  }) {
    return _then(_$SubscriptionsListImpl(
      name: freezed == name
          ? _value._name
          : name // ignore: cast_nullable_to_non_nullable
              as List<Subscriptions>?,
      subscriptionName: freezed == subscriptionName
          ? _value.subscriptionName
          : subscriptionName // ignore: cast_nullable_to_non_nullable
              as String?,
      subscriptionIcon: freezed == subscriptionIcon
          ? _value.subscriptionIcon
          : subscriptionIcon // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SubscriptionsListImpl implements _SubscriptionsList {
  const _$SubscriptionsListImpl(
      {@JsonKey(name: 'subscription_list') final List<Subscriptions>? name,
      @JsonKey(name: 'subscription_name') this.subscriptionName,
      @JsonKey(name: 'subscription_icon') this.subscriptionIcon})
      : _name = name;

  factory _$SubscriptionsListImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubscriptionsListImplFromJson(json);

  /// name
// ignore: invalid_annotation_target
  final List<Subscriptions>? _name;

  /// name
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'subscription_list')
  List<Subscriptions>? get name {
    final value = _name;
    if (value == null) return null;
    if (_name is EqualUnmodifiableListView) return _name;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'subscription_name')
  final String? subscriptionName;
  @override
  @JsonKey(name: 'subscription_icon')
  final String? subscriptionIcon;

  @override
  String toString() {
    return 'SubscriptionsList(name: $name, subscriptionName: $subscriptionName, subscriptionIcon: $subscriptionIcon)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubscriptionsListImpl &&
            const DeepCollectionEquality().equals(other._name, _name) &&
            (identical(other.subscriptionName, subscriptionName) ||
                other.subscriptionName == subscriptionName) &&
            (identical(other.subscriptionIcon, subscriptionIcon) ||
                other.subscriptionIcon == subscriptionIcon));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_name),
      subscriptionName,
      subscriptionIcon);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubscriptionsListImplCopyWith<_$SubscriptionsListImpl> get copyWith =>
      __$$SubscriptionsListImplCopyWithImpl<_$SubscriptionsListImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubscriptionsListImplToJson(
      this,
    );
  }
}

abstract class _SubscriptionsList implements SubscriptionsList {
  const factory _SubscriptionsList(
          {@JsonKey(name: 'subscription_list') final List<Subscriptions>? name,
          @JsonKey(name: 'subscription_name') final String? subscriptionName,
          @JsonKey(name: 'subscription_icon') final String? subscriptionIcon}) =
      _$SubscriptionsListImpl;

  factory _SubscriptionsList.fromJson(Map<String, dynamic> json) =
      _$SubscriptionsListImpl.fromJson;

  @override

  /// name
// ignore: invalid_annotation_target
  @JsonKey(name: 'subscription_list')
  List<Subscriptions>? get name;
  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'subscription_name')
  String? get subscriptionName;
  @override
  @JsonKey(name: 'subscription_icon')
  String? get subscriptionIcon;
  @override
  @JsonKey(ignore: true)
  _$$SubscriptionsListImplCopyWith<_$SubscriptionsListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
