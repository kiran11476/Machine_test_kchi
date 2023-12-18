// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:hive_flutter/hive_flutter.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;

import '../../../application/employee/employee_bloc.dart' as _i13;
import '../../../infrastructure/employee/employee_implementation.dart' as _i12;
import '../../../infrastructure/local_storage/local_storage_implementation.dart'
    as _i8;
import '../../employee/employee_service.dart' as _i11;
import '../../employee/models/model_person_list_response.dart' as _i4;
import '../../local_storage/local_storage_service.dart' as _i7;
import '../remote/connectivity/internet_connectivity.dart' as _i6;
import '../remote/dioman.dart' as _i10;
import '../remote/url/url_pool.dart'
    as _i9; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final localStorageModule = _$LocalStorageModule();
  final dioModule = _$DioModule();
  await gh.factoryAsync<_i3.Box<_i4.ModelEmployeeData>>(
      () => localStorageModule.employeeDB,
      preResolve: true);
  gh.lazySingleton<_i5.Dio>(() => dioModule.dio);
  gh.singleton<_i6.InternetConnectivity>(_i6.InternetConnectivity());
  gh.lazySingleton<_i7.LocalStorageService>(() =>
      _i8.LocalStorageImplementation(get<_i3.Box<_i4.ModelEmployeeData>>()));
  gh.singleton<_i9.URLPool>(_i9.URLPool());
  gh.singleton<_i10.DioPostMan>(
      _i10.DioPostMan(get<_i5.Dio>(), get<_i9.URLPool>()));
  gh.lazySingleton<_i11.EmployeeService>(() => _i12.EmployeeImplementation(
      get<_i6.InternetConnectivity>(),
      get<_i10.DioPostMan>(),
      get<_i9.URLPool>()));
  gh.factory<_i13.EmployeeBloc>(() => _i13.EmployeeBloc(
      get<_i11.EmployeeService>(), get<_i7.LocalStorageService>()));
  return get;
}

class _$LocalStorageModule extends _i7.LocalStorageModule {}

class _$DioModule extends _i10.DioModule {}
