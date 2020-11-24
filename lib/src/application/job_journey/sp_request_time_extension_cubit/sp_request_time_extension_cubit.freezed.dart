// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'sp_request_time_extension_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$SpRequestTimeExtensionStateTearOff {
  const _$SpRequestTimeExtensionStateTearOff();

// ignore: unused_element
  _SpRequestTimeExtensionState call(
      {bool isSubmitting,
      String workDuration,
      Option<Either<JobJourneyFailure, Unit>> sendingFailureOrSuccessOption}) {
    return _SpRequestTimeExtensionState(
      isSubmitting: isSubmitting,
      workDuration: workDuration,
      sendingFailureOrSuccessOption: sendingFailureOrSuccessOption,
    );
  }
}

// ignore: unused_element
const $SpRequestTimeExtensionState = _$SpRequestTimeExtensionStateTearOff();

mixin _$SpRequestTimeExtensionState {
  bool get isSubmitting;
  String get workDuration;
  Option<Either<JobJourneyFailure, Unit>> get sendingFailureOrSuccessOption;

  $SpRequestTimeExtensionStateCopyWith<SpRequestTimeExtensionState>
      get copyWith;
}

abstract class $SpRequestTimeExtensionStateCopyWith<$Res> {
  factory $SpRequestTimeExtensionStateCopyWith(
          SpRequestTimeExtensionState value,
          $Res Function(SpRequestTimeExtensionState) then) =
      _$SpRequestTimeExtensionStateCopyWithImpl<$Res>;
  $Res call(
      {bool isSubmitting,
      String workDuration,
      Option<Either<JobJourneyFailure, Unit>> sendingFailureOrSuccessOption});
}

class _$SpRequestTimeExtensionStateCopyWithImpl<$Res>
    implements $SpRequestTimeExtensionStateCopyWith<$Res> {
  _$SpRequestTimeExtensionStateCopyWithImpl(this._value, this._then);

  final SpRequestTimeExtensionState _value;
  // ignore: unused_field
  final $Res Function(SpRequestTimeExtensionState) _then;

  @override
  $Res call({
    Object isSubmitting = freezed,
    Object workDuration = freezed,
    Object sendingFailureOrSuccessOption = freezed,
  }) {
    return _then(_value.copyWith(
      isSubmitting:
          isSubmitting == freezed ? _value.isSubmitting : isSubmitting as bool,
      workDuration: workDuration == freezed
          ? _value.workDuration
          : workDuration as String,
      sendingFailureOrSuccessOption: sendingFailureOrSuccessOption == freezed
          ? _value.sendingFailureOrSuccessOption
          : sendingFailureOrSuccessOption
              as Option<Either<JobJourneyFailure, Unit>>,
    ));
  }
}

abstract class _$SpRequestTimeExtensionStateCopyWith<$Res>
    implements $SpRequestTimeExtensionStateCopyWith<$Res> {
  factory _$SpRequestTimeExtensionStateCopyWith(
          _SpRequestTimeExtensionState value,
          $Res Function(_SpRequestTimeExtensionState) then) =
      __$SpRequestTimeExtensionStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isSubmitting,
      String workDuration,
      Option<Either<JobJourneyFailure, Unit>> sendingFailureOrSuccessOption});
}

class __$SpRequestTimeExtensionStateCopyWithImpl<$Res>
    extends _$SpRequestTimeExtensionStateCopyWithImpl<$Res>
    implements _$SpRequestTimeExtensionStateCopyWith<$Res> {
  __$SpRequestTimeExtensionStateCopyWithImpl(
      _SpRequestTimeExtensionState _value,
      $Res Function(_SpRequestTimeExtensionState) _then)
      : super(_value, (v) => _then(v as _SpRequestTimeExtensionState));

  @override
  _SpRequestTimeExtensionState get _value =>
      super._value as _SpRequestTimeExtensionState;

  @override
  $Res call({
    Object isSubmitting = freezed,
    Object workDuration = freezed,
    Object sendingFailureOrSuccessOption = freezed,
  }) {
    return _then(_SpRequestTimeExtensionState(
      isSubmitting:
          isSubmitting == freezed ? _value.isSubmitting : isSubmitting as bool,
      workDuration: workDuration == freezed
          ? _value.workDuration
          : workDuration as String,
      sendingFailureOrSuccessOption: sendingFailureOrSuccessOption == freezed
          ? _value.sendingFailureOrSuccessOption
          : sendingFailureOrSuccessOption
              as Option<Either<JobJourneyFailure, Unit>>,
    ));
  }
}

class _$_SpRequestTimeExtensionState implements _SpRequestTimeExtensionState {
  const _$_SpRequestTimeExtensionState(
      {this.isSubmitting,
      this.workDuration,
      this.sendingFailureOrSuccessOption});

  @override
  final bool isSubmitting;
  @override
  final String workDuration;
  @override
  final Option<Either<JobJourneyFailure, Unit>> sendingFailureOrSuccessOption;

  @override
  String toString() {
    return 'SpRequestTimeExtensionState(isSubmitting: $isSubmitting, workDuration: $workDuration, sendingFailureOrSuccessOption: $sendingFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SpRequestTimeExtensionState &&
            (identical(other.isSubmitting, isSubmitting) ||
                const DeepCollectionEquality()
                    .equals(other.isSubmitting, isSubmitting)) &&
            (identical(other.workDuration, workDuration) ||
                const DeepCollectionEquality()
                    .equals(other.workDuration, workDuration)) &&
            (identical(other.sendingFailureOrSuccessOption,
                    sendingFailureOrSuccessOption) ||
                const DeepCollectionEquality().equals(
                    other.sendingFailureOrSuccessOption,
                    sendingFailureOrSuccessOption)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isSubmitting) ^
      const DeepCollectionEquality().hash(workDuration) ^
      const DeepCollectionEquality().hash(sendingFailureOrSuccessOption);

  @override
  _$SpRequestTimeExtensionStateCopyWith<_SpRequestTimeExtensionState>
      get copyWith => __$SpRequestTimeExtensionStateCopyWithImpl<
          _SpRequestTimeExtensionState>(this, _$identity);
}

abstract class _SpRequestTimeExtensionState
    implements SpRequestTimeExtensionState {
  const factory _SpRequestTimeExtensionState(
      {bool isSubmitting,
      String workDuration,
      Option<Either<JobJourneyFailure, Unit>>
          sendingFailureOrSuccessOption}) = _$_SpRequestTimeExtensionState;

  @override
  bool get isSubmitting;
  @override
  String get workDuration;
  @override
  Option<Either<JobJourneyFailure, Unit>> get sendingFailureOrSuccessOption;
  @override
  _$SpRequestTimeExtensionStateCopyWith<_SpRequestTimeExtensionState>
      get copyWith;
}
