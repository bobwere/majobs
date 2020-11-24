import 'dart:convert';
import 'dart:io';
import 'package:bonyeza_kazi/common/constants/strings.dart';
import 'package:bonyeza_kazi/common/failures/job_description_failure.dart';
import 'package:bonyeza_kazi/common/failures/job_journey_failure.dart';
import 'package:bonyeza_kazi/src/domain/job_journey/i_job_journey_interface.dart';
import 'package:bonyeza_kazi/src/infrastructure/job_journey/models/job_description_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as secure;
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:http/http.dart' as http;

@LazySingleton(as: IJobJourneyFacade)
class JobJourneyFacade implements IJobJourneyFacade {
  JobJourneyFacade(this._dio, this._secure);

  final Dio _dio;
  final secure.FlutterSecureStorage _secure;

  @override
  Future<Either<JobDescriptionFailure, JobDescription>> clientJobDescription(
      {String description,
      String bookingDate,
      String bookingTime,
      String location,
      String workTitle,
      String workerId,
      String agreedPrice,
      String placeDescription,
      String clientId,
      List<MultipartFile> workTodoPhotos}) async {
    try {
      JobDescription jobDescription;
      var accesstoken = await _secure.read(key: ACCESS_TOKEN);

      FormData formData = FormData.fromMap({
        "description": description,
        "booking_date": bookingDate,
        "booking_time": bookingTime,
        "place_description": placeDescription,
        "location": location,
        "worker_id": workerId,
        "work_todo_images": [...workTodoPhotos],
        "work_title": workTitle,
      });

      Response response = await _dio.post(
        'https://bonyezakazi.com/api/v1/descWork',
        data: formData,
        options: Options(
          responseType: ResponseType.json,
          receiveTimeout: 3000,
          sendTimeout: 5000,
          headers: {
            "Accept": "application/json",
            // "content-type": "application/octet-stream",
            "Authorization": "Bearer " + accesstoken,
          },
        ),
      );

      if (response.statusCode == 201) {
        var data = JobDescriptionModel.fromJson(response.data);
        print(data.data.bookingDate);

        jobDescription = data.data;
      }

      return right(jobDescription);
    } on DioError catch (e) {
      if (e.type == DioErrorType.RESPONSE) {
        print(e.message);
        return left(const JobDescriptionFailure.serverError());
      } else if (e.type == DioErrorType.DEFAULT && e.error is SocketException) {
        print(e.message);
        return left(const JobDescriptionFailure.noInternet());
      } else {
        return left(const JobDescriptionFailure.serverError());
      }
    }
  }

  @override
  Future<Either<JobJourneyFailure, Unit>> spAcceptsJob({String workID}) async {
    try {
      var accesstoken = await _secure.read(key: ACCESS_TOKEN);

      await _dio.get(
        'https://bonyezakazi.com/api/v1/acceptWork/$workID',
        options: Options(
          responseType: ResponseType.json,
          receiveTimeout: 8000,
          sendTimeout: 8000,
          headers: {
            "Accept": "application/json",
            "content-type": "application/octet-stream",
            "Authorization": "Bearer " + accesstoken,
          },
        ),
      );

      return right(unit);
    } on DioError catch (e) {
      if (e.type == DioErrorType.RESPONSE) {
        print(e.message);
        return left(const JobJourneyFailure.serverError());
      } else if (e.type == DioErrorType.DEFAULT && e.error is SocketException) {
        print(e.message);
        return left(const JobJourneyFailure.noInternet());
      } else {
        return left(const JobJourneyFailure.serverError());
      }
    }
  }

  @override
  Future<Either<JobJourneyFailure, Unit>> spCompletesJob(
      {String workID, List<MultipartFile> workDoneImages}) async {
    try {
      var accesstoken = await _secure.read(key: ACCESS_TOKEN);

      await _dio.post(
        'https://bonyezakazi.com/api/v1/finishWork/$workID',
        data: FormData.fromMap({
          "work_done_images": [...workDoneImages]
        }),
        options: Options(
          responseType: ResponseType.json,
          receiveTimeout: 5000,
          sendTimeout: 3000,
          headers: {
            // "Accept": "application/json",
            //"Content-Type": "multipart/form-data",
            "Authorization": "Bearer " + accesstoken,
          },
        ),
      );

      return right(unit);
    } on DioError catch (e) {
      if (e.type == DioErrorType.RESPONSE) {
        print(e.message);
        return left(const JobJourneyFailure.serverError());
      } else if (e.type == DioErrorType.DEFAULT && e.error is SocketException) {
        print(e.message);
        return left(const JobJourneyFailure.noInternet());
      } else {
        return left(const JobJourneyFailure.serverError());
      }
    }
  }

