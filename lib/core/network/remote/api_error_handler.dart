import 'package:dio/dio.dart';
import 'package:iraqi_chemists_syndicate_law/core/lang/localization_service.dart';
import 'api_error_model.dart';

class ApiErrorHandler implements Exception {
  static ApiErrorModel handle(dynamic error) {
    final s = LocalizationService.instance.strings;

    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionError:
          return ApiErrorModel(message: s.error_connection);

        case DioExceptionType.connectionTimeout:
          return ApiErrorModel(message: s.error_connection_timeout);

        case DioExceptionType.cancel:
          return ApiErrorModel(message: s.error_cancelled);

        case DioExceptionType.receiveTimeout:
          return ApiErrorModel(message: s.error_receive_timeout);

        case DioExceptionType.unknown:
          return ApiErrorModel(message: s.error_unknown);

        case DioExceptionType.sendTimeout:
          return ApiErrorModel(message: s.error_send_timeout);

        case DioExceptionType.badResponse:
          return _handleError(error.response?.statusCode ?? 0);

        default:
          return ApiErrorModel(message: s.error_default);
      }
    } else {
      return ApiErrorModel(message: s.error_unknown_occurred);
    }
  }
}

ApiErrorModel _handleError(int? statusCode) {
  final s = LocalizationService.instance.strings;

  switch (statusCode) {
    case 400:
      return ApiErrorModel(message: s.error_bad_request);
    case 401:
      return ApiErrorModel(message: s.error_unauthorized);
    case 403:
      return ApiErrorModel(message: s.error_forbidden);
    case 404:
      return ApiErrorModel(message: s.error_not_found);
    case 500:
      return ApiErrorModel(message: s.error_server);
    default:
      return ApiErrorModel(message: s.error_bad_response);
  }
}
