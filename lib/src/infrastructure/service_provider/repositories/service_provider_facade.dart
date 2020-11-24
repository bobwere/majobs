import 'dart:io';
import 'package:bonyeza_kazi/common/constants/strings.dart';
import 'package:bonyeza_kazi/common/failures/review_failure.dart';
import 'package:bonyeza_kazi/common/failures/sp_details_failure.dart';
import 'package:bonyeza_kazi/src/domain/service_provider/i_service_provider_interface.dart';
import 'package:bonyeza_kazi/src/infrastructure/service_provider/model/reviews_model.dart';
import 'package:bonyeza_kazi/src/infrastructure/service_provider/model/service_provider_details_model.dart';
import 'package:bonyeza_kazi/src/infrastructure/service_provider/model/sp_balance_model.dart';
import 'package:bonyeza_kazi/src/infrastructure/service_provider/model/sp_paid_jobs.dart';
import 'package:bonyeza_kazi/src/infrastructure/service_provider/model/sp_new_jobs.dart';
import 'package:bonyeza_kazi/src/infrastructure/service_provider/model/sp_pending_jobs_model.dart';
import 'package:bonyeza_kazi/src/infrastructure/service_provider/model/sp_in_progress_jobs_model.dart';
import 'package:bonyeza_kazi/src/infrastructure/service_provider/model/sp_unpaid_jobs.dart';
import 'package:bonyeza_kazi/src/infrastructure/service_provider/model/sp_rejected_jobs_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as secure;
import 'package:injectable/injectable.dart';
import 'package:kt_dart/kt.dart';

@LazySingleton(as: IServiceProviderFacade)
class ServiceProviderFacade implements IServiceProviderFacade {
  ServiceProviderFacade(this._dio, this._secure, this._dioCacheManager);
  final Dio _dio;
  final secure.FlutterSecureStorage _secure;
  final DioCacheManager _dioCacheManager;

  @override
  Future<Either<SPDetailsFailure, ServiceProviderDetail>>
      getServiceProviderDetails({String id}) async {
    try {
      ServiceProviderDetail serviceDetail;
      var accesstoken = await _secure.read(key: ACCESS_TOKEN);
      _dio.interceptors.add(_dioCacheManager.interceptor);
      Response response = await _dio.get(
        'https://bonyezakazi.com/api/v1/getWorker/$id',
        options: Options(
          responseType: ResponseType.json,
          receiveTimeout: 3000,
          sendTimeout: 5000,
          headers: {
            "Accept": "application/json",
            "content-type": "application/json",
            // "Authorization": "Bearer " + accesstoken,
          },
        ),
      );

      if (response.statusCode == 200) {
        var data = ServiceProviderDetailModel.fromJson(response.data);
        serviceDetail = data.data;
      }
      return right(serviceDetail);
    } on DioError catch (e) {
      if (e.type == DioErrorType.RESPONSE) {
        print(e.message);
        return left(const SPDetailsFailure.serverError());
      } else if (e.type == DioErrorType.DEFAULT && e.error is SocketException) {
        print(e.message);
        return left(const SPDetailsFailure.noInternet());
      } else {
        return left(const SPDetailsFailure.serverError());
      }
    }
  }

  @override
  Future<Either<ReviewFailure, KtList<Review>>> getServiceProviderReviews(
      {String id}) async {
    try {
      KtList<Review> listReviews;
      // var accesstoken = await _secure.read(key: ACCESS_TOKEN);
      _dio.interceptors.add(_dioCacheManager.interceptor);
      Response response = await _dio.get(
        'https://bonyezakazi.com/api/v1/reviews/$id',
        options: Options(
          responseType: ResponseType.json,
          receiveTimeout: 3000,
          sendTimeout: 5000,
          headers: {
            "Accept": "application/json",
            "content-type": "application/json",
            //   "Authorization": "Bearer " + accesstoken,
          },
        ),
      );

      if (response.statusCode == 200) {
        var data = ReviewModel.fromJson(response.data);
        listReviews = data.reviews.toImmutableList();
      }
      return right(listReviews);
    } on DioError catch (e) {
      if (e.type == DioErrorType.RESPONSE) {
        print(e.message);
        return left(const ReviewFailure.serverError());
      } else if (e.type == DioErrorType.DEFAULT && e.error is SocketException) {
        print(e.message);
        return left(const ReviewFailure.noInternet());
      } else {
        return left(const ReviewFailure.serverError());
      }
    }
  }

