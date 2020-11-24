part of 'sp_sets_price_cubit.dart';

@freezed
abstract class SpSetsPriceeState with _$SpSetsPriceeState {
  const factory SpSetsPriceeState({
    String rating,
    bool isSubmitting,
    String workDuration,
    String agreedPrice,
    Option<Either<JobJourneyFailure, Unit>> sendingFailureOrSuccessOption,
  }) = _SpSetsPriceeState;

  factory SpSetsPriceeState.initial() => SpSetsPriceeState(
        rating: '1',
        workDuration: '2 hours',
        agreedPrice: '700',
        isSubmitting: false,
        sendingFailureOrSuccessOption: none(),
      );
}
