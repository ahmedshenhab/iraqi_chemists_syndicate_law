import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:iraqi_chemists_syndicate_law/core/network/remote/api_endpoint.dart';
import 'package:iraqi_chemists_syndicate_law/core/network/remote/api_error_handler.dart';
import 'package:iraqi_chemists_syndicate_law/core/network/remote/api_error_model.dart';
import 'package:iraqi_chemists_syndicate_law/module/surname_changed/data/model/surname_request_model.dart';

class SurnameRepo {
  SurnameRepo({required Dio dio}) : _dio = dio;

  final Dio _dio;

  Future<Either<ApiErrorModel, String>> changeSurname(
    SurnameChangedModel model
    
  ) async {
    final data = await model.toFormData();

    try {
      await _dio.post(ApiEndpoint.pormotion, data: data);

      return const Right('تم التسجيل بنجاح');
    } catch (e) {
      return Left(ApiErrorHandler.handle(e));
    }
  }
}