  @override
  Future<Either<JobJourneyFailure, Unit>> clientRatesJobDone(
      {String workID, String rate, String clientcomments}) async {
    try {
      var accesstoken = await _secure.read(key: ACCESS_TOKEN);

      await _dio.post(
        'https://bonyezakazi.com/api/v1/rateWorker',
        data: {
          'work': workID,
          'rating': rate,
          'client_comments': clientcomments
        },
        options: Options(
          responseType: ResponseType.json,
          contentType: Headers.formUrlEncodedContentType,
          receiveTimeout: 5000,
          sendTimeout: 3000,
          headers: {
            "Accept": "application/json",
            "Authorization": "Bearer " + accesstoken,
          },
        ),
      );

      return right(unit);
    } on DioError catch (e) {
      if (e.type == DioErrorType.RESPONSE) {
        print(e.message);
        return left(const JobJourneyFailure.serverError());
      } else if (e.type == DioErrorType.DEFAULT && e.error is SocketException) {
        print(e.message);
        return left(const JobJourneyFailure.noInternet());
      } else {
        return left(const JobJourneyFailure.serverError());
      }
    }
  }

  @override
  Future<Either<JobJourneyFailure, Unit>> workerRatesClient(
      {String workID, String rate, String workercomments}) async {
    try {
      var accesstoken = await _secure.read(key: ACCESS_TOKEN);

      await _dio.post(
        'https://bonyezakazi.com/api/v1/rateWorker',
        data: {
          'work': workID,
          'rating': rate,
          'worker_comments': workercomments
        },
        options: Options(
          responseType: ResponseType.json,
          contentType: Headers.formUrlEncodedContentType,
          receiveTimeout: 5000,
          sendTimeout: 3000,
          headers: {
            "Accept": "application/json",
            "Authorization": "Bearer " + accesstoken,
          },
        ),
      );

      return right(unit);
    } on DioError catch (e) {
      if (e.type == DioErrorType.RESPONSE) {
        print(e.message);
        return left(const JobJourneyFailure.serverError());
      } else if (e.type == DioErrorType.DEFAULT && e.error is SocketException) {
        print(e.message);
        return left(const JobJourneyFailure.noInternet());
      } else {
        return left(const JobJourneyFailure.serverError());
      }
    }
  }

  @override
  Future<Either<JobJourneyFailure, Unit>> clientConfirmsPriceOfJob(
      {String workID}) async {
    try {
      var accesstoken = await _secure.read(key: ACCESS_TOKEN);

      await _dio.get(
        'https://bonyezakazi.com/api/v1/confirmPrice/$workID',
        options: Options(
          responseType: ResponseType.json,
          receiveTimeout: 5000,
          sendTimeout: 3000,
          headers: {
            "content-type": "application/json",
            "Authorization": "Bearer " + accesstoken,
          },
        ),
      );

      return right(unit);
    } on DioError catch (e) {
      if (e.type == DioErrorType.RESPONSE) {
        print(e.message);
        return left(const JobJourneyFailure.serverError());
      } else if (e.type == DioErrorType.DEFAULT && e.error is SocketException) {
        print(e.message);
        return left(const JobJourneyFailure.noInternet());
      } else {
        return left(const JobJourneyFailure.serverError());
      }
    }
  }

