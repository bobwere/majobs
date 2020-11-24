part of 'client_approves_work_cubit.dart';

@freezed
abstract class ClientApprovesWorkState with _$ClientApprovesWorkState {
  const factory ClientApprovesWorkState({
    bool isSubmitting,
    String reason,
    Option<Either<JobJourneyFailure, Unit>> sendingFailureOrSuccessOption,
  }) = _ClientApprovesWorkState;

  factory ClientApprovesWorkState.initial() => ClientApprovesWorkState(
        reason: '',
        isSubmitting: false,
        sendingFailureOrSuccessOption: none(),
      );
}
