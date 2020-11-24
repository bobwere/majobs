// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'sp_sets_price_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$SpSetsPriceeStateTearOff {
  const _$SpSetsPriceeStateTearOff();

// ignore: unused_element
  _SpSetsPriceeState call(
      {String rating,
      bool isSubmitting,
      String workDuration,
      String agreedPrice,
      Option<Either<JobJourneyFailure, Unit>> sendingFailureOrSuccessOption}) {
    return _SpSetsPriceeState(
      rating: rating,
      isSubmitting: isSubmitting,
      workDuration: workDuration,
      agreedPrice: agreedPrice,
      sendingFailureOrSuccessOption: sendingFailureOrSuccessOption,
    );
  }
}

// ignore: unused_element
const $SpSetsPriceeState = _$SpSetsPriceeStateTearOff();

mixin _$SpSetsPriceeState {
  String get rating;
  bool get isSubmitting;
  String get workDuration;
  String get agreedPrice;
  Option<Either<JobJourneyFailure, Unit>> get sendingFailureOrSuccessOption;

  $SpSetsPriceeStateCopyWith<SpSetsPriceeState> get copyWith;
}

abstract class $SpSetsPriceeStateCopyWith<$Res> {
  factory $SpSetsPriceeStateCopyWith(
          SpSetsPriceeState value, $Res Function(SpSetsPriceeState) then) =
      _$SpSetsPriceeStateCopyWithImpl<$Res>;
  $Res call(
      {String rating,
      bool isSubmitting,
      String workDuration,
      String agreedPrice,
      Option<Either<JobJourneyFailure, Unit>> sendingFailureOrSuccessOption});
}

class _$SpSetsPriceeStateCopyWithImpl<$Res>
    implements $SpSetsPriceeStateCopyWith<$Res> {
  _$SpSetsPriceeStateCopyWithImpl(this._value, this._then);

  final SpSetsPriceeState _value;
  // ignore: unused_field
  final $Res Function(SpSetsPriceeState) _then;

  @override
  $Res call({
    Object rating = freezed,
    Object isSubmitting = freezed,
    Object workDuration = freezed,
    Object agreedPrice = freezed,
    Object sendingFailureOrSuccessOption = freezed,
  }) {
    return _then(_value.copyWith(
      rating: rating == freezed ? _value.rating : rating as String,
      isSubmitting:
          isSubmitting == freezed ? _value.isSubmitting : isSubmitting as bool,
      workDuration: workDuration == freezed
          ? _value.workDuration
          : workDuration as String,
      agreedPrice:
          agreedPrice == freezed ? _value.agreedPrice : agreedPrice as String,
      sendingFailureOrSuccessOption: sendingFailureOrSuccessOption == freezed
          ? _value.sendingFailureOrSuccessOption
          : sendingFailureOrSuccessOption
              as Option<Either<JobJourneyFailure, Unit>>,
    ));
  }
}

abstract class _$SpSetsPriceeStateCopyWith<$Res>
    implements $SpSetsPriceeStateCopyWith<$Res> {
  factory _$SpSetsPriceeStateCopyWith(
          _SpSetsPriceeState value, $Res Function(_SpSetsPriceeState) then) =
      __$SpSetsPriceeStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String rating,
      bool isSubmitting,
      String workDuration,
      String agreedPrice,
      Option<Either<JobJourneyFailure, Unit>> sendingFailureOrSuccessOption});
}

class __$SpSetsPriceeStateCopyWithImpl<$Res>
    extends _$SpSetsPriceeStateCopyWithImpl<$Res>
    implements _$SpSetsPriceeStateCopyWith<$Res> {
  __$SpSetsPriceeStateCopyWithImpl(
      _SpSetsPriceeState _value, $Res Function(_SpSetsPriceeState) _then)
      : super(_value, (v) => _then(v as _SpSetsPriceeState));

  @override
  _SpSetsPriceeState get _value => super._value as _SpSetsPriceeState;

  @override
  $Res call({
    Object rating = freezed,
    Object isSubmitting = freezed,
    Object workDuration = freezed,
    Object agreedPrice = freezed,
    Object sendingFailureOrSuccessOption = freezed,
  }) {
    return _then(_SpSetsPriceeState(
      rating: rating == freezed ? _value.rating : rating as String,
      isSubmitting:
          isSubmitting == freezed ? _value.isSubmitting : isSubmitting as bool,
      workDuration: workDuration == freezed
          ? _value.workDuration
          : workDuration as String,
      agreedPrice:
          agreedPrice == freezed ? _value.agreedPrice : agreedPrice as String,
      sendingFailureOrSuccessOption: sendingFailureOrSuccessOption == freezed
          ? _value.sendingFailureOrSuccessOption
          : sendingFailureOrSuccessOption
              as Option<Either<JobJourneyFailure, Unit>>,
    ));
  }
}

class _$_SpSetsPriceeState implements _SpSetsPriceeState {
  const _$_SpSetsPriceeState(
      {this.rating,
      this.isSubmitting,
      this.workDuration,
      this.agreedPrice,
      this.sendingFailureOrSuccessOption});

  @override
  final String rating;
  @override
  final bool isSubmitting;
  @override
  final String workDuration;
  @override
  final String agreedPrice;
  @override
  final Option<Either<JobJourneyFailure, Unit>> sendingFailureOrSuccessOption;

  @override
  String toString() {
    return 'SpSetsPriceeState(rating: $rating, isSubmitting: $isSubmitting, workDuration: $workDuration, agreedPrice: $agreedPrice, sendingFailureOrSuccessOption: $sendingFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SpSetsPriceeState &&
            (identical(other.rating, rating) ||
                const DeepCollectionEquality().equals(other.rating, rating)) &&
            (identical(other.isSubmitting, isSubmitting) ||
                const DeepCollectionEquality()
                    .equals(other.isSubmitting, isSubmitting)) &&
            (identical(other.workDuration, workDuration) ||
                const DeepCollectionEquality()
                    .equals(other.workDuration, workDuration)) &&
            (identical(other.agreedPrice, agreedPrice) ||
                const DeepCollectionEquality()
                    .equals(other.agreedPrice, agreedPrice)) &&
            (identical(other.sendingFailureOrSuccessOption,
                    sendingFailureOrSuccessOption) ||
                const DeepCollectionEquality().equals(
                    other.sendingFailureOrSuccessOption,
                    sendingFailureOrSuccessOption)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(rating) ^
      const DeepCollectionEquality().hash(isSubmitting) ^
      const DeepCollectionEquality().hash(workDuration) ^
      const DeepCollectionEquality().hash(agreedPrice) ^
      const DeepCollectionEquality().hash(sendingFailureOrSuccessOption);

  @override
  _$SpSetsPriceeStateCopyWith<_SpSetsPriceeState> get copyWith =>
      __$SpSetsPriceeStateCopyWithImpl<_SpSetsPriceeState>(this, _$identity);
}

abstract class _SpSetsPriceeState implements SpSetsPriceeState {
  const factory _SpSetsPriceeState(
      {String rating,
      bool isSubmitting,
      String workDuration,
      String agreedPrice,
      Option<Either<JobJourneyFailure, Unit>>
          sendingFailureOrSuccessOption}) = _$_SpSetsPriceeState;

  @override
  String get rating;
  @override
  bool get isSubmitting;
  @override
  String get workDuration;
  @override
  String get agreedPrice;
  @override
  Option<Either<JobJourneyFailure, Unit>> get sendingFailureOrSuccessOption;
  @override
  _$SpSetsPriceeStateCopyWith<_SpSetsPriceeState> get copyWith;
}
