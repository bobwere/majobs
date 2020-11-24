// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'client_approves_work_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$ClientApprovesWorkStateTearOff {
  const _$ClientApprovesWorkStateTearOff();

// ignore: unused_element
  _ClientApprovesWorkState call(
      {bool isSubmitting,
      String reason,
      Option<Either<JobJourneyFailure, Unit>> sendingFailureOrSuccessOption}) {
    return _ClientApprovesWorkState(
      isSubmitting: isSubmitting,
      reason: reason,
      sendingFailureOrSuccessOption: sendingFailureOrSuccessOption,
    );
  }
}

// ignore: unused_element
const $ClientApprovesWorkState = _$ClientApprovesWorkStateTearOff();

mixin _$ClientApprovesWorkState {
  bool get isSubmitting;
  String get reason;
  Option<Either<JobJourneyFailure, Unit>> get sendingFailureOrSuccessOption;

  $ClientApprovesWorkStateCopyWith<ClientApprovesWorkState> get copyWith;
}

abstract class $ClientApprovesWorkStateCopyWith<$Res> {
  factory $ClientApprovesWorkStateCopyWith(ClientApprovesWorkState value,
          $Res Function(ClientApprovesWorkState) then) =
      _$ClientApprovesWorkStateCopyWithImpl<$Res>;
  $Res call(
      {bool isSubmitting,
      String reason,
      Option<Either<JobJourneyFailure, Unit>> sendingFailureOrSuccessOption});
}

class _$ClientApprovesWorkStateCopyWithImpl<$Res>
    implements $ClientApprovesWorkStateCopyWith<$Res> {
  _$ClientApprovesWorkStateCopyWithImpl(this._value, this._then);

  final ClientApprovesWorkState _value;
  // ignore: unused_field
  final $Res Function(ClientApprovesWorkState) _then;

  @override
  $Res call({
    Object isSubmitting = freezed,
    Object reason = freezed,
    Object sendingFailureOrSuccessOption = freezed,
  }) {
    return _then(_value.copyWith(
      isSubmitting:
          isSubmitting == freezed ? _value.isSubmitting : isSubmitting as bool,
      reason: reason == freezed ? _value.reason : reason as String,
      sendingFailureOrSuccessOption: sendingFailureOrSuccessOption == freezed
          ? _value.sendingFailureOrSuccessOption
          : sendingFailureOrSuccessOption
              as Option<Either<JobJourneyFailure, Unit>>,
    ));
  }
}

abstract class _$ClientApprovesWorkStateCopyWith<$Res>
    implements $ClientApprovesWorkStateCopyWith<$Res> {
  factory _$ClientApprovesWorkStateCopyWith(_ClientApprovesWorkState value,
          $Res Function(_ClientApprovesWorkState) then) =
      __$ClientApprovesWorkStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isSubmitting,
      String reason,
      Option<Either<JobJourneyFailure, Unit>> sendingFailureOrSuccessOption});
}

class __$ClientApprovesWorkStateCopyWithImpl<$Res>
    extends _$ClientApprovesWorkStateCopyWithImpl<$Res>
    implements _$ClientApprovesWorkStateCopyWith<$Res> {
  __$ClientApprovesWorkStateCopyWithImpl(_ClientApprovesWorkState _value,
      $Res Function(_ClientApprovesWorkState) _then)
      : super(_value, (v) => _then(v as _ClientApprovesWorkState));

  @override
  _ClientApprovesWorkState get _value =>
      super._value as _ClientApprovesWorkState;

  @override
  $Res call({
    Object isSubmitting = freezed,
    Object reason = freezed,
    Object sendingFailureOrSuccessOption = freezed,
  }) {
    return _then(_ClientApprovesWorkState(
      isSubmitting:
          isSubmitting == freezed ? _value.isSubmitting : isSubmitting as bool,
      reason: reason == freezed ? _value.reason : reason as String,
      sendingFailureOrSuccessOption: sendingFailureOrSuccessOption == freezed
          ? _value.sendingFailureOrSuccessOption
          : sendingFailureOrSuccessOption
              as Option<Either<JobJourneyFailure, Unit>>,
    ));
  }
}

class _$_ClientApprovesWorkState implements _ClientApprovesWorkState {
  const _$_ClientApprovesWorkState(
      {this.isSubmitting, this.reason, this.sendingFailureOrSuccessOption});

  @override
  final bool isSubmitting;
  @override
  final String reason;
  @override
  final Option<Either<JobJourneyFailure, Unit>> sendingFailureOrSuccessOption;

  @override
  String toString() {
    return 'ClientApprovesWorkState(isSubmitting: $isSubmitting, reason: $reason, sendingFailureOrSuccessOption: $sendingFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ClientApprovesWorkState &&
            (identical(other.isSubmitting, isSubmitting) ||
                const DeepCollectionEquality()
                    .equals(other.isSubmitting, isSubmitting)) &&
            (identical(other.reason, reason) ||
                const DeepCollectionEquality().equals(other.reason, reason)) &&
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
      const DeepCollectionEquality().hash(reason) ^
      const DeepCollectionEquality().hash(sendingFailureOrSuccessOption);

  @override
  _$ClientApprovesWorkStateCopyWith<_ClientApprovesWorkState> get copyWith =>
      __$ClientApprovesWorkStateCopyWithImpl<_ClientApprovesWorkState>(
          this, _$identity);
}

abstract class _ClientApprovesWorkState implements ClientApprovesWorkState {
  const factory _ClientApprovesWorkState(
      {bool isSubmitting,
      String reason,
      Option<Either<JobJourneyFailure, Unit>>
          sendingFailureOrSuccessOption}) = _$_ClientApprovesWorkState;

  @override
  bool get isSubmitting;
  @override
  String get reason;
  @override
  Option<Either<JobJourneyFailure, Unit>> get sendingFailureOrSuccessOption;
  @override
  _$ClientApprovesWorkStateCopyWith<_ClientApprovesWorkState> get copyWith;
}
