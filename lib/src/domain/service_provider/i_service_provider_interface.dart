import 'package:bonyeza_kazi/common/failures/review_failure.dart';
import 'package:bonyeza_kazi/common/failures/sp_details_failure.dart';
import 'package:bonyeza_kazi/src/infrastructure/service_provider/model/reviews_model.dart';

import 'package:bonyeza_kazi/src/infrastructure/service_provider/model/service_provider_details_model.dart';
import 'package:bonyeza_kazi/src/infrastructure/service_provider/model/sp_balance_model.dart';
import 'package:bonyeza_kazi/src/infrastructure/service_provider/model/sp_in_progress_jobs_model.dart';
import 'package:bonyeza_kazi/src/infrastructure/service_provider/model/sp_new_jobs.dart';
import 'package:bonyeza_kazi/src/infrastructure/service_provider/model/sp_paid_jobs.dart';
import 'package:bonyeza_kazi/src/infrastructure/service_provider/model/sp_pending_jobs_model.dart';
import 'package:bonyeza_kazi/src/infrastructure/service_provider/model/sp_rejected_jobs_model.dart';
import 'package:bonyeza_kazi/src/infrastructure/service_provider/model/sp_unpaid_jobs.dart';

import 'package:dartz/dartz.dart';
import 'package:kt_dart/kt.dart';

abstract class IServiceProviderFacade {
  Future<Either<SPDetailsFailure, ServiceProviderDetail>>
      getServiceProviderDetails({String id});
  Future<Either<ReviewFailure, KtList<Review>>> getServiceProviderReviews(
      {String id});
  Future<Either<SPDetailsFailure, SpNewJobs>> getNewJobs({String id});
  Future<Either<SPDetailsFailure, SpPendingJobs>> getPendingJobs({String id});
  Future<Either<SPDetailsFailure, SpInProgressJobs>> getJobsInProgress(
      {String id});
  Future<Either<SPDetailsFailure, SpRejectedJobs>> getRejectedJobs({String id});
  Future<Either<SPDetailsFailure, SpUnpaidJobs>> getUnpaidJobs({String id});
  Future<Either<SPDetailsFailure, SpPaidJobs>> getPaidJobs({String id});
  Future<Either<SPDetailsFailure, SpBalance>> getSPBalance({String phone});
  Future<Either<SPDetailsFailure, Unit>> spWithdrawsMoney(
      {String phone, int amount});
}
