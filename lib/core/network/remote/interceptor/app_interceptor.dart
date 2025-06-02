 import 'package:dio/dio.dart';

class AppInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // options.headers.putIfAbsent(
    //   'Accept-Language',
    //   () => ui.PlatformDispatcher.instance.locale.languageCode,
    // );

    super.onRequest(options, handler);
  }



}