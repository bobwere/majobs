// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'sp_job_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$SPJobStateTearOff {
  const _$SPJobStateTearOff();

// ignore: unused_element
  Initial initial() {
    return const Initial();
  }

// ignore: unused_element
  JobStatus jobStatus(int spNewJobs, int spPendingJobs, int spRejectedJobs,
      int spInProgressJobs, int spUnpaidJobs, int spPaidJobs, int spBalance) {
    return JobStatus(
      spNewJobs,
      spPendingJobs,
      spRejectedJobs,
      spInProgressJobs,
      spUnpaidJobs,
      spPaidJobs,
      spBalance,
    );
  }

// ignore: unused_element
  NewJob newJob(SpNewJobs spNewJobs, String userID) {
    return NewJob(
      spNewJobs,
      userID,
    );
  }

// ignore: unused_element
  Pending pending(SpPendingJobs spPendingJobs, String userID) {
    return Pending(
      spPendingJobs,
      userID,
    );
  }

// ignore: unused_element
  Rejected rejected(SpRejectedJobs spRejectedJobs, String userID) {
    return Rejected(
      spRejectedJobs,
      userID,
    );
  }

// ignore: unused_element
  InProgress inProgress(SpInProgressJobs spInProgressJobs, String userID) {
    return InProgress(
      spInProgressJobs,
      userID,
    );
  }

// ignore: unused_element
  Unpaid unpaid(SpUnpaidJobs spUnpaidJobs, String userID) {
    return Unpaid(
      spUnpaidJobs,
      userID,
    );
  }

// ignore: unused_element
  Paid paid(SpPaidJobs spPaidJobs, String userID) {
    return Paid(
      spPaidJobs,
      userID,
    );
  }

// ignore: unused_element
  Loading loading() {
    return const Loading();
  }

// ignore: unused_element
  Error error(SPDetailsFailure failure) {
    return Error(
      failure,
    );
  }
}

// ignore: unused_element
const $SPJobState = _$SPJobStateTearOff();

mixin _$SPJobState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required
        Result jobStatus(
            int spNewJobs,
            int spPendingJobs,
            int spRejectedJobs,
            int spInProgressJobs,
            int spUnpaidJobs,
            int spPaidJobs,
            int spBalance),
    @required Result newJob(SpNewJobs spNewJobs, String userID),
    @required Result pending(SpPendingJobs spPendingJobs, String userID),
    @required Result rejected(SpRejectedJobs spRejectedJobs, String userID),
    @required
        Result inProgress(SpInProgressJobs spInProgressJobs, String userID),
    @required Result unpaid(SpUnpaidJobs spUnpaidJobs, String userID),
    @required Result paid(SpPaidJobs spPaidJobs, String userID),
    @required Result loading(),
    @required Result error(SPDetailsFailure failure),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result jobStatus(int spNewJobs, int spPendingJobs, int spRejectedJobs,
        int spInProgressJobs, int spUnpaidJobs, int spPaidJobs, int spBalance),
    Result newJob(SpNewJobs spNewJobs, String userID),
    Result pending(SpPendingJobs spPendingJobs, String userID),
    Result rejected(SpRejectedJobs spRejectedJobs, String userID),
    Result inProgress(SpInProgressJobs spInProgressJobs, String userID),
    Result unpaid(SpUnpaidJobs spUnpaidJobs, String userID),
    Result paid(SpPaidJobs spPaidJobs, String userID),
    Result loading(),
    Result error(SPDetailsFailure failure),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(Initial value),
    @required Result jobStatus(JobStatus value),
    @required Result newJob(NewJob value),
    @required Result pending(Pending value),
    @required Result rejected(Rejected value),
    @required Result inProgress(InProgress value),
    @required Result unpaid(Unpaid value),
    @required Result paid(Paid value),
    @required Result loading(Loading value),
    @required Result error(Error value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(Initial value),
    Result jobStatus(JobStatus value),
    Result newJob(NewJob value),
    Result pending(Pending value),
    Result rejected(Rejected value),
    Result inProgress(InProgress value),
    Result unpaid(Unpaid value),
    Result paid(Paid value),
    Result loading(Loading value),
    Result error(Error value),
    @required Result orElse(),
  });
}

abstract class $SPJobStateCopyWith<$Res> {
  factory $SPJobStateCopyWith(
          SPJobState value, $Res Function(SPJobState) then) =
      _$SPJobStateCopyWithImpl<$Res>;
}

class _$SPJobStateCopyWithImpl<$Res> implements $SPJobStateCopyWith<$Res> {
  _$SPJobStateCopyWithImpl(this._value, this._then);

  final SPJobState _value;
  // ignore: unused_field
  final $Res Function(SPJobState) _then;
}

abstract class $InitialCopyWith<$Res> {
  factory $InitialCopyWith(Initial value, $Res Function(Initial) then) =
      _$InitialCopyWithImpl<$Res>;
}

class _$InitialCopyWithImpl<$Res> extends _$SPJobStateCopyWithImpl<$Res>
    implements $InitialCopyWith<$Res> {
  _$InitialCopyWithImpl(Initial _value, $Res Function(Initial) _then)
      : super(_value, (v) => _then(v as Initial));

  @override
  Initial get _value => super._value as Initial;
}

class _$Initial implements Initial {
  const _$Initial();

  @override
  String toString() {
    return 'SPJobState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required
        Result jobStatus(
            int spNewJobs,
            int spPendingJobs,
            int spRejectedJobs,
            int spInProgressJobs,
            int spUnpaidJobs,
            int spPaidJobs,
            int spBalance),
    @required Result newJob(SpNewJobs spNewJobs, String userID),
    @required Result pending(SpPendingJobs spPendingJobs, String userID),
    @required Result rejected(SpRejectedJobs spRejectedJobs, String userID),
    @required
        Result inProgress(SpInProgressJobs spInProgressJobs, String userID),
    @required Result unpaid(SpUnpaidJobs spUnpaidJobs, String userID),
    @required Result paid(SpPaidJobs spPaidJobs, String userID),
    @required Result loading(),
    @required Result error(SPDetailsFailure failure),
  }) {
    assert(initial != null);
    assert(jobStatus != null);
    assert(newJob != null);
    assert(pending != null);
    assert(rejected != null);
    assert(inProgress != null);
    assert(unpaid != null);
    assert(paid != null);
    assert(loading != null);
    assert(error != null);
    return initial();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result jobStatus(int spNewJobs, int spPendingJobs, int spRejectedJobs,
        int spInProgressJobs, int spUnpaidJobs, int spPaidJobs, int spBalance),
    Result newJob(SpNewJobs spNewJobs, String userID),
    Result pending(SpPendingJobs spPendingJobs, String userID),
    Result rejected(SpRejectedJobs spRejectedJobs, String userID),
    Result inProgress(SpInProgressJobs spInProgressJobs, String userID),
    Result unpaid(SpUnpaidJobs spUnpaidJobs, String userID),
    Result paid(SpPaidJobs spPaidJobs, String userID),
    Result loading(),
    Result error(SPDetailsFailure failure),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(Initial value),
    @required Result jobStatus(JobStatus value),
    @required Result newJob(NewJob value),
    @required Result pending(Pending value),
    @required Result rejected(Rejected value),
    @required Result inProgress(InProgress value),
    @required Result unpaid(Unpaid value),
    @required Result paid(Paid value),
    @required Result loading(Loading value),
    @required Result error(Error value),
  }) {
    assert(initial != null);
    assert(jobStatus != null);
    assert(newJob != null);
    assert(pending != null);
    assert(rejected != null);
    assert(inProgress != null);
    assert(unpaid != null);
    assert(paid != null);
    assert(loading != null);
    assert(error != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(Initial value),
    Result jobStatus(JobStatus value),
    Result newJob(NewJob value),
    Result pending(Pending value),
    Result rejected(Rejected value),
    Result inProgress(InProgress value),
    Result unpaid(Unpaid value),
    Result paid(Paid value),
    Result loading(Loading value),
    Result error(Error value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements SPJobState {
  const factory Initial() = _$Initial;
}

abstract class $JobStatusCopyWith<$Res> {
  factory $JobStatusCopyWith(JobStatus value, $Res Function(JobStatus) then) =
      _$JobStatusCopyWithImpl<$Res>;
  $Res call(
      {int spNewJobs,
      int spPendingJobs,
      int spRejectedJobs,
      int spInProgressJobs,
      int spUnpaidJobs,
      int spPaidJobs,
      int spBalance});
}

class _$JobStatusCopyWithImpl<$Res> extends _$SPJobStateCopyWithImpl<$Res>
    implements $JobStatusCopyWith<$Res> {
  _$JobStatusCopyWithImpl(JobStatus _value, $Res Function(JobStatus) _then)
      : super(_value, (v) => _then(v as JobStatus));

  @override
  JobStatus get _value => super._value as JobStatus;

  @override
  $Res call({
    Object spNewJobs = freezed,
    Object spPendingJobs = freezed,
    Object spRejectedJobs = freezed,
    Object spInProgressJobs = freezed,
    Object spUnpaidJobs = freezed,
    Object spPaidJobs = freezed,
    Object spBalance = freezed,
  }) {
    return _then(JobStatus(
      spNewJobs == freezed ? _value.spNewJobs : spNewJobs as int,
      spPendingJobs == freezed ? _value.spPendingJobs : spPendingJobs as int,
      spRejectedJobs == freezed ? _value.spRejectedJobs : spRejectedJobs as int,
      spInProgressJobs == freezed
          ? _value.spInProgressJobs
          : spInProgressJobs as int,
      spUnpaidJobs == freezed ? _value.spUnpaidJobs : spUnpaidJobs as int,
      spPaidJobs == freezed ? _value.spPaidJobs : spPaidJobs as int,
      spBalance == freezed ? _value.spBalance : spBalance as int,
    ));
  }
}

class _$JobStatus implements JobStatus {
  const _$JobStatus(this.spNewJobs, this.spPendingJobs, this.spRejectedJobs,
      this.spInProgressJobs, this.spUnpaidJobs, this.spPaidJobs, this.spBalance)
      : assert(spNewJobs != null),
        assert(spPendingJobs != null),
        assert(spRejectedJobs != null),
        assert(spInProgressJobs != null),
        assert(spUnpaidJobs != null),
        assert(spPaidJobs != null),
        assert(spBalance != null);

  @override
  final int spNewJobs;
  @override
  final int spPendingJobs;
  @override
  final int spRejectedJobs;
  @override
  final int spInProgressJobs;
  @override
  final int spUnpaidJobs;
  @override
  final int spPaidJobs;
  @override
  final int spBalance;

  @override
  String toString() {
    return 'SPJobState.jobStatus(spNewJobs: $spNewJobs, spPendingJobs: $spPendingJobs, spRejectedJobs: $spRejectedJobs, spInProgressJobs: $spInProgressJobs, spUnpaidJobs: $spUnpaidJobs, spPaidJobs: $spPaidJobs, spBalance: $spBalance)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is JobStatus &&
            (identical(other.spNewJobs, spNewJobs) ||
                const DeepCollectionEquality()
                    .equals(other.spNewJobs, spNewJobs)) &&
            (identical(other.spPendingJobs, spPendingJobs) ||
                const DeepCollectionEquality()
                    .equals(other.spPendingJobs, spPendingJobs)) &&
            (identical(other.spRejectedJobs, spRejectedJobs) ||
                const DeepCollectionEquality()
                    .equals(other.spRejectedJobs, spRejectedJobs)) &&
            (identical(other.spInProgressJobs, spInProgressJobs) ||
                const DeepCollectionEquality()
                    .equals(other.spInProgressJobs, spInProgressJobs)) &&
            (identical(other.spUnpaidJobs, spUnpaidJobs) ||
                const DeepCollectionEquality()
                    .equals(other.spUnpaidJobs, spUnpaidJobs)) &&
            (identical(other.spPaidJobs, spPaidJobs) ||
                const DeepCollectionEquality()
                    .equals(other.spPaidJobs, spPaidJobs)) &&
            (identical(other.spBalance, spBalance) ||
                const DeepCollectionEquality()
                    .equals(other.spBalance, spBalance)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(spNewJobs) ^
      const DeepCollectionEquality().hash(spPendingJobs) ^
      const DeepCollectionEquality().hash(spRejectedJobs) ^
      const DeepCollectionEquality().hash(spInProgressJobs) ^
      const DeepCollectionEquality().hash(spUnpaidJobs) ^
      const DeepCollectionEquality().hash(spPaidJobs) ^
      const DeepCollectionEquality().hash(spBalance);

  @override
  $JobStatusCopyWith<JobStatus> get copyWith =>
      _$JobStatusCopyWithImpl<JobStatus>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required
        Result jobStatus(
            int spNewJobs,
            int spPendingJobs,
            int spRejectedJobs,
            int spInProgressJobs,
            int spUnpaidJobs,
            int spPaidJobs,
            int spBalance),
    @required Result newJob(SpNewJobs spNewJobs, String userID),
    @required Result pending(SpPendingJobs spPendingJobs, String userID),
    @required Result rejected(SpRejectedJobs spRejectedJobs, String userID),
    @required
        Result inProgress(SpInProgressJobs spInProgressJobs, String userID),
    @required Result unpaid(SpUnpaidJobs spUnpaidJobs, String userID),
    @required Result paid(SpPaidJobs spPaidJobs, String userID),
    @required Result loading(),
    @required Result error(SPDetailsFailure failure),
  }) {
    assert(initial != null);
    assert(jobStatus != null);
    assert(newJob != null);
    assert(pending != null);
    assert(rejected != null);
    assert(inProgress != null);
    assert(unpaid != null);
    assert(paid != null);
    assert(loading != null);
    assert(error != null);
    return jobStatus(spNewJobs, spPendingJobs, spRejectedJobs, spInProgressJobs,
        spUnpaidJobs, spPaidJobs, spBalance);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result jobStatus(int spNewJobs, int spPendingJobs, int spRejectedJobs,
        int spInProgressJobs, int spUnpaidJobs, int spPaidJobs, int spBalance),
    Result newJob(SpNewJobs spNewJobs, String userID),
    Result pending(SpPendingJobs spPendingJobs, String userID),
    Result rejected(SpRejectedJobs spRejectedJobs, String userID),
    Result inProgress(SpInProgressJobs spInProgressJobs, String userID),
    Result unpaid(SpUnpaidJobs spUnpaidJobs, String userID),
    Result paid(SpPaidJobs spPaidJobs, String userID),
    Result loading(),
    Result error(SPDetailsFailure failure),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (jobStatus != null) {
      return jobStatus(spNewJobs, spPendingJobs, spRejectedJobs,
          spInProgressJobs, spUnpaidJobs, spPaidJobs, spBalance);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(Initial value),
    @required Result jobStatus(JobStatus value),
    @required Result newJob(NewJob value),
    @required Result pending(Pending value),
    @required Result rejected(Rejected value),
    @required Result inProgress(InProgress value),
    @required Result unpaid(Unpaid value),
    @required Result paid(Paid value),
    @required Result loading(Loading value),
    @required Result error(Error value),
  }) {
    assert(initial != null);
    assert(jobStatus != null);
    assert(newJob != null);
    assert(pending != null);
    assert(rejected != null);
    assert(inProgress != null);
    assert(unpaid != null);
    assert(paid != null);
    assert(loading != null);
    assert(error != null);
    return jobStatus(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(Initial value),
    Result jobStatus(JobStatus value),
    Result newJob(NewJob value),
    Result pending(Pending value),
    Result rejected(Rejected value),
    Result inProgress(InProgress value),
    Result unpaid(Unpaid value),
    Result paid(Paid value),
    Result loading(Loading value),
    Result error(Error value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (jobStatus != null) {
      return jobStatus(this);
    }
    return orElse();
  }
}

abstract class JobStatus implements SPJobState {
  const factory JobStatus(
      int spNewJobs,
      int spPendingJobs,
      int spRejectedJobs,
      int spInProgressJobs,
      int spUnpaidJobs,
      int spPaidJobs,
      int spBalance) = _$JobStatus;

  int get spNewJobs;
  int get spPendingJobs;
  int get spRejectedJobs;
  int get spInProgressJobs;
  int get spUnpaidJobs;
  int get spPaidJobs;
  int get spBalance;
  $JobStatusCopyWith<JobStatus> get copyWith;
}

abstract class $NewJobCopyWith<$Res> {
  factory $NewJobCopyWith(NewJob value, $Res Function(NewJob) then) =
      _$NewJobCopyWithImpl<$Res>;
  $Res call({SpNewJobs spNewJobs, String userID});
}

class _$NewJobCopyWithImpl<$Res> extends _$SPJobStateCopyWithImpl<$Res>
    implements $NewJobCopyWith<$Res> {
  _$NewJobCopyWithImpl(NewJob _value, $Res Function(NewJob) _then)
      : super(_value, (v) => _then(v as NewJob));

  @override
  NewJob get _value => super._value as NewJob;

  @override
  $Res call({
    Object spNewJobs = freezed,
    Object userID = freezed,
  }) {
    return _then(NewJob(
      spNewJobs == freezed ? _value.spNewJobs : spNewJobs as SpNewJobs,
      userID == freezed ? _value.userID : userID as String,
    ));
  }
}

class _$NewJob implements NewJob {
  const _$NewJob(this.spNewJobs, this.userID)
      : assert(spNewJobs != null),
        assert(userID != null);

  @override
  final SpNewJobs spNewJobs;
  @override
  final String userID;

  @override
  String toString() {
    return 'SPJobState.newJob(spNewJobs: $spNewJobs, userID: $userID)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is NewJob &&
            (identical(other.spNewJobs, spNewJobs) ||
                const DeepCollectionEquality()
                    .equals(other.spNewJobs, spNewJobs)) &&
            (identical(other.userID, userID) ||
                const DeepCollectionEquality().equals(other.userID, userID)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(spNewJobs) ^
      const DeepCollectionEquality().hash(userID);

  @override
  $NewJobCopyWith<NewJob> get copyWith =>
      _$NewJobCopyWithImpl<NewJob>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required
        Result jobStatus(
            int spNewJobs,
            int spPendingJobs,
            int spRejectedJobs,
            int spInProgressJobs,
            int spUnpaidJobs,
            int spPaidJobs,
            int spBalance),
    @required Result newJob(SpNewJobs spNewJobs, String userID),
    @required Result pending(SpPendingJobs spPendingJobs, String userID),
    @required Result rejected(SpRejectedJobs spRejectedJobs, String userID),
    @required
        Result inProgress(SpInProgressJobs spInProgressJobs, String userID),
    @required Result unpaid(SpUnpaidJobs spUnpaidJobs, String userID),
    @required Result paid(SpPaidJobs spPaidJobs, String userID),
    @required Result loading(),
    @required Result error(SPDetailsFailure failure),
  }) {
    assert(initial != null);
    assert(jobStatus != null);
    assert(newJob != null);
    assert(pending != null);
    assert(rejected != null);
    assert(inProgress != null);
    assert(unpaid != null);
    assert(paid != null);
    assert(loading != null);
    assert(error != null);
    return newJob(spNewJobs, userID);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result jobStatus(int spNewJobs, int spPendingJobs, int spRejectedJobs,
        int spInProgressJobs, int spUnpaidJobs, int spPaidJobs, int spBalance),
    Result newJob(SpNewJobs spNewJobs, String userID),
    Result pending(SpPendingJobs spPendingJobs, String userID),
    Result rejected(SpRejectedJobs spRejectedJobs, String userID),
    Result inProgress(SpInProgressJobs spInProgressJobs, String userID),
    Result unpaid(SpUnpaidJobs spUnpaidJobs, String userID),
    Result paid(SpPaidJobs spPaidJobs, String userID),
    Result loading(),
    Result error(SPDetailsFailure failure),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (newJob != null) {
      return newJob(spNewJobs, userID);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(Initial value),
    @required Result jobStatus(JobStatus value),
    @required Result newJob(NewJob value),
    @required Result pending(Pending value),
    @required Result rejected(Rejected value),
    @required Result inProgress(InProgress value),
    @required Result unpaid(Unpaid value),
    @required Result paid(Paid value),
    @required Result loading(Loading value),
    @required Result error(Error value),
  }) {
    assert(initial != null);
    assert(jobStatus != null);
    assert(newJob != null);
    assert(pending != null);
    assert(rejected != null);
    assert(inProgress != null);
    assert(unpaid != null);
    assert(paid != null);
    assert(loading != null);
    assert(error != null);
    return newJob(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(Initial value),
    Result jobStatus(JobStatus value),
    Result newJob(NewJob value),
    Result pending(Pending value),
    Result rejected(Rejected value),
    Result inProgress(InProgress value),
    Result unpaid(Unpaid value),
    Result paid(Paid value),
    Result loading(Loading value),
    Result error(Error value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (newJob != null) {
      return newJob(this);
    }
    return orElse();
  }
}

abstract class NewJob implements SPJobState {
  const factory NewJob(SpNewJobs spNewJobs, String userID) = _$NewJob;

  SpNewJobs get spNewJobs;
  String get userID;
  $NewJobCopyWith<NewJob> get copyWith;
}

abstract class $PendingCopyWith<$Res> {
  factory $PendingCopyWith(Pending value, $Res Function(Pending) then) =
      _$PendingCopyWithImpl<$Res>;
  $Res call({SpPendingJobs spPendingJobs, String userID});
}

class _$PendingCopyWithImpl<$Res> extends _$SPJobStateCopyWithImpl<$Res>
    implements $PendingCopyWith<$Res> {
  _$PendingCopyWithImpl(Pending _value, $Res Function(Pending) _then)
      : super(_value, (v) => _then(v as Pending));

  @override
  Pending get _value => super._value as Pending;

  @override
  $Res call({
    Object spPendingJobs = freezed,
    Object userID = freezed,
  }) {
    return _then(Pending(
      spPendingJobs == freezed
          ? _value.spPendingJobs
          : spPendingJobs as SpPendingJobs,
      userID == freezed ? _value.userID : userID as String,
    ));
  }
}

class _$Pending implements Pending {
  const _$Pending(this.spPendingJobs, this.userID)
      : assert(spPendingJobs != null),
        assert(userID != null);

  @override
  final SpPendingJobs spPendingJobs;
  @override
  final String userID;

  @override
  String toString() {
    return 'SPJobState.pending(spPendingJobs: $spPendingJobs, userID: $userID)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Pending &&
            (identical(other.spPendingJobs, spPendingJobs) ||
                const DeepCollectionEquality()
                    .equals(other.spPendingJobs, spPendingJobs)) &&
            (identical(other.userID, userID) ||
                const DeepCollectionEquality().equals(other.userID, userID)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(spPendingJobs) ^
      const DeepCollectionEquality().hash(userID);

  @override
  $PendingCopyWith<Pending> get copyWith =>
      _$PendingCopyWithImpl<Pending>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required
        Result jobStatus(
            int spNewJobs,
            int spPendingJobs,
            int spRejectedJobs,
            int spInProgressJobs,
            int spUnpaidJobs,
            int spPaidJobs,
            int spBalance),
    @required Result newJob(SpNewJobs spNewJobs, String userID),
    @required Result pending(SpPendingJobs spPendingJobs, String userID),
    @required Result rejected(SpRejectedJobs spRejectedJobs, String userID),
    @required
        Result inProgress(SpInProgressJobs spInProgressJobs, String userID),
    @required Result unpaid(SpUnpaidJobs spUnpaidJobs, String userID),
    @required Result paid(SpPaidJobs spPaidJobs, String userID),
    @required Result loading(),
    @required Result error(SPDetailsFailure failure),
  }) {
    assert(initial != null);
    assert(jobStatus != null);
    assert(newJob != null);
    assert(pending != null);
    assert(rejected != null);
    assert(inProgress != null);
    assert(unpaid != null);
    assert(paid != null);
    assert(loading != null);
    assert(error != null);
    return pending(spPendingJobs, userID);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result jobStatus(int spNewJobs, int spPendingJobs, int spRejectedJobs,
        int spInProgressJobs, int spUnpaidJobs, int spPaidJobs, int spBalance),
    Result newJob(SpNewJobs spNewJobs, String userID),
    Result pending(SpPendingJobs spPendingJobs, String userID),
    Result rejected(SpRejectedJobs spRejectedJobs, String userID),
    Result inProgress(SpInProgressJobs spInProgressJobs, String userID),
    Result unpaid(SpUnpaidJobs spUnpaidJobs, String userID),
    Result paid(SpPaidJobs spPaidJobs, String userID),
    Result loading(),
    Result error(SPDetailsFailure failure),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (pending != null) {
      return pending(spPendingJobs, userID);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(Initial value),
    @required Result jobStatus(JobStatus value),
    @required Result newJob(NewJob value),
    @required Result pending(Pending value),
    @required Result rejected(Rejected value),
    @required Result inProgress(InProgress value),
    @required Result unpaid(Unpaid value),
    @required Result paid(Paid value),
    @required Result loading(Loading value),
    @required Result error(Error value),
  }) {
    assert(initial != null);
    assert(jobStatus != null);
    assert(newJob != null);
    assert(pending != null);
    assert(rejected != null);
    assert(inProgress != null);
    assert(unpaid != null);
    assert(paid != null);
    assert(loading != null);
    assert(error != null);
    return pending(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(Initial value),
    Result jobStatus(JobStatus value),
    Result newJob(NewJob value),
    Result pending(Pending value),
    Result rejected(Rejected value),
    Result inProgress(InProgress value),
    Result unpaid(Unpaid value),
    Result paid(Paid value),
    Result loading(Loading value),
    Result error(Error value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (pending != null) {
      return pending(this);
    }
    return orElse();
  }
}

abstract class Pending implements SPJobState {
  const factory Pending(SpPendingJobs spPendingJobs, String userID) = _$Pending;

  SpPendingJobs get spPendingJobs;
  String get userID;
  $PendingCopyWith<Pending> get copyWith;
}

abstract class $RejectedCopyWith<$Res> {
  factory $RejectedCopyWith(Rejected value, $Res Function(Rejected) then) =
      _$RejectedCopyWithImpl<$Res>;
  $Res call({SpRejectedJobs spRejectedJobs, String userID});
}

class _$RejectedCopyWithImpl<$Res> extends _$SPJobStateCopyWithImpl<$Res>
    implements $RejectedCopyWith<$Res> {
  _$RejectedCopyWithImpl(Rejected _value, $Res Function(Rejected) _then)
      : super(_value, (v) => _then(v as Rejected));

  @override
  Rejected get _value => super._value as Rejected;

  @override
  $Res call({
    Object spRejectedJobs = freezed,
    Object userID = freezed,
  }) {
    return _then(Rejected(
      spRejectedJobs == freezed
          ? _value.spRejectedJobs
          : spRejectedJobs as SpRejectedJobs,
      userID == freezed ? _value.userID : userID as String,
    ));
  }
}

class _$Rejected implements Rejected {
  const _$Rejected(this.spRejectedJobs, this.userID)
      : assert(spRejectedJobs != null),
        assert(userID != null);

  @override
  final SpRejectedJobs spRejectedJobs;
  @override
  final String userID;

  @override
  String toString() {
    return 'SPJobState.rejected(spRejectedJobs: $spRejectedJobs, userID: $userID)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Rejected &&
            (identical(other.spRejectedJobs, spRejectedJobs) ||
                const DeepCollectionEquality()
                    .equals(other.spRejectedJobs, spRejectedJobs)) &&
            (identical(other.userID, userID) ||
                const DeepCollectionEquality().equals(other.userID, userID)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(spRejectedJobs) ^
      const DeepCollectionEquality().hash(userID);

  @override
  $RejectedCopyWith<Rejected> get copyWith =>
      _$RejectedCopyWithImpl<Rejected>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required
        Result jobStatus(
            int spNewJobs,
            int spPendingJobs,
            int spRejectedJobs,
            int spInProgressJobs,
            int spUnpaidJobs,
            int spPaidJobs,
            int spBalance),
    @required Result newJob(SpNewJobs spNewJobs, String userID),
    @required Result pending(SpPendingJobs spPendingJobs, String userID),
    @required Result rejected(SpRejectedJobs spRejectedJobs, String userID),
    @required
        Result inProgress(SpInProgressJobs spInProgressJobs, String userID),
    @required Result unpaid(SpUnpaidJobs spUnpaidJobs, String userID),
    @required Result paid(SpPaidJobs spPaidJobs, String userID),
    @required Result loading(),
    @required Result error(SPDetailsFailure failure),
  }) {
    assert(initial != null);
    assert(jobStatus != null);
    assert(newJob != null);
    assert(pending != null);
    assert(rejected != null);
    assert(inProgress != null);
    assert(unpaid != null);
    assert(paid != null);
    assert(loading != null);
    assert(error != null);
    return rejected(spRejectedJobs, userID);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result jobStatus(int spNewJobs, int spPendingJobs, int spRejectedJobs,
        int spInProgressJobs, int spUnpaidJobs, int spPaidJobs, int spBalance),
    Result newJob(SpNewJobs spNewJobs, String userID),
    Result pending(SpPendingJobs spPendingJobs, String userID),
    Result rejected(SpRejectedJobs spRejectedJobs, String userID),
    Result inProgress(SpInProgressJobs spInProgressJobs, String userID),
    Result unpaid(SpUnpaidJobs spUnpaidJobs, String userID),
    Result paid(SpPaidJobs spPaidJobs, String userID),
    Result loading(),
    Result error(SPDetailsFailure failure),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (rejected != null) {
      return rejected(spRejectedJobs, userID);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(Initial value),
    @required Result jobStatus(JobStatus value),
    @required Result newJob(NewJob value),
    @required Result pending(Pending value),
    @required Result rejected(Rejected value),
    @required Result inProgress(InProgress value),
    @required Result unpaid(Unpaid value),
    @required Result paid(Paid value),
    @required Result loading(Loading value),
    @required Result error(Error value),
  }) {
    assert(initial != null);
    assert(jobStatus != null);
    assert(newJob != null);
    assert(pending != null);
    assert(rejected != null);
    assert(inProgress != null);
    assert(unpaid != null);
    assert(paid != null);
    assert(loading != null);
    assert(error != null);
    return rejected(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(Initial value),
    Result jobStatus(JobStatus value),
    Result newJob(NewJob value),
    Result pending(Pending value),
    Result rejected(Rejected value),
    Result inProgress(InProgress value),
    Result unpaid(Unpaid value),
    Result paid(Paid value),
    Result loading(Loading value),
    Result error(Error value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (rejected != null) {
      return rejected(this);
    }
    return orElse();
  }
}

abstract class Rejected implements SPJobState {
  const factory Rejected(SpRejectedJobs spRejectedJobs, String userID) =
      _$Rejected;

  SpRejectedJobs get spRejectedJobs;
  String get userID;
  $RejectedCopyWith<Rejected> get copyWith;
}

abstract class $InProgressCopyWith<$Res> {
  factory $InProgressCopyWith(
          InProgress value, $Res Function(InProgress) then) =
      _$InProgressCopyWithImpl<$Res>;
  $Res call({SpInProgressJobs spInProgressJobs, String userID});
}

class _$InProgressCopyWithImpl<$Res> extends _$SPJobStateCopyWithImpl<$Res>
    implements $InProgressCopyWith<$Res> {
  _$InProgressCopyWithImpl(InProgress _value, $Res Function(InProgress) _then)
      : super(_value, (v) => _then(v as InProgress));

  @override
  InProgress get _value => super._value as InProgress;

  @override
  $Res call({
    Object spInProgressJobs = freezed,
    Object userID = freezed,
  }) {
    return _then(InProgress(
      spInProgressJobs == freezed
          ? _value.spInProgressJobs
          : spInProgressJobs as SpInProgressJobs,
      userID == freezed ? _value.userID : userID as String,
    ));
  }
}

class _$InProgress implements InProgress {
  const _$InProgress(this.spInProgressJobs, this.userID)
      : assert(spInProgressJobs != null),
        assert(userID != null);

  @override
  final SpInProgressJobs spInProgressJobs;
  @override
  final String userID;

  @override
  String toString() {
    return 'SPJobState.inProgress(spInProgressJobs: $spInProgressJobs, userID: $userID)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is InProgress &&
            (identical(other.spInProgressJobs, spInProgressJobs) ||
                const DeepCollectionEquality()
                    .equals(other.spInProgressJobs, spInProgressJobs)) &&
            (identical(other.userID, userID) ||
                const DeepCollectionEquality().equals(other.userID, userID)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(spInProgressJobs) ^
      const DeepCollectionEquality().hash(userID);

  @override
  $InProgressCopyWith<InProgress> get copyWith =>
      _$InProgressCopyWithImpl<InProgress>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required
        Result jobStatus(
            int spNewJobs,
            int spPendingJobs,
            int spRejectedJobs,
            int spInProgressJobs,
            int spUnpaidJobs,
            int spPaidJobs,
            int spBalance),
    @required Result newJob(SpNewJobs spNewJobs, String userID),
    @required Result pending(SpPendingJobs spPendingJobs, String userID),
    @required Result rejected(SpRejectedJobs spRejectedJobs, String userID),
    @required
        Result inProgress(SpInProgressJobs spInProgressJobs, String userID),
    @required Result unpaid(SpUnpaidJobs spUnpaidJobs, String userID),
    @required Result paid(SpPaidJobs spPaidJobs, String userID),
    @required Result loading(),
    @required Result error(SPDetailsFailure failure),
  }) {
    assert(initial != null);
    assert(jobStatus != null);
    assert(newJob != null);
    assert(pending != null);
    assert(rejected != null);
    assert(inProgress != null);
    assert(unpaid != null);
    assert(paid != null);
    assert(loading != null);
    assert(error != null);
    return inProgress(spInProgressJobs, userID);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result jobStatus(int spNewJobs, int spPendingJobs, int spRejectedJobs,
        int spInProgressJobs, int spUnpaidJobs, int spPaidJobs, int spBalance),
    Result newJob(SpNewJobs spNewJobs, String userID),
    Result pending(SpPendingJobs spPendingJobs, String userID),
    Result rejected(SpRejectedJobs spRejectedJobs, String userID),
    Result inProgress(SpInProgressJobs spInProgressJobs, String userID),
    Result unpaid(SpUnpaidJobs spUnpaidJobs, String userID),
    Result paid(SpPaidJobs spPaidJobs, String userID),
    Result loading(),
    Result error(SPDetailsFailure failure),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (inProgress != null) {
      return inProgress(spInProgressJobs, userID);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(Initial value),
    @required Result jobStatus(JobStatus value),
    @required Result newJob(NewJob value),
    @required Result pending(Pending value),
    @required Result rejected(Rejected value),
    @required Result inProgress(InProgress value),
    @required Result unpaid(Unpaid value),
    @required Result paid(Paid value),
    @required Result loading(Loading value),
    @required Result error(Error value),
  }) {
    assert(initial != null);
    assert(jobStatus != null);
    assert(newJob != null);
    assert(pending != null);
    assert(rejected != null);
    assert(inProgress != null);
    assert(unpaid != null);
    assert(paid != null);
    assert(loading != null);
    assert(error != null);
    return inProgress(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(Initial value),
    Result jobStatus(JobStatus value),
    Result newJob(NewJob value),
    Result pending(Pending value),
    Result rejected(Rejected value),
    Result inProgress(InProgress value),
    Result unpaid(Unpaid value),
    Result paid(Paid value),
    Result loading(Loading value),
    Result error(Error value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (inProgress != null) {
      return inProgress(this);
    }
    return orElse();
  }
}

abstract class InProgress implements SPJobState {
  const factory InProgress(SpInProgressJobs spInProgressJobs, String userID) =
      _$InProgress;

  SpInProgressJobs get spInProgressJobs;
  String get userID;
  $InProgressCopyWith<InProgress> get copyWith;
}

abstract class $UnpaidCopyWith<$Res> {
  factory $UnpaidCopyWith(Unpaid value, $Res Function(Unpaid) then) =
      _$UnpaidCopyWithImpl<$Res>;
  $Res call({SpUnpaidJobs spUnpaidJobs, String userID});
}

class _$UnpaidCopyWithImpl<$Res> extends _$SPJobStateCopyWithImpl<$Res>
    implements $UnpaidCopyWith<$Res> {
  _$UnpaidCopyWithImpl(Unpaid _value, $Res Function(Unpaid) _then)
      : super(_value, (v) => _then(v as Unpaid));

  @override
  Unpaid get _value => super._value as Unpaid;

  @override
  $Res call({
    Object spUnpaidJobs = freezed,
    Object userID = freezed,
  }) {
    return _then(Unpaid(
      spUnpaidJobs == freezed
          ? _value.spUnpaidJobs
          : spUnpaidJobs as SpUnpaidJobs,
      userID == freezed ? _value.userID : userID as String,
    ));
  }
}

class _$Unpaid implements Unpaid {
  const _$Unpaid(this.spUnpaidJobs, this.userID)
      : assert(spUnpaidJobs != null),
        assert(userID != null);

  @override
  final SpUnpaidJobs spUnpaidJobs;
  @override
  final String userID;

  @override
  String toString() {
    return 'SPJobState.unpaid(spUnpaidJobs: $spUnpaidJobs, userID: $userID)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Unpaid &&
            (identical(other.spUnpaidJobs, spUnpaidJobs) ||
                const DeepCollectionEquality()
                    .equals(other.spUnpaidJobs, spUnpaidJobs)) &&
            (identical(other.userID, userID) ||
                const DeepCollectionEquality().equals(other.userID, userID)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(spUnpaidJobs) ^
      const DeepCollectionEquality().hash(userID);

  @override
  $UnpaidCopyWith<Unpaid> get copyWith =>
      _$UnpaidCopyWithImpl<Unpaid>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required
        Result jobStatus(
            int spNewJobs,
            int spPendingJobs,
            int spRejectedJobs,
            int spInProgressJobs,
            int spUnpaidJobs,
            int spPaidJobs,
            int spBalance),
    @required Result newJob(SpNewJobs spNewJobs, String userID),
    @required Result pending(SpPendingJobs spPendingJobs, String userID),
    @required Result rejected(SpRejectedJobs spRejectedJobs, String userID),
    @required
        Result inProgress(SpInProgressJobs spInProgressJobs, String userID),
    @required Result unpaid(SpUnpaidJobs spUnpaidJobs, String userID),
    @required Result paid(SpPaidJobs spPaidJobs, String userID),
    @required Result loading(),
    @required Result error(SPDetailsFailure failure),
  }) {
    assert(initial != null);
    assert(jobStatus != null);
    assert(newJob != null);
    assert(pending != null);
    assert(rejected != null);
    assert(inProgress != null);
    assert(unpaid != null);
    assert(paid != null);
    assert(loading != null);
    assert(error != null);
    return unpaid(spUnpaidJobs, userID);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result jobStatus(int spNewJobs, int spPendingJobs, int spRejectedJobs,
        int spInProgressJobs, int spUnpaidJobs, int spPaidJobs, int spBalance),
    Result newJob(SpNewJobs spNewJobs, String userID),
    Result pending(SpPendingJobs spPendingJobs, String userID),
    Result rejected(SpRejectedJobs spRejectedJobs, String userID),
    Result inProgress(SpInProgressJobs spInProgressJobs, String userID),
    Result unpaid(SpUnpaidJobs spUnpaidJobs, String userID),
    Result paid(SpPaidJobs spPaidJobs, String userID),
    Result loading(),
    Result error(SPDetailsFailure failure),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (unpaid != null) {
      return unpaid(spUnpaidJobs, userID);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(Initial value),
    @required Result jobStatus(JobStatus value),
    @required Result newJob(NewJob value),
    @required Result pending(Pending value),
    @required Result rejected(Rejected value),
    @required Result inProgress(InProgress value),
    @required Result unpaid(Unpaid value),
    @required Result paid(Paid value),
    @required Result loading(Loading value),
    @required Result error(Error value),
  }) {
    assert(initial != null);
    assert(jobStatus != null);
    assert(newJob != null);
    assert(pending != null);
    assert(rejected != null);
    assert(inProgress != null);
    assert(unpaid != null);
    assert(paid != null);
    assert(loading != null);
    assert(error != null);
    return unpaid(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(Initial value),
    Result jobStatus(JobStatus value),
    Result newJob(NewJob value),
    Result pending(Pending value),
    Result rejected(Rejected value),
    Result inProgress(InProgress value),
    Result unpaid(Unpaid value),
    Result paid(Paid value),
    Result loading(Loading value),
    Result error(Error value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (unpaid != null) {
      return unpaid(this);
    }
    return orElse();
  }
}

abstract class Unpaid implements SPJobState {
  const factory Unpaid(SpUnpaidJobs spUnpaidJobs, String userID) = _$Unpaid;

  SpUnpaidJobs get spUnpaidJobs;
  String get userID;
  $UnpaidCopyWith<Unpaid> get copyWith;
}

abstract class $PaidCopyWith<$Res> {
  factory $PaidCopyWith(Paid value, $Res Function(Paid) then) =
      _$PaidCopyWithImpl<$Res>;
  $Res call({SpPaidJobs spPaidJobs, String userID});
}

class _$PaidCopyWithImpl<$Res> extends _$SPJobStateCopyWithImpl<$Res>
    implements $PaidCopyWith<$Res> {
  _$PaidCopyWithImpl(Paid _value, $Res Function(Paid) _then)
      : super(_value, (v) => _then(v as Paid));

  @override
  Paid get _value => super._value as Paid;

  @override
  $Res call({
    Object spPaidJobs = freezed,
    Object userID = freezed,
  }) {
    return _then(Paid(
      spPaidJobs == freezed ? _value.spPaidJobs : spPaidJobs as SpPaidJobs,
      userID == freezed ? _value.userID : userID as String,
    ));
  }
}

class _$Paid implements Paid {
  const _$Paid(this.spPaidJobs, this.userID)
      : assert(spPaidJobs != null),
        assert(userID != null);

  @override
  final SpPaidJobs spPaidJobs;
  @override
  final String userID;

  @override
  String toString() {
    return 'SPJobState.paid(spPaidJobs: $spPaidJobs, userID: $userID)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Paid &&
            (identical(other.spPaidJobs, spPaidJobs) ||
                const DeepCollectionEquality()
                    .equals(other.spPaidJobs, spPaidJobs)) &&
            (identical(other.userID, userID) ||
                const DeepCollectionEquality().equals(other.userID, userID)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(spPaidJobs) ^
      const DeepCollectionEquality().hash(userID);

  @override
  $PaidCopyWith<Paid> get copyWith =>
      _$PaidCopyWithImpl<Paid>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required
        Result jobStatus(
            int spNewJobs,
            int spPendingJobs,
            int spRejectedJobs,
            int spInProgressJobs,
            int spUnpaidJobs,
            int spPaidJobs,
            int spBalance),
    @required Result newJob(SpNewJobs spNewJobs, String userID),
    @required Result pending(SpPendingJobs spPendingJobs, String userID),
    @required Result rejected(SpRejectedJobs spRejectedJobs, String userID),
    @required
        Result inProgress(SpInProgressJobs spInProgressJobs, String userID),
    @required Result unpaid(SpUnpaidJobs spUnpaidJobs, String userID),
    @required Result paid(SpPaidJobs spPaidJobs, String userID),
    @required Result loading(),
    @required Result error(SPDetailsFailure failure),
  }) {
    assert(initial != null);
    assert(jobStatus != null);
    assert(newJob != null);
    assert(pending != null);
    assert(rejected != null);
    assert(inProgress != null);
    assert(unpaid != null);
    assert(paid != null);
    assert(loading != null);
    assert(error != null);
    return paid(spPaidJobs, userID);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result jobStatus(int spNewJobs, int spPendingJobs, int spRejectedJobs,
        int spInProgressJobs, int spUnpaidJobs, int spPaidJobs, int spBalance),
    Result newJob(SpNewJobs spNewJobs, String userID),
    Result pending(SpPendingJobs spPendingJobs, String userID),
    Result rejected(SpRejectedJobs spRejectedJobs, String userID),
    Result inProgress(SpInProgressJobs spInProgressJobs, String userID),
    Result unpaid(SpUnpaidJobs spUnpaidJobs, String userID),
    Result paid(SpPaidJobs spPaidJobs, String userID),
    Result loading(),
    Result error(SPDetailsFailure failure),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (paid != null) {
      return paid(spPaidJobs, userID);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(Initial value),
    @required Result jobStatus(JobStatus value),
    @required Result newJob(NewJob value),
    @required Result pending(Pending value),
    @required Result rejected(Rejected value),
    @required Result inProgress(InProgress value),
    @required Result unpaid(Unpaid value),
    @required Result paid(Paid value),
    @required Result loading(Loading value),
    @required Result error(Error value),
  }) {
    assert(initial != null);
    assert(jobStatus != null);
    assert(newJob != null);
    assert(pending != null);
    assert(rejected != null);
    assert(inProgress != null);
    assert(unpaid != null);
    assert(paid != null);
    assert(loading != null);
    assert(error != null);
    return paid(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(Initial value),
    Result jobStatus(JobStatus value),
    Result newJob(NewJob value),
    Result pending(Pending value),
    Result rejected(Rejected value),
    Result inProgress(InProgress value),
    Result unpaid(Unpaid value),
    Result paid(Paid value),
    Result loading(Loading value),
    Result error(Error value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (paid != null) {
      return paid(this);
    }
    return orElse();
  }
}

abstract class Paid implements SPJobState {
  const factory Paid(SpPaidJobs spPaidJobs, String userID) = _$Paid;

  SpPaidJobs get spPaidJobs;
  String get userID;
  $PaidCopyWith<Paid> get copyWith;
}

abstract class $LoadingCopyWith<$Res> {
  factory $LoadingCopyWith(Loading value, $Res Function(Loading) then) =
      _$LoadingCopyWithImpl<$Res>;
}

class _$LoadingCopyWithImpl<$Res> extends _$SPJobStateCopyWithImpl<$Res>
    implements $LoadingCopyWith<$Res> {
  _$LoadingCopyWithImpl(Loading _value, $Res Function(Loading) _then)
      : super(_value, (v) => _then(v as Loading));

  @override
  Loading get _value => super._value as Loading;
}

class _$Loading implements Loading {
  const _$Loading();

  @override
  String toString() {
    return 'SPJobState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required
        Result jobStatus(
            int spNewJobs,
            int spPendingJobs,
            int spRejectedJobs,
            int spInProgressJobs,
            int spUnpaidJobs,
            int spPaidJobs,
            int spBalance),
    @required Result newJob(SpNewJobs spNewJobs, String userID),
    @required Result pending(SpPendingJobs spPendingJobs, String userID),
    @required Result rejected(SpRejectedJobs spRejectedJobs, String userID),
    @required
        Result inProgress(SpInProgressJobs spInProgressJobs, String userID),
    @required Result unpaid(SpUnpaidJobs spUnpaidJobs, String userID),
    @required Result paid(SpPaidJobs spPaidJobs, String userID),
    @required Result loading(),
    @required Result error(SPDetailsFailure failure),
  }) {
    assert(initial != null);
    assert(jobStatus != null);
    assert(newJob != null);
    assert(pending != null);
    assert(rejected != null);
    assert(inProgress != null);
    assert(unpaid != null);
    assert(paid != null);
    assert(loading != null);
    assert(error != null);
    return loading();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result jobStatus(int spNewJobs, int spPendingJobs, int spRejectedJobs,
        int spInProgressJobs, int spUnpaidJobs, int spPaidJobs, int spBalance),
    Result newJob(SpNewJobs spNewJobs, String userID),
    Result pending(SpPendingJobs spPendingJobs, String userID),
    Result rejected(SpRejectedJobs spRejectedJobs, String userID),
    Result inProgress(SpInProgressJobs spInProgressJobs, String userID),
    Result unpaid(SpUnpaidJobs spUnpaidJobs, String userID),
    Result paid(SpPaidJobs spPaidJobs, String userID),
    Result loading(),
    Result error(SPDetailsFailure failure),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(Initial value),
    @required Result jobStatus(JobStatus value),
    @required Result newJob(NewJob value),
    @required Result pending(Pending value),
    @required Result rejected(Rejected value),
    @required Result inProgress(InProgress value),
    @required Result unpaid(Unpaid value),
    @required Result paid(Paid value),
    @required Result loading(Loading value),
    @required Result error(Error value),
  }) {
    assert(initial != null);
    assert(jobStatus != null);
    assert(newJob != null);
    assert(pending != null);
    assert(rejected != null);
    assert(inProgress != null);
    assert(unpaid != null);
    assert(paid != null);
    assert(loading != null);
    assert(error != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(Initial value),
    Result jobStatus(JobStatus value),
    Result newJob(NewJob value),
    Result pending(Pending value),
    Result rejected(Rejected value),
    Result inProgress(InProgress value),
    Result unpaid(Unpaid value),
    Result paid(Paid value),
    Result loading(Loading value),
    Result error(Error value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements SPJobState {
  const factory Loading() = _$Loading;
}

abstract class $ErrorCopyWith<$Res> {
  factory $ErrorCopyWith(Error value, $Res Function(Error) then) =
      _$ErrorCopyWithImpl<$Res>;
  $Res call({SPDetailsFailure failure});

  $SPDetailsFailureCopyWith<$Res> get failure;
}

class _$ErrorCopyWithImpl<$Res> extends _$SPJobStateCopyWithImpl<$Res>
    implements $ErrorCopyWith<$Res> {
  _$ErrorCopyWithImpl(Error _value, $Res Function(Error) _then)
      : super(_value, (v) => _then(v as Error));

  @override
  Error get _value => super._value as Error;

  @override
  $Res call({
    Object failure = freezed,
  }) {
    return _then(Error(
      failure == freezed ? _value.failure : failure as SPDetailsFailure,
    ));
  }

  @override
  $SPDetailsFailureCopyWith<$Res> get failure {
    if (_value.failure == null) {
      return null;
    }
    return $SPDetailsFailureCopyWith<$Res>(_value.failure, (value) {
      return _then(_value.copyWith(failure: value));
    });
  }
}

class _$Error implements Error {
  const _$Error(this.failure) : assert(failure != null);

  @override
  final SPDetailsFailure failure;

  @override
  String toString() {
    return 'SPJobState.error(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Error &&
            (identical(other.failure, failure) ||
                const DeepCollectionEquality().equals(other.failure, failure)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failure);

  @override
  $ErrorCopyWith<Error> get copyWith =>
      _$ErrorCopyWithImpl<Error>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required
        Result jobStatus(
            int spNewJobs,
            int spPendingJobs,
            int spRejectedJobs,
            int spInProgressJobs,
            int spUnpaidJobs,
            int spPaidJobs,
            int spBalance),
    @required Result newJob(SpNewJobs spNewJobs, String userID),
    @required Result pending(SpPendingJobs spPendingJobs, String userID),
    @required Result rejected(SpRejectedJobs spRejectedJobs, String userID),
    @required
        Result inProgress(SpInProgressJobs spInProgressJobs, String userID),
    @required Result unpaid(SpUnpaidJobs spUnpaidJobs, String userID),
    @required Result paid(SpPaidJobs spPaidJobs, String userID),
    @required Result loading(),
    @required Result error(SPDetailsFailure failure),
  }) {
    assert(initial != null);
    assert(jobStatus != null);
    assert(newJob != null);
    assert(pending != null);
    assert(rejected != null);
    assert(inProgress != null);
    assert(unpaid != null);
    assert(paid != null);
    assert(loading != null);
    assert(error != null);
    return error(failure);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result jobStatus(int spNewJobs, int spPendingJobs, int spRejectedJobs,
        int spInProgressJobs, int spUnpaidJobs, int spPaidJobs, int spBalance),
    Result newJob(SpNewJobs spNewJobs, String userID),
    Result pending(SpPendingJobs spPendingJobs, String userID),
    Result rejected(SpRejectedJobs spRejectedJobs, String userID),
    Result inProgress(SpInProgressJobs spInProgressJobs, String userID),
    Result unpaid(SpUnpaidJobs spUnpaidJobs, String userID),
    Result paid(SpPaidJobs spPaidJobs, String userID),
    Result loading(),
    Result error(SPDetailsFailure failure),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(Initial value),
    @required Result jobStatus(JobStatus value),
    @required Result newJob(NewJob value),
    @required Result pending(Pending value),
    @required Result rejected(Rejected value),
    @required Result inProgress(InProgress value),
    @required Result unpaid(Unpaid value),
    @required Result paid(Paid value),
    @required Result loading(Loading value),
    @required Result error(Error value),
  }) {
    assert(initial != null);
    assert(jobStatus != null);
    assert(newJob != null);
    assert(pending != null);
    assert(rejected != null);
    assert(inProgress != null);
    assert(unpaid != null);
    assert(paid != null);
    assert(loading != null);
    assert(error != null);
    return error(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(Initial value),
    Result jobStatus(JobStatus value),
    Result newJob(NewJob value),
    Result pending(Pending value),
    Result rejected(Rejected value),
    Result inProgress(InProgress value),
    Result unpaid(Unpaid value),
    Result paid(Paid value),
    Result loading(Loading value),
    Result error(Error value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error implements SPJobState {
  const factory Error(SPDetailsFailure failure) = _$Error;

  SPDetailsFailure get failure;
  $ErrorCopyWith<Error> get copyWith;
}
