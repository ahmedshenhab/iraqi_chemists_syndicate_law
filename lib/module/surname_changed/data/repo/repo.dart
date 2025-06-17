import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:iraqi_chemists_syndicate_law/core/network/remote/api_endpoint.dart';
import 'package:iraqi_chemists_syndicate_law/core/network/remote/api_error_handler.dart';
import 'package:iraqi_chemists_syndicate_law/core/network/remote/api_error_model.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class SurnameRepo {
  SurnameRepo({required Dio dio}) : _dio = dio;

  final Dio _dio;

  Future<Either<ApiErrorModel, String>> changeSurname({
    required String enrollNumberId,
    required String enrollExpireDate,
    required String currentTittle,
    required String pormotionTittle,
    required String filePath,
    required String fileName,
  }) async {
    final data = FormData.fromMap({
      'ExperienseCertificateImage': await MultipartFile.fromFile(
        filePath,
        filename: fileName,
      ),
      'EnrollNumberId': enrollNumberId,
      'EnrollExpireDate': enrollExpireDate,
      'CurrentTittle': currentTittle,
      'PormotionTittle': pormotionTittle,
      'UserId': '${JwtDecoder.decode(ApiEndpoint.token)[ApiEndpoint.userId]}',
      'Status': 'painding',
    });

    try {
      await _dio.post(ApiEndpoint.pormotion, data: data);

      return const Right('تم التسجيل بنجاح');
    } catch (e) {
      return Left(ApiErrorHandler.handle(e));
    }
  }
}
