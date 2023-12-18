import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:white_rabbit_challenge/domain/employee/models/model_person_list_response.dart';
import 'package:white_rabbit_challenge/domain/local_storage/local_storage_service.dart';

@LazySingleton(as: LocalStorageService)
class LocalStorageImplementation implements LocalStorageService {
  final Box<ModelEmployeeData> employeeDb;

  LocalStorageImplementation(this.employeeDb);
  @override
  List<ModelEmployeeData> get getAllEmployees => employeeDb.values.toList();

  @override
  Future<bool> saveEmployees(List<ModelEmployeeData> value) async {
    await employeeDb.addAll(value);
    return true;
  }

  @override
  bool get isEmployeeDbEmpty => employeeDb.isEmpty;
}
