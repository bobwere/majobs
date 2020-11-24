part of 'client_pays_worker_cubit.dart';

@freezed
abstract class ClientPaysWorkerState with _$ClientPaysWorkerState {
  const factory ClientPaysWorkerState({
    bool isSubmitting,
    Option<Either<JobJourneyFailure, Unit>> sendingFailureOrSuccessOption,
  }) = _ClientPaysWorkerState;

  factory ClientPaysWorkerState.initial() => ClientPaysWorkerState(
        isSubmitting: false,
        sendingFailureOrSuccessOption: none(),
      );
}
