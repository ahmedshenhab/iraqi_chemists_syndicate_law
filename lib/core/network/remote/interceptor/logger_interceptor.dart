import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';

class LoggerInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final buffer = StringBuffer();
    buffer.writeln('🔵🔵🔵 REQUEST 🔵🔵🔵');
    buffer.writeln('➡️ URI       : ${options.uri}');
    buffer.writeln('➡️ METHOD    : ${options.method}');
    buffer.writeln('➡️ HEADERS   :');
    options.headers.forEach((k, v) => buffer.writeln('   • $k: $v'));
    buffer.writeln('➡️ BODY      : ${options.data}');
    buffer.writeln('🔵🔵🔵 END REQUEST 🔵🔵🔵');
    log(buffer.toString());
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final buffer = StringBuffer();
    buffer.writeln('🟢🟢🟢 RESPONSE 🟢🟢🟢');
    buffer.writeln('✅ STATUS    : ${response.statusCode}');
    buffer.writeln('✅ URI       : ${response.requestOptions.uri}');
    buffer.writeln('✅ DATA      : ${_prettyJson(response.data)}');
    buffer.writeln('🟢🟢🟢 END RESPONSE 🟢🟢🟢');
    log(buffer.toString());
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final buffer = StringBuffer();
    buffer.writeln('🔴🔴🔴 ERROR 🔴🔴🔴');
    buffer.writeln('❌ URI       : ${err.requestOptions.uri}');
    buffer.writeln('❌ MESSAGE   : ${err.message}');
    buffer.writeln('❌ STATUS    : ${err.response?.statusCode}');
    buffer.writeln('❌ RESPONSE  : ${_prettyJson(err.response?.data)}');
    buffer.writeln('🔴🔴🔴 END ERROR 🔴🔴🔴');
    log(buffer.toString());
    super.onError(err, handler);
  }

  String _prettyJson(dynamic data) {
    try {
      if (data is Map || data is List) {
        return const JsonEncoder.withIndent('  ').convert(data);
      }
      return data.toString();
    } catch (e) {
      return data.toString();
    }
  }
}
