import 'package:bonyeza_kazi/common/constants/strings.dart';
import 'package:bonyeza_kazi/src/domain/service_provider/i_service_provider_interface.dart';
import 'package:bonyeza_kazi/src/infrastructure/service_provider/model/sp_in_progress_jobs_model.dart';
import 'package:bonyeza_kazi/src/infrastructure/service_provider/model/sp_new_jobs.dart';
import 'package:bonyeza_kazi/src/infrastructure/service_provider/model/sp_paid_jobs.dart';
import 'package:bonyeza_kazi/src/infrastructure/service_provider/model/sp_pending_jobs_model.dart';
import 'package:bonyeza_kazi/src/infrastructure/service_provider/model/sp_rejected_jobs_model.dart';
import 'package:bonyeza_kazi/src/infrastructure/service_provider/model/sp_unpaid_jobs.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'package:bonyeza_kazi/common/failures/sp_details_failure.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'sp_withdraws_money_state.dart';
part 'sp_withdraws_money_cubit.freezed.dart';

@injectable
class SPWithdrawsMoneyCubit extends Cubit<SPWithdrawsMoneyState> {
  SPWithdrawsMoneyCubit(this._iServiceProviderFacade, this._pref)
      : super(SPWithdrawsMoneyState.initial());

  IServiceProviderFacade _iServiceProviderFacade;
  SharedPreferences _pref;

  void spWithdrawsMoney(int amount) async {
    emit(SPWithdrawsMoneyState.loading());
    final phone = _pref.getString(USER_PHONE);

    final failureOrJobsDetails = await _iServiceProviderFacade.spWithdrawsMoney(
        phone: phone, amount: amount);
    failureOrJobsDetails.fold(
        (failure) => emit(SPWithdrawsMoneyState.error(failure)),
        (unit) => emit(SPWithdrawsMoneyState.success()));
  }
}
