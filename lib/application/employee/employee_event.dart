part of 'employee_bloc.dart';

@freezed
class EmployeeEvent with _$EmployeeEvent {
  const factory EmployeeEvent.getEmployeeList() = GetEmployeeList;
}
