part of 'sp_request_time_extension_cubit.dart';

@freezed
abstract class SpRequestTimeExtensionState with _$SpRequestTimeExtensionState {
  const factory SpRequestTimeExtensionState({
    bool isSubmitting,
    String workDuration,
    Option<Either<JobJourneyFailure, Unit>> sendingFailureOrSuccessOption,
  }) = _SpRequestTimeExtensionState;

  factory SpRequestTimeExtensionState.initial() => SpRequestTimeExtensionState(
        workDuration: '2 hours',
        isSubmitting: false,
        sendingFailureOrSuccessOption: none(),
      );
}
