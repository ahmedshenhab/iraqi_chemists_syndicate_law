
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:iraqi_chemists_syndicate_law/core/network/remote/api_endpoint.dart';
import 'package:iraqi_chemists_syndicate_law/core/network/remote/api_error_handler.dart';
import 'package:iraqi_chemists_syndicate_law/core/network/remote/api_error_model.dart';
import 'package:iraqi_chemists_syndicate_law/module/renew_member/data/model/renew_request_model.dart';

class RenewMemberRepo {
  RenewMemberRepo({required Dio dio}) : _dio = dio;

  final Dio _dio;

  Future<Either<ApiErrorModel, String>> renewMember({
    required RenewRequestModel renewrequestModel,
  }) async {
    final data = await renewrequestModel.toFormData();

    try {
      await _dio.post(ApiEndpoint.renew, data: data);

      return const Right('تم التسجيل بنجاح');
    } catch (e) {
      return Left(ApiErrorHandler.handle(e));
    }
  }
}
