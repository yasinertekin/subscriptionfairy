// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subscriptions.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Subscriptions _$SubscriptionsFromJson(Map<String, dynamic> json) {
  return _Subscriptions.fromJson(json);
}

/// @nodoc
mixin _$Subscriptions {
  /// name
// ignore: invalid_annotation_target
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;

  /// title
// ignore: invalid_annotation_target
  @JsonKey(name: 'subscription_plan')
  String? get subscriptionPlan => throw _privateConstructorUsedError;
  @JsonKey(name: 'isSubscribed')
  bool? get isSubscribed => throw _privateConstructorUsedError;
  @JsonKey(name: 'subscription_icon')
  String? get subscriptionIcon => throw _privateConstructorUsedError;
  @JsonKey(name: 'subId')
  String? get subId => throw _privateConstructorUsedError;
  @JsonKey(name: 'endDate')
  DateTime? get endDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'startDate')
  DateTime? get startDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'subscriptionPrice')
  double? get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'subscription_length')
  double? get subscriptionLength => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubscriptionsCopyWith<Subscriptions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubscriptionsCopyWith<$Res> {
  factory $SubscriptionsCopyWith(
          Subscriptions value, $Res Function(Subscriptions) then) =
      _$SubscriptionsCopyWithImpl<$Res, Subscriptions>;
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String? name,
      @JsonKey(name: 'subscription_plan') String? subscriptionPlan,
      @JsonKey(name: 'isSubscribed') bool? isSubscribed,
      @JsonKey(name: 'subscription_icon') String? subscriptionIcon,
      @JsonKey(name: 'subId') String? subId,
      @JsonKey(name: 'endDate') DateTime? endDate,
      @JsonKey(name: 'startDate') DateTime? startDate,
      @JsonKey(name: 'subscriptionPrice') double? price,
      @JsonKey(name: 'subscription_length') double? subscriptionLength});
}

/// @nodoc
class _$SubscriptionsCopyWithImpl<$Res, $Val extends Subscriptions>
    implements $SubscriptionsCopyWith<$Res> {
  _$SubscriptionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? subscriptionPlan = freezed,
    Object? isSubscribed = freezed,
    Object? subscriptionIcon = freezed,
    Object? subId = freezed,
    Object? endDate = freezed,
    Object? startDate = freezed,
    Object? price = freezed,
    Object? subscriptionLength = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      subscriptionPlan: freezed == subscriptionPlan
          ? _value.subscriptionPlan
          : subscriptionPlan // ignore: cast_nullable_to_non_nullable
              as String?,
      isSubscribed: freezed == isSubscribed
          ? _value.isSubscribed
          : isSubscribed // ignore: cast_nullable_to_non_nullable
              as bool?,
      subscriptionIcon: freezed == subscriptionIcon
          ? _value.subscriptionIcon
          : subscriptionIcon // ignore: cast_nullable_to_non_nullable
              as String?,
      subId: freezed == subId
          ? _value.subId
          : subId // ignore: cast_nullable_to_non_nullable
              as String?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      subscriptionLength: freezed == subscriptionLength
          ? _value.subscriptionLength
          : subscriptionLength // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SubscriptionsImplCopyWith<$Res>
    implements $SubscriptionsCopyWith<$Res> {
  factory _$$SubscriptionsImplCopyWith(
          _$SubscriptionsImpl value, $Res Function(_$SubscriptionsImpl) then) =
      __$$SubscriptionsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String? name,
      @JsonKey(name: 'subscription_plan') String? subscriptionPlan,
      @JsonKey(name: 'isSubscribed') bool? isSubscribed,
      @JsonKey(name: 'subscription_icon') String? subscriptionIcon,
      @JsonKey(name: 'subId') String? subId,
      @JsonKey(name: 'endDate') DateTime? endDate,
      @JsonKey(name: 'startDate') DateTime? startDate,
      @JsonKey(name: 'subscriptionPrice') double? price,
      @JsonKey(name: 'subscription_length') double? subscriptionLength});
}

