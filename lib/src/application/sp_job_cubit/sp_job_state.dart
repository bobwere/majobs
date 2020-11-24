part of 'sp_job_cubit.dart';

@freezed
abstract class SPJobState with _$SPJobState {
  const factory SPJobState.initial() = Initial;
  const factory SPJobState.jobStatus(
      int spNewJobs,
      int spPendingJobs,
      int spRejectedJobs,
      int spInProgressJobs,
      int spUnpaidJobs,
      int spPaidJobs,
      int spBalance) = JobStatus;
  const factory SPJobState.newJob(SpNewJobs spNewJobs, String userID) = NewJob;

  const factory SPJobState.pending(SpPendingJobs spPendingJobs, String userID) =
      Pending;
  const factory SPJobState.rejected(
      SpRejectedJobs spRejectedJobs, String userID) = Rejected;
  const factory SPJobState.inProgress(
      SpInProgressJobs spInProgressJobs, String userID) = InProgress;
  const factory SPJobState.unpaid(SpUnpaidJobs spUnpaidJobs, String userID) =
      Unpaid;
  const factory SPJobState.paid(SpPaidJobs spPaidJobs, String userID) = Paid;
  const factory SPJobState.loading() = Loading;
  const factory SPJobState.error(SPDetailsFailure failure) = Error;
}