  @override
  Future<Either<SPDetailsFailure, SpInProgressJobs>> getJobsInProgress(
      {String id}) async {
    try {
      SpInProgressJobs spInProgressJobs;
      var accesstoken = await _secure.read(key: ACCESS_TOKEN);
      _dio.interceptors.add(_dioCacheManager.interceptor);
      Response response = await _dio.get(
        'https://bonyezakazi.com/api/v1/jobs_in_progress/$id',
        options: Options(
          responseType: ResponseType.json,
          receiveTimeout: 3000,
          sendTimeout: 5000,
          headers: {
            "Accept": "application/json",
            "content-type": "application/json",
            "Authorization": "Bearer " + accesstoken,
          },
        ),
      );

      if (response.statusCode == 200) {
        var data = SpInProgressJobs.fromJson(response.data);
        spInProgressJobs = data;
      }
      return right(spInProgressJobs);
    } on DioError catch (e) {
      if (e.type == DioErrorType.RESPONSE) {
        print(e.message);
        return left(const SPDetailsFailure.serverError());
      } else if (e.type == DioErrorType.DEFAULT && e.error is SocketException) {
        print(e.message);
        return left(const SPDetailsFailure.noInternet());
      } else {
        return left(const SPDetailsFailure.serverError());
      }
    }
  }

  @override
  Future<Either<SPDetailsFailure, SpPendingJobs>> getPendingJobs(
      {String id}) async {
    try {
      SpPendingJobs spPendingJobs;
      var accesstoken = await _secure.read(key: ACCESS_TOKEN);
      _dio.interceptors.add(_dioCacheManager.interceptor);
      Response response = await _dio.get(
        'https://bonyezakazi.com/api/v1/jobs_pending/$id',
        options: Options(
          responseType: ResponseType.json,
          receiveTimeout: 3000,
          sendTimeout: 5000,
          headers: {
            "Accept": "application/json",
            "content-type": "application/json",
            "Authorization": "Bearer " + accesstoken,
          },
        ),
      );

      if (response.statusCode == 200) {
        var data = SpPendingJobs.fromJson(response.data);
        spPendingJobs = data;
      }
      return right(spPendingJobs);
    } on DioError catch (e) {
      if (e.type == DioErrorType.RESPONSE) {
        print(e.message);
        return left(const SPDetailsFailure.serverError());
      } else if (e.type == DioErrorType.DEFAULT && e.error is SocketException) {
        print(e.message);
        return left(const SPDetailsFailure.noInternet());
      } else {
        return left(const SPDetailsFailure.serverError());
      }
    }
  }

  @override
  Future<Either<SPDetailsFailure, SpNewJobs>> getNewJobs({String id}) async {
    try {
      SpNewJobs spNewJobs;
      var accesstoken = await _secure.read(key: ACCESS_TOKEN);
      _dio.interceptors.add(_dioCacheManager.interceptor);
      Response response = await _dio.get(
        'https://bonyezakazi.com/api/v1/jobs_new/$id',
        options: Options(
          responseType: ResponseType.json,
          receiveTimeout: 3000,
          sendTimeout: 5000,
          headers: {
            "Accept": "application/json",
            "content-type": "application/json",
            "Authorization": "Bearer " + accesstoken,
          },
        ),
      );

      if (response.statusCode == 200) {
        var data = SpNewJobs.fromJson(response.data);
        spNewJobs = data;
      }
      return right(spNewJobs);
    } on DioError catch (e) {
      if (e.type == DioErrorType.RESPONSE) {
        print(e.message);
        return left(const SPDetailsFailure.serverError());
      } else if (e.type == DioErrorType.DEFAULT && e.error is SocketException) {
        print(e.message);
        return left(const SPDetailsFailure.noInternet());
      } else {
        return left(const SPDetailsFailure.serverError());
      }
    }
  }

  @override
  Future<Either<SPDetailsFailure, SpPaidJobs>> getPaidJobs({String id}) async {
    try {
      SpPaidJobs spPaidJobs;
      var accesstoken = await _secure.read(key: ACCESS_TOKEN);
      _dio.interceptors.add(_dioCacheManager.interceptor);
      Response response = await _dio.get(
        'https://bonyezakazi.com/api/v1/jobs_paid/$id',
        options: Options(
          responseType: ResponseType.json,
          receiveTimeout: 3000,
          sendTimeout: 5000,
          headers: {
            "Accept": "application/json",
            "content-type": "application/json",
            "Authorization": "Bearer " + accesstoken,
          },
        ),
      );

      if (response.statusCode == 200) {
        var data = SpPaidJobs.fromJson(response.data);
        spPaidJobs = data;
      }
      return right(spPaidJobs);
    } on DioError catch (e) {
      if (e.type == DioErrorType.RESPONSE) {
        print(e.message);
        return left(const SPDetailsFailure.serverError());
      } else if (e.type == DioErrorType.DEFAULT && e.error is SocketException) {
        print(e.message);
        return left(const SPDetailsFailure.noInternet());
      } else {
        return left(const SPDetailsFailure.serverError());
      }
    }
  }