  @override
  Future<Either<JobJourneyFailure, Unit>> clientPaysWorker(
      {String amount, String msisdn, String workID}) async {
    try {
      var accesstoken = await _secure.read(key: ACCESS_TOKEN);

      final newMsisdn = msisdn.replaceAll('+', '');

      var response = await http.post(
        'https://bonyezakazi.com/api/v1/payWorker',
        body: jsonEncode(
            {'amount': amount, 'worker_msisdn': newMsisdn, 'work_id': workID}),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "Authorization": "Bearer $accesstoken",
        },
      );
      if (response.statusCode != 200) {
        print(
            "Request to url failed with status ${response.statusCode}: ${response.body}");
      }

      return right(unit);
    } on SocketException catch (e) {
      return left(const JobJourneyFailure.noInternet());
    } on Exception catch (e) {
      return left(const JobJourneyFailure.serverError());
    }
  }

  @override
  Future<Either<JobJourneyFailure, Unit>> spRejectsJob(
      {String workID, String reason}) async {
    try {
      var accesstoken = await _secure.read(key: ACCESS_TOKEN);

      await _dio.post(
        'https://bonyezakazi.com/api/v1/rejectWork/$workID',
        data: {"decline_reason": reason},
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
        return left(const JobJourneyFailure.serverError());
      } else if (e.type == DioErrorType.DEFAULT && e.error is SocketException) {
        print(e.message);
        return left(const JobJourneyFailure.noInternet());
      } else {
        return left(const JobJourneyFailure.serverError());
      }
    }
  }

  @override
  Future<Either<JobJourneyFailure, Unit>> spSetsPriceOfJob(
      {String workID, String agreedPrice, String workDuration}) async {
    try {
      var accesstoken = await _secure.read(key: ACCESS_TOKEN);

      var response = await http.post(
        'https://bonyezakazi.com/api/v1/negoPrice/$workID',
        body: jsonEncode({
          "agreed_price": agreedPrice,
          "work_duration": workDuration,
        }),
        headers: {
          "Content-Type": "application/octet-stream",
          "Accept": "application/json",
          "Authorization": "Bearer $accesstoken",
        },
      );
      if (response.statusCode != 200) {
        print(
            "Request to url failed with status ${response.statusCode}: ${response.body}");
      }

      return right(unit);
    } on SocketException catch (e) {
      return left(const JobJourneyFailure.noInternet());
    } on Exception catch (e) {
      return left(const JobJourneyFailure.serverError());
    }
  }

  @override
  Future<Either<JobJourneyFailure, Unit>> clientConfirmsTimeExtension(
      {String workID}) async {
    try {
      var accesstoken = await _secure.read(key: ACCESS_TOKEN);

      var response = await http.get(
        'https://bonyezakazi.com/api/v1/confirmAdjustTime/$workID',
        headers: {
          "Content-Type": "application/octet-stream",
          "Accept": "application/json",
          "Authorization": "Bearer $accesstoken",
        },
      );
      if (response.statusCode != 200) {
        print(
            "Request to url failed with status ${response.statusCode}: ${response.body}");
      }

      return right(unit);
    } on SocketException catch (e) {
      return left(const JobJourneyFailure.noInternet());
    } on Exception catch (e) {
      return left(const JobJourneyFailure.serverError());
    }
  }

  @override
  Future<Either<JobJourneyFailure, Unit>> spRequestTimeExtension(
      {String workID, String workDuration}) async {
    try {
      var accesstoken = await _secure.read(key: ACCESS_TOKEN);

      var response = await http.post(
        'https://bonyezakazi.com/api/v1/adjustTime/$workID',
        body: jsonEncode({
          "work_duration": workDuration,
        }),
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $accesstoken",
        },
      );
      if (response.statusCode != 200) {
        print(
            "Request to url failed with status ${response.statusCode}: ${response.body}");
      }

      return right(unit);
    } on SocketException catch (e) {
      return left(const JobJourneyFailure.noInternet());
    } on Exception catch (e) {
      return left(const JobJourneyFailure.serverError());
    }
  }

  @override
  Future<Either<JobJourneyFailure, Unit>> clientApprovesWork(
      {String workID}) async {
    try {
      var accesstoken = await _secure.read(key: ACCESS_TOKEN);

      var response = await http.get(
        'https://bonyezakazi.com/api/v1/approveWork/$workID',
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "Authorization": "Bearer $accesstoken",
        },
      );
      if (response.statusCode != 200) {
        print(
            "Request to url failed with status ${response.statusCode}: ${response.body}");
      }

      return right(unit);
    } on SocketException catch (e) {
      return left(const JobJourneyFailure.noInternet());
    } on Exception catch (e) {
      return left(const JobJourneyFailure.serverError());
    }
  }

  @override
  Future<Either<JobJourneyFailure, Unit>> clientRejectsWork(
      {String workID, String reason}) async {
    try {
      var accesstoken = await _secure.read(key: ACCESS_TOKEN);

      await _dio.post(
        'https://bonyezakazi.com/api/v1/disapproveWork/$workID',
        data: {"decline_reason": reason},
        options: Options(
          responseType: ResponseType.json,
          receiveTimeout: 8000,
          sendTimeout: 8000,
          headers: {
            "content-type": "application/json",
            "Authorization": "Bearer " + accesstoken,
          },
        ),
      );

      return right(unit);
    } on DioError catch (e) {
      if (e.type == DioErrorType.RESPONSE) {
        print(e.message);
        return left(const JobJourneyFailure.serverError());
      } else if (e.type == DioErrorType.DEFAULT && e.error is SocketException) {
        print(e.message);
        return left(const JobJourneyFailure.noInternet());
      } else {
        return left(const JobJourneyFailure.serverError());
      }
    }
  }
}
