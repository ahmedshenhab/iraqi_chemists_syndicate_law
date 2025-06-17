import 'package:dio/dio.dart';

import 'package:get_it/get_it.dart';
import 'package:iraqi_chemists_syndicate_law/core/network/remote/interceptor/app_interceptor.dart';
import 'package:iraqi_chemists_syndicate_law/core/network/remote/interceptor/logger_interceptor.dart';
import 'package:iraqi_chemists_syndicate_law/module/membership_registeration/data/repo/repo.dart';
import 'package:iraqi_chemists_syndicate_law/module/renew_member/data/repo/repo.dart';
import 'package:iraqi_chemists_syndicate_law/module/surname_changed/data/repo/repo.dart';
import '../network/remote/dio_helper.dart';

final GetIt getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerLazySingleton<Dio>(() => DioHelper.init);
  getIt.registerLazySingleton<AppInterceptor>(() => AppInterceptor());
  getIt.registerLazySingleton<LoggerInterceptor>(() => LoggerInterceptor());
  getIt.registerLazySingleton<SurnameRepo>(
    () => SurnameRepo(dio: getIt<Dio>()),
  );
  getIt.registerLazySingleton<RenewMemberRepo>(
    () => RenewMemberRepo(dio: getIt<Dio>()),
  );
  getIt.registerLazySingleton<MembershipRegisterationRepo>(
    () => MembershipRegisterationRepo(dio: getIt<Dio>()),
  );


  // login

  // getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(dio: getIt<Dio>()));
}
