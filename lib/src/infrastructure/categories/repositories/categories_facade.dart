import 'dart:io';
import 'package:bonyeza_kazi/common/constants/strings.dart';
import 'package:bonyeza_kazi/common/failures/categories_failure.dart';
import 'package:bonyeza_kazi/common/failures/search_failure.dart';
import 'package:bonyeza_kazi/src/domain/categories/i_categories_interface.dart';
import 'package:bonyeza_kazi/src/infrastructure/categories/models/casual_categories_model.dart';
import 'package:bonyeza_kazi/src/infrastructure/categories/models/service_provider_search_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as secure;
import 'package:injectable/injectable.dart';
import 'package:kt_dart/kt.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton(as: ICasualCategoriesFacade)
class CategoriesFacade implements ICasualCategoriesFacade {
  CategoriesFacade(this._dio, this._secure, this._dioCacheManager, this._prefs);
  final Dio _dio;
  final secure.FlutterSecureStorage _secure;
  final SharedPreferences _prefs;
  final DioCacheManager _dioCacheManager;
  @override
  Future<Either<CategoriesFailure, KtList<Categories>>>
      getAllCategories() async {
    try {
      KtList<Categories> categoriesList;
      var accesstoken = await _secure.read(key: ACCESS_TOKEN);
      print(accesstoken);
      Options _cacheOptions = buildCacheOptions(Duration(days: 7));
      _dio.interceptors.add(_dioCacheManager.interceptor);
      Response response = await _dio.get(
        'https://bonyezakazi.com/api/v1/casualCategories',
        options: _cacheOptions.merge(
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
        var data = CasualCategoriesModel.fromJson(response.data);
        categoriesList = data.data.toImmutableList();
        var kallCategories = categoriesList.asList();
        List<String> storeList = [];
        for (var category in kallCategories) {
          storeList.add(category.name);
        }
        await _prefs.setStringList(LIST_OF_CATEGORIES, storeList);
        var liste = _prefs.getStringList(LIST_OF_CATEGORIES);
      }

      return right(categoriesList);
    } on DioError catch (e) {
      if (e.type == DioErrorType.RESPONSE) {
        print(e.message);
        return left(const CategoriesFailure.serverError());
      } else if (e.type == DioErrorType.DEFAULT && e.error is SocketException) {
        print(e.message);
        return left(const CategoriesFailure.noInternet());
      } else {
        return left(const CategoriesFailure.serverError());
      }
    }
  }

  @override
  Future<Either<SearchFailure, KtList<ServiceProvider>>>
      searchForServiceProviders(
          {String skills, String location, String rating}) async {
    try {
      KtList<ServiceProvider> serviceProviderList;

      FormData formData = FormData.fromMap(
          {"location": location, "skills": skills, "rating": rating});

      Response response = await _dio.post(
          'https://bonyezakazi.com/api/v1/search_kibarua',
          data: formData,
          options: Options(
              responseType: ResponseType.json,
              receiveTimeout: 3000,
              sendTimeout: 5000,
              headers: {
                "Accept": "application/json",
                "content-type": "application/json",
              }));

      if (response.statusCode == 200) {
        var data = ServiceProviderSearchModel.fromJson(response.data);
        serviceProviderList = data.data.toImmutableList();
      }

      return right(serviceProviderList);
    } on DioError catch (e) {
      if (e.type == DioErrorType.RESPONSE) {
        print(e.message);
        return left(const SearchFailure.serverError());
      } else if (e.type == DioErrorType.DEFAULT && e.error is SocketException) {
        print(e.message);
        return left(const SearchFailure.noInternet());
      } else {
        return left(const SearchFailure.serverError());
      }
    }
  }
}
