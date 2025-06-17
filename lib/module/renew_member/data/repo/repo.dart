import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:iraqi_chemists_syndicate_law/core/network/remote/api_endpoint.dart';
import 'package:iraqi_chemists_syndicate_law/core/network/remote/api_error_handler.dart';
import 'package:iraqi_chemists_syndicate_law/core/network/remote/api_error_model.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class RenewMemberRepo {
  RenewMemberRepo({required Dio dio}) : _dio = dio;

  final Dio _dio;

  Future<Either<ApiErrorModel, String>> renewMember({
    required String enrollNumberId,
    required String enrollExpireDate,

    required String filePath,
    required String fileName,
  }) async {
    final data = FormData.fromMap({
      'IdentityCard': await MultipartFile.fromFile(
        filePath,
        filename: fileName,
      ),
      'EnrollNumberId': enrollNumberId,
      'EnrollExpireDate': enrollExpireDate,
      'OrderDate': enrollExpireDate,

      'UserId': '${JwtDecoder.decode(ApiEndpoint.token)[ApiEndpoint.userId]}',
      'Status': 'painding',
    });

    try {
      await _dio.post(ApiEndpoint.renew, data: data);

      return const Right('تم التسجيل بنجاح');
    } catch (e) {
      return Left(ApiErrorHandler.handle(e));
    }
  }
}