/// @nodoc
class __$$SubscriptionsImplCopyWithImpl<$Res>
    extends _$SubscriptionsCopyWithImpl<$Res, _$SubscriptionsImpl>
    implements _$$SubscriptionsImplCopyWith<$Res> {
  __$$SubscriptionsImplCopyWithImpl(
      _$SubscriptionsImpl _value, $Res Function(_$SubscriptionsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? subscriptionPlan = freezed,
    Object? isSubscribed = freezed,
    Object? subscriptionIcon = freezed,
    Object? subId = freezed,
    Object? endDate = freezed,
    Object? startDate = freezed,
    Object? price = freezed,
    Object? subscriptionLength = freezed,
  }) {
    return _then(_$SubscriptionsImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      subscriptionPlan: freezed == subscriptionPlan
          ? _value.subscriptionPlan
          : subscriptionPlan // ignore: cast_nullable_to_non_nullable
              as String?,
      isSubscribed: freezed == isSubscribed
          ? _value.isSubscribed
          : isSubscribed // ignore: cast_nullable_to_non_nullable
              as bool?,
      subscriptionIcon: freezed == subscriptionIcon
          ? _value.subscriptionIcon
          : subscriptionIcon // ignore: cast_nullable_to_non_nullable
              as String?,
      subId: freezed == subId
          ? _value.subId
          : subId // ignore: cast_nullable_to_non_nullable
              as String?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      subscriptionLength: freezed == subscriptionLength
          ? _value.subscriptionLength
          : subscriptionLength // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SubscriptionsImpl implements _Subscriptions {
  const _$SubscriptionsImpl(
      {@JsonKey(name: 'name') this.name,
      @JsonKey(name: 'subscription_plan') this.subscriptionPlan,
      @JsonKey(name: 'isSubscribed') this.isSubscribed,
      @JsonKey(name: 'subscription_icon') this.subscriptionIcon,
      @JsonKey(name: 'subId') this.subId,
      @JsonKey(name: 'endDate') this.endDate,
      @JsonKey(name: 'startDate') this.startDate,
      @JsonKey(name: 'subscriptionPrice') this.price,
      @JsonKey(name: 'subscription_length') this.subscriptionLength});

  factory _$SubscriptionsImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubscriptionsImplFromJson(json);

  /// name
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'name')
  final String? name;

  /// title
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'subscription_plan')
  final String? subscriptionPlan;
  @override
  @JsonKey(name: 'isSubscribed')
  final bool? isSubscribed;
  @override
  @JsonKey(name: 'subscription_icon')
  final String? subscriptionIcon;
  @override
  @JsonKey(name: 'subId')
  final String? subId;
  @override
  @JsonKey(name: 'endDate')
  final DateTime? endDate;
  @override
  @JsonKey(name: 'startDate')
  final DateTime? startDate;
  @override
  @JsonKey(name: 'subscriptionPrice')
  final double? price;
  @override
  @JsonKey(name: 'subscription_length')
  final double? subscriptionLength;

  @override
  String toString() {
    return 'Subscriptions(name: $name, subscriptionPlan: $subscriptionPlan, isSubscribed: $isSubscribed, subscriptionIcon: $subscriptionIcon, subId: $subId, endDate: $endDate, startDate: $startDate, price: $price, subscriptionLength: $subscriptionLength)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubscriptionsImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.subscriptionPlan, subscriptionPlan) ||
                other.subscriptionPlan == subscriptionPlan) &&
            (identical(other.isSubscribed, isSubscribed) ||
                other.isSubscribed == isSubscribed) &&
            (identical(other.subscriptionIcon, subscriptionIcon) ||
                other.subscriptionIcon == subscriptionIcon) &&
            (identical(other.subId, subId) || other.subId == subId) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.subscriptionLength, subscriptionLength) ||
                other.subscriptionLength == subscriptionLength));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      subscriptionPlan,
      isSubscribed,
      subscriptionIcon,
      subId,
      endDate,
      startDate,
      price,
      subscriptionLength);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubscriptionsImplCopyWith<_$SubscriptionsImpl> get copyWith =>
      __$$SubscriptionsImplCopyWithImpl<_$SubscriptionsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubscriptionsImplToJson(
      this,
    );
  }
}

abstract class _Subscriptions implements Subscriptions {
  const factory _Subscriptions(
      {@JsonKey(name: 'name') final String? name,
      @JsonKey(name: 'subscription_plan') final String? subscriptionPlan,
      @JsonKey(name: 'isSubscribed') final bool? isSubscribed,
      @JsonKey(name: 'subscription_icon') final String? subscriptionIcon,
      @JsonKey(name: 'subId') final String? subId,
      @JsonKey(name: 'endDate') final DateTime? endDate,
      @JsonKey(name: 'startDate') final DateTime? startDate,
      @JsonKey(name: 'subscriptionPrice') final double? price,
      @JsonKey(name: 'subscription_length')
      final double? subscriptionLength}) = _$SubscriptionsImpl;

  factory _Subscriptions.fromJson(Map<String, dynamic> json) =
      _$SubscriptionsImpl.fromJson;

  @override

  /// name
// ignore: invalid_annotation_target
  @JsonKey(name: 'name')
  String? get name;
  @override

  /// title
// ignore: invalid_annotation_target
  @JsonKey(name: 'subscription_plan')
  String? get subscriptionPlan;
  @override
  @JsonKey(name: 'isSubscribed')
  bool? get isSubscribed;
  @override
  @JsonKey(name: 'subscription_icon')
  String? get subscriptionIcon;
  @override
  @JsonKey(name: 'subId')
  String? get subId;
  @override
  @JsonKey(name: 'endDate')
  DateTime? get endDate;
  @override
  @JsonKey(name: 'startDate')
  DateTime? get startDate;
  @override
  @JsonKey(name: 'subscriptionPrice')
  double? get price;
  @override
  @JsonKey(name: 'subscription_length')
  double? get subscriptionLength;
  @override
  @JsonKey(ignore: true)
  _$$SubscriptionsImplCopyWith<_$SubscriptionsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
