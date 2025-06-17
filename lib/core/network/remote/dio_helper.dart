// ignore_for_file: avoid_redundant_argument_values

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:iraqi_chemists_syndicate_law/core/app_constant.dart';
import 'package:iraqi_chemists_syndicate_law/core/di/di.dart';
import 'package:iraqi_chemists_syndicate_law/core/network/remote/api_endpoint.dart';
import 'package:iraqi_chemists_syndicate_law/core/network/remote/interceptor/app_interceptor.dart';
import 'package:iraqi_chemists_syndicate_law/core/network/remote/interceptor/logger_interceptor.dart';
import 'package:iraqi_chemists_syndicate_law/core/services/shared_prefrence/cach_helper.dart';

class DioHelper {
  DioHelper._();
  static Dio? _dio;

  static Dio get init {
    {
      if (_dio == null) {
        _dio = Dio(
          BaseOptions(
            receiveDataWhenStatusError: true,

            connectTimeout: const Duration(seconds: 30),
            receiveTimeout: const Duration(seconds: 30),
            headers: {
              'Accept-Language': 'ar',

              'Authorization':
                  'Bearer ${CachHelper.getData(key: AppConstant.tokenKey)}',
            },

            baseUrl: ApiEndpoint.baseUrl,
          ),
        );
        _dio?.interceptors.add(getIt<AppInterceptor>());

        if (kDebugMode) {
          _dio?.interceptors.add(getIt<LoggerInterceptor>());
        }

        return _dio!;
      }

      return _dio!;
    }
  }
}
