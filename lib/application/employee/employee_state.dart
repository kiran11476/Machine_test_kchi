part of 'employee_bloc.dart';

@freezed
class EmployeeState with _$EmployeeState {
  const factory EmployeeState({
    required bool isLoading,
    required bool hasError,
    required String errorReason,
    required List<ModelEmployeeData> employeeList,
  }) = Initial;

  factory EmployeeState.initial() => EmployeeState(
        employeeList: [],
        isLoading: false,
        errorReason: '',
        hasError: false,
      );
}
