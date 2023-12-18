import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:white_rabbit_challenge/domain/core/remote/url/url_pool.dart';

import 'interceptors/loging_interceptor.dart';

@module
abstract class DioModule {
  @lazySingleton
  Dio get dio => Dio();
}

@singleton
class DioPostMan {
  final Dio dio;
  final URLPool url;

  DioPostMan(this.dio, this.url) {
    dio.options = BaseOptions(
      baseUrl: url.baseUrlWithVersion,
      // headers: await getCustomheader(),
      responseType: ResponseType.plain,
      contentType: Headers.jsonContentType,
      //connectTimeout: 10000,
      //receiveTimeout: 10000,
    );
    dio.interceptors.add(DioLoggingInterceptor());
  }

  Future<Options> _dioOptions() async {
    return Options(
      headers: await getCustomheader(),
      responseType: ResponseType.plain,
      contentType: Headers.jsonContentType,
    );
  }

  Future<Map<String, String>> getCustomheader() async {
    final header = <String, String>{
      //'Content-type': 'application/json',
      // 'Access-Control-Allow-Origin': '*',
      // 'Access-Control-Allow-Headers': 'Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale',
      // 'Access-Control-Allow-Methods': 'POST, OPTIONS, GET, PUT, DELETE'
    };
    return header;
  }

  Future<Response<String>> sendGetRequest({
    required String url,
    Map<String, dynamic> queryParameters = const {},
  }) async {
    return dio.get(
      url,
      queryParameters: queryParameters,
      options: await _dioOptions(),
      onReceiveProgress: (current, total) {},
    );
  }

  Future<Response<String>> sendPostRequest({
    required String url,
    required Map<String, dynamic> body,
    Map<String, dynamic> queryParameters = const {},
  }) async {
    return dio.post(
      url,
      options: await _dioOptions(),
      data: jsonEncode(body),
      queryParameters: queryParameters,
      onSendProgress: (current, total) {},
      onReceiveProgress: (current, total) {},
    );
  }

  Future<Response<String>> sendPutRequest({
    required String url,
    required Map<String, dynamic> body,
  }) async {
    return dio.put(
      url,
      options: await _dioOptions(),
      data: jsonEncode(body),
      onSendProgress: (current, total) {},
      onReceiveProgress: (current, total) {},
    );
  }

  Future<Response<String>> sendDeleteRequest({
    required String url,
    required Map<String, dynamic> body,
  }) async {
    return dio.delete(
      url,
      options: await _dioOptions(),
    );
  }

  Future<Response<String>> sendMultipartRequest({
    required String url,
    required Map<String, dynamic> body,
    String requestType = 'POST',
    required void Function(double) progressPercentage,
  }) async {
    final formData = FormData.fromMap(body);
    if (requestType == 'POST') {
      return dio.post(
        url,
        data: formData,
        options: await _dioOptions(),
        onSendProgress: (current, total) {
          //customLog(' DIO SND Progress $current/$total');
          if (total >= current) {
            progressPercentage(current / total);
          }
        },
        onReceiveProgress: (current, total) {},
      );
    } else if (requestType == 'PUT') {
      return dio.put(
        url,
        data: formData,
        options: await _dioOptions(),
        onSendProgress: (current, total) {
          //customLog(' DIO SND Progress $current/$total');
          if (total >= current) {
            progressPercentage(current / total);
          }
        },
        onReceiveProgress: (current, total) {},
      );
    } else {
      return dio.delete(
        url,
        data: formData,
        options: await _dioOptions(),
      );
    }
  }
}
