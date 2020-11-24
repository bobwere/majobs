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
part 'sp_job_state.dart';
part 'sp_job_cubit.freezed.dart';

@injectable
class SPJobCubit extends Cubit<SPJobState> {
  SPJobCubit(this._iServiceProviderFacade, this._pref)
      : super(SPJobState.initial());

  IServiceProviderFacade _iServiceProviderFacade;
  SharedPreferences _pref;

  void getNewJobs() async {
    emit(SPJobState.loading());
    final currentUser = _pref.getString(USER_ID);

    final failureOrJobsDetails =
        await _iServiceProviderFacade.getNewJobs(id: currentUser);
    failureOrJobsDetails.fold((failure) => emit(SPJobState.error(failure)),
        (spNewJobs) => emit(SPJobState.newJob(spNewJobs, currentUser)));
  }

  void getPendingJobs() async {
    emit(SPJobState.loading());
    final currentUser = _pref.getString(USER_ID);

    final failureOrJobsDetails =
        await _iServiceProviderFacade.getPendingJobs(id: currentUser);
    failureOrJobsDetails.fold((failure) => emit(SPJobState.error(failure)),
        (jobDetails) => emit(SPJobState.pending(jobDetails, currentUser)));
  }

  void getRejectedJobs() async {
    emit(SPJobState.loading());
    final currentUser = _pref.getString(USER_ID);

    final failureOrJobsDetails =
        await _iServiceProviderFacade.getRejectedJobs(id: currentUser);
    failureOrJobsDetails.fold((failure) => emit(SPJobState.error(failure)),
        (jobDetails) => emit(SPJobState.rejected(jobDetails, currentUser)));
  }

  void getInProgressJobs() async {
    emit(SPJobState.loading());
    final currentUser = _pref.getString(USER_ID);

    final failureOrJobsDetails =
        await _iServiceProviderFacade.getJobsInProgress(id: currentUser);
    failureOrJobsDetails.fold((failure) => emit(SPJobState.error(failure)),
        (jobDetails) => emit(SPJobState.inProgress(jobDetails, currentUser)));
  }

  void getUnpaidJobs() async {
    emit(SPJobState.loading());
    final currentUser = _pref.getString(USER_ID);

    final failureOrJobsDetails =
        await _iServiceProviderFacade.getUnpaidJobs(id: currentUser);
    failureOrJobsDetails.fold((failure) => emit(SPJobState.error(failure)),
        (jobDetails) => emit(SPJobState.unpaid(jobDetails, currentUser)));
  }

  void getPaidJobs() async {
    emit(SPJobState.loading());
    final currentUser = _pref.getString(USER_ID);

    final failureOrJobsDetails =
        await _iServiceProviderFacade.getPaidJobs(id: currentUser);
    failureOrJobsDetails.fold((failure) => emit(SPJobState.error(failure)),
        (jobDetails) => emit(SPJobState.paid(jobDetails, currentUser)));
  }

  void getJobStatus() async {
    emit(SPJobState.loading());
    final currentUser = _pref.getString(USER_ID);
    final userPhone = _pref.getString(USER_PHONE);
    final userTypeID = _pref.getString(USER_TYPE_ID);

    int noNewJobs = 0;
    int noJobsPending = 0;
    int noRejectedJobs = 0;
    int noJobsInProgress = 0;
    int noJobsUnpaidg = 0;
    int noJobsPaid = 0;
    int spBalance = 0;

    if (userTypeID == '4') {
      final failureOrSpBalance =
          await _iServiceProviderFacade.getSPBalance(phone: userPhone);
      failureOrSpBalance.fold(
          (l) => spBalance = 0, (r) => spBalance = r.balance);
    }

    final failureOrNewJobs =
        await _iServiceProviderFacade.getNewJobs(id: currentUser);
    failureOrNewJobs.fold(
        (l) => noNewJobs = 0, (r) => noNewJobs = r.newJobs.length);

    final failureOrPendingJobs =
        await _iServiceProviderFacade.getPendingJobs(id: currentUser);
    failureOrPendingJobs.fold(
        (l) => noJobsPending = 0, (r) => noJobsPending = r.pendingJobs.length);

    final failureOrRejectedJobs =
        await _iServiceProviderFacade.getRejectedJobs(id: currentUser);
    failureOrRejectedJobs.fold((l) => noRejectedJobs = 0,
        (r) => noRejectedJobs = r.rejectedJobs.length);

    final failureOrJobsInProgress =
        await _iServiceProviderFacade.getJobsInProgress(id: currentUser);
    failureOrJobsInProgress.fold((l) => noJobsInProgress = 0,
        (r) => noJobsInProgress = r.inProgressJobs.length);

    final failureOrUnpaidJobs =
        await _iServiceProviderFacade.getUnpaidJobs(id: currentUser);
    failureOrUnpaidJobs.fold(
        (l) => noJobsUnpaidg = 0, (r) => noJobsUnpaidg = r.unpaidJobs.length);

    final failureOrPaidJobs =
        await _iServiceProviderFacade.getPaidJobs(id: currentUser);
    failureOrPaidJobs.fold(
        (l) => noJobsPaid = 0, (r) => noJobsPaid = r.paidJobs.length);

    emit(SPJobState.jobStatus(
      noNewJobs,
      noJobsPending,
      noRejectedJobs,
      noJobsInProgress,
      noJobsUnpaidg,
      noJobsPaid,
      spBalance,
    ));
  }
}
