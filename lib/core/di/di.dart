import 'package:dio/dio.dart';

import 'package:get_it/get_it.dart';
import 'package:iraqi_chemists_syndicate_law/core/network/remote/interceptor/app_interceptor.dart';
import 'package:iraqi_chemists_syndicate_law/core/network/remote/interceptor/logger_interceptor.dart';
import '../network/remote/dio_helper.dart';

final GetIt getIt = GetIt.instance;

  void setupGetIt() {
  getIt.registerLazySingleton<Dio>(() => DioHelper.init);
  getIt.registerLazySingleton<AppInterceptor>(() => AppInterceptor());
  getIt.registerLazySingleton<LoggerInterceptor>(() => LoggerInterceptor());

  // login

  // getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(dio: getIt<Dio>()));

  

}
