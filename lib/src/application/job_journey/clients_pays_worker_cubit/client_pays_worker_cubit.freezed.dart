// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'client_pays_worker_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$ClientPaysWorkerStateTearOff {
  const _$ClientPaysWorkerStateTearOff();

// ignore: unused_element
  _ClientPaysWorkerState call(
      {bool isSubmitting,
      Option<Either<JobJourneyFailure, Unit>> sendingFailureOrSuccessOption}) {
    return _ClientPaysWorkerState(
      isSubmitting: isSubmitting,
      sendingFailureOrSuccessOption: sendingFailureOrSuccessOption,
    );
  }
}

// ignore: unused_element
const $ClientPaysWorkerState = _$ClientPaysWorkerStateTearOff();

mixin _$ClientPaysWorkerState {
  bool get isSubmitting;
  Option<Either<JobJourneyFailure, Unit>> get sendingFailureOrSuccessOption;

  $ClientPaysWorkerStateCopyWith<ClientPaysWorkerState> get copyWith;
}

abstract class $ClientPaysWorkerStateCopyWith<$Res> {
  factory $ClientPaysWorkerStateCopyWith(ClientPaysWorkerState value,
          $Res Function(ClientPaysWorkerState) then) =
      _$ClientPaysWorkerStateCopyWithImpl<$Res>;
  $Res call(
      {bool isSubmitting,
      Option<Either<JobJourneyFailure, Unit>> sendingFailureOrSuccessOption});
}

class _$ClientPaysWorkerStateCopyWithImpl<$Res>
    implements $ClientPaysWorkerStateCopyWith<$Res> {
  _$ClientPaysWorkerStateCopyWithImpl(this._value, this._then);

  final ClientPaysWorkerState _value;
  // ignore: unused_field
  final $Res Function(ClientPaysWorkerState) _then;

  @override
  $Res call({
    Object isSubmitting = freezed,
    Object sendingFailureOrSuccessOption = freezed,
  }) {
    return _then(_value.copyWith(
      isSubmitting:
          isSubmitting == freezed ? _value.isSubmitting : isSubmitting as bool,
      sendingFailureOrSuccessOption: sendingFailureOrSuccessOption == freezed
          ? _value.sendingFailureOrSuccessOption
          : sendingFailureOrSuccessOption
              as Option<Either<JobJourneyFailure, Unit>>,
    ));
  }
}

abstract class _$ClientPaysWorkerStateCopyWith<$Res>
    implements $ClientPaysWorkerStateCopyWith<$Res> {
  factory _$ClientPaysWorkerStateCopyWith(_ClientPaysWorkerState value,
          $Res Function(_ClientPaysWorkerState) then) =
      __$ClientPaysWorkerStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isSubmitting,
      Option<Either<JobJourneyFailure, Unit>> sendingFailureOrSuccessOption});
}

class __$ClientPaysWorkerStateCopyWithImpl<$Res>
    extends _$ClientPaysWorkerStateCopyWithImpl<$Res>
    implements _$ClientPaysWorkerStateCopyWith<$Res> {
  __$ClientPaysWorkerStateCopyWithImpl(_ClientPaysWorkerState _value,
      $Res Function(_ClientPaysWorkerState) _then)
      : super(_value, (v) => _then(v as _ClientPaysWorkerState));

  @override
  _ClientPaysWorkerState get _value => super._value as _ClientPaysWorkerState;

  @override
  $Res call({
    Object isSubmitting = freezed,
    Object sendingFailureOrSuccessOption = freezed,
  }) {
    return _then(_ClientPaysWorkerState(
      isSubmitting:
          isSubmitting == freezed ? _value.isSubmitting : isSubmitting as bool,
      sendingFailureOrSuccessOption: sendingFailureOrSuccessOption == freezed
          ? _value.sendingFailureOrSuccessOption
          : sendingFailureOrSuccessOption
              as Option<Either<JobJourneyFailure, Unit>>,
    ));
  }
}

class _$_ClientPaysWorkerState implements _ClientPaysWorkerState {
  const _$_ClientPaysWorkerState(
      {this.isSubmitting, this.sendingFailureOrSuccessOption});

  @override
  final bool isSubmitting;
  @override
  final Option<Either<JobJourneyFailure, Unit>> sendingFailureOrSuccessOption;

  @override
  String toString() {
    return 'ClientPaysWorkerState(isSubmitting: $isSubmitting, sendingFailureOrSuccessOption: $sendingFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ClientPaysWorkerState &&
            (identical(other.isSubmitting, isSubmitting) ||
                const DeepCollectionEquality()
                    .equals(other.isSubmitting, isSubmitting)) &&
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
      const DeepCollectionEquality().hash(sendingFailureOrSuccessOption);

  @override
  _$ClientPaysWorkerStateCopyWith<_ClientPaysWorkerState> get copyWith =>
      __$ClientPaysWorkerStateCopyWithImpl<_ClientPaysWorkerState>(
          this, _$identity);
}

abstract class _ClientPaysWorkerState implements ClientPaysWorkerState {
  const factory _ClientPaysWorkerState(
      {bool isSubmitting,
      Option<Either<JobJourneyFailure, Unit>>
          sendingFailureOrSuccessOption}) = _$_ClientPaysWorkerState;

  @override
  bool get isSubmitting;
  @override
  Option<Either<JobJourneyFailure, Unit>> get sendingFailureOrSuccessOption;
  @override
  _$ClientPaysWorkerStateCopyWith<_ClientPaysWorkerState> get copyWith;
}
