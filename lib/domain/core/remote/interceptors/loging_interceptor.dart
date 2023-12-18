import 'package:dio/dio.dart';
import '../../log/custom_log.dart';

class DioLoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    customLog(
        'DIO REQUEST[${options.method}] => PATH: ${options.uri.host}${options.uri.path}\nQUERY : ${options.queryParameters}');
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    customLog(
      'DIO RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}\n BODY: ${response.data}',
    );
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    customLog(
      'DIO ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}\n BODY: ${err.response?.data}',
    );
    return super.onError(err, handler);
  }
}