  @override
  Future<Either<SPDetailsFailure, SpRejectedJobs>> getRejectedJobs(
      {String id}) async {
    try {
      SpRejectedJobs spRejectedJobs;
      var accesstoken = await _secure.read(key: ACCESS_TOKEN);
      _dio.interceptors.add(_dioCacheManager.interceptor);
      Response response = await _dio.get(
        'https://bonyezakazi.com/api/v1/jobs_rejected/$id',
        options: Options(
          responseType: ResponseType.json,
          receiveTimeout: 3000,
          sendTimeout: 5000,
          headers: {
            "Accept": "application/json",
            "content-type": "application/json",
            "Authorization": "Bearer " + accesstoken,
          },
        ),
      );

      if (response.statusCode == 200) {
        var data = SpRejectedJobs.fromJson(response.data);
        spRejectedJobs = data;
      }
      return right(spRejectedJobs);
    } on DioError catch (e) {
      if (e.type == DioErrorType.RESPONSE) {
        print(e.message);
        return left(const SPDetailsFailure.serverError());
      } else if (e.type == DioErrorType.DEFAULT && e.error is SocketException) {
        print(e.message);
        return left(const SPDetailsFailure.noInternet());
      } else {
        return left(const SPDetailsFailure.serverError());
      }
    }
  }

  @override
  Future<Either<SPDetailsFailure, SpUnpaidJobs>> getUnpaidJobs(
      {String id}) async {
    try {
      SpUnpaidJobs spUnpaidJobs;
      var accesstoken = await _secure.read(key: ACCESS_TOKEN);
      _dio.interceptors.add(_dioCacheManager.interceptor);
      Response response = await _dio.get(
        'https://bonyezakazi.com/api/v1/jobs_unpaid/$id',
        options: Options(
          responseType: ResponseType.json,
          receiveTimeout: 3000,
          sendTimeout: 5000,
          headers: {
            "Accept": "application/json",
            "content-type": "application/json",
            "Authorization": "Bearer " + accesstoken,
          },
        ),
      );

      if (response.statusCode == 200) {
        var data = SpUnpaidJobs.fromJson(response.data);
        spUnpaidJobs = data;
      }
      return right(spUnpaidJobs);
    } on DioError catch (e) {
      if (e.type == DioErrorType.RESPONSE) {
        print(e.message);
        return left(const SPDetailsFailure.serverError());
      } else if (e.type == DioErrorType.DEFAULT && e.error is SocketException) {
        print(e.message);
        return left(const SPDetailsFailure.noInternet());
      } else {
        return left(const SPDetailsFailure.serverError());
      }
    }
  }

  @override
  Future<Either<SPDetailsFailure, SpBalance>> getSPBalance(
      {String phone}) async {
    try {
      SpBalance spBalance;
      var accesstoken = await _secure.read(key: ACCESS_TOKEN);

      Response response = await _dio.post(
        'http://34.76.46.9/majobs_payment/api/v1/balance',
        data: {"msisdn": phone},
        options: Options(
          responseType: ResponseType.json,
          receiveTimeout: 3000,
          sendTimeout: 5000,
          headers: {
            "Accept": "application/json",
            "content-type": "application/json",
            "Authorization": "Bearer " + accesstoken,
          },
        ),
      );

      if (response.statusCode == 200) {
        var data = SpBalance.fromJson(response.data);
        spBalance = data;
      }
      return right(spBalance);
    } on DioError catch (e) {
      if (e.type == DioErrorType.RESPONSE) {
        print(e.message);
        return left(const SPDetailsFailure.serverError());
      } else if (e.type == DioErrorType.DEFAULT && e.error is SocketException) {
        print(e.message);
        return left(const SPDetailsFailure.noInternet());
      } else {
        return left(const SPDetailsFailure.serverError());
      }
    }
  }

  @override
  Future<Either<SPDetailsFailure, Unit>> spWithdrawsMoney(
      {String phone, int amount}) async {
    try {
      var accesstoken = await _secure.read(key: ACCESS_TOKEN);

      await _dio.post(
        'http://34.76.46.9/majobs_payment/api/v1/withdraw',
        data: {"msisdn": phone, "amount": amount},
        options: Options(
          responseType: ResponseType.json,
          receiveTimeout: 3000,
          sendTimeout: 5000,
          headers: {
            "Accept": "application/json",
            "content-type": "application/json",
            "Authorization": "Bearer " + accesstoken,
          },
        ),
      );

      return right(unit);
    } on DioError catch (e) {
      if (e.type == DioErrorType.RESPONSE) {
        print(e.message);
        return left(const SPDetailsFailure.serverError());
      } else if (e.type == DioErrorType.DEFAULT && e.error is SocketException) {
        print(e.message);
        return left(const SPDetailsFailure.noInternet());
      } else {
        return left(const SPDetailsFailure.serverError());
      }
    }
  }
}
