import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:iraqi_chemists_syndicate_law/core/network/remote/api_endpoint.dart';
import 'package:iraqi_chemists_syndicate_law/core/network/remote/api_error_handler.dart';
import 'package:iraqi_chemists_syndicate_law/core/network/remote/api_error_model.dart';
import 'package:iraqi_chemists_syndicate_law/module/membership_registeration/data/model/memeber_request_model.dart';

class MembershipRegisterationRepo {
  MembershipRegisterationRepo({required Dio dio}) : _dio = dio;
  final Dio _dio;

  Future<Either<ApiErrorModel, String>> createMember({
    required MemeberRequestModel memeberRequestModel,
  }) async {
    final data = await memeberRequestModel.toFormData();

    try {
      await _dio.post(
        ApiEndpoint.creat,
        data: data,
        onSendProgress: (count, total) =>
            log(((count / total) * 100.toInt()).toString()),
      );

      return const Right('تم التسجيل بنجاح');
    } catch (e) {
      return Left(ApiErrorHandler.handle(e));
    }
  }
}
