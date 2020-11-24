part of 'sp_withdraws_money_cubit.dart';

@freezed
abstract class SPWithdrawsMoneyState with _$SPWithdrawsMoneyState {
  const factory SPWithdrawsMoneyState.initial() = Initial;
  const factory SPWithdrawsMoneyState.success() = Success;
  const factory SPWithdrawsMoneyState.loading() = Loading;
  const factory SPWithdrawsMoneyState.error(SPDetailsFailure failure) = Error;
}
