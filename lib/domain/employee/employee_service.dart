import 'package:dartz/dartz.dart';
import 'package:white_rabbit_challenge/domain/core/remote/exceptions/network_exceptions.dart';

import 'models/model_person_list_response.dart';

abstract class EmployeeService {
  Future<Either<NetworkExceptions, List<ModelEmployeeData>>> getEmployeesList();
}
