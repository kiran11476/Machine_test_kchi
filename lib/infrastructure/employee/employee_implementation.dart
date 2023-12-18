import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:white_rabbit_challenge/domain/core/remote/exceptions/network_exceptions.dart';
import 'package:white_rabbit_challenge/domain/employee/employee_service.dart';
import 'package:white_rabbit_challenge/domain/employee/models/model_person_list_response.dart';

import '../../domain/core/remote/connectivity/internet_connectivity.dart';
import '../../domain/core/remote/dioman.dart';
import '../../domain/core/remote/url/url_pool.dart';

@LazySingleton(as: EmployeeService)
class EmployeeImplementation implements EmployeeService {
  final InternetConnectivity _internetConnectivity;
  final DioPostMan _dio;
  final URLPool _url;

  EmployeeImplementation(
    this._internetConnectivity,
    this._dio,
    this._url,
  );

  @override
  Future<Either<NetworkExceptions, List<ModelEmployeeData>>>
      getEmployeesList() async {
    if (await _internetConnectivity.isNotConnectedToInternet()) {
      return left(const NoInternet());
    }
    try {
      final response = await _dio.sendGetRequest(url: _url.getEmployees);
      if (response.statusCode == 200 && response.data != null) {
        final bodyAsMap = jsonDecode(response.data!) as List<dynamic>;
        final list = bodyAsMap.map((e) {
          return ModelEmployeeData.fromJson(e as Map<String, dynamic>);
        });
        return right(list.toList());
      } else {
        return left(getExceptionFromStatusCode(response.statusCode!));
      }
    } on DioError catch (e) {
      if (e.response != null && e.response!.statusCode != null) {
        return left(getExceptionFromStatusCode(e.response!.statusCode!));
      } else {
        return left(UnKnownError(e.toString()));
      }
    } catch (e) {
      return left(UnKnownError(e.toString()));
    }
  }
}
