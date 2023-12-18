import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:white_rabbit_challenge/domain/employee/models/model_person_list_response.dart';

@module
abstract class LocalStorageModule {
  @preResolve
  Future<Box<ModelEmployeeData>> get employeeDB =>
      Hive.openBox<ModelEmployeeData>('employee_db');
}

abstract class LocalStorageService {
  Future<bool> saveEmployees(List<ModelEmployeeData> value);
  List<ModelEmployeeData> get getAllEmployees;
  bool get isEmployeeDbEmpty;
}
