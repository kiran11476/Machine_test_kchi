import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:white_rabbit_challenge/domain/core/remote/exceptions/network_exceptions.dart';
import 'package:white_rabbit_challenge/domain/employee/employee_service.dart';
import 'package:white_rabbit_challenge/domain/local_storage/local_storage_service.dart';
import 'package:white_rabbit_challenge/presentation/common/snackbar.dart';

import '../../domain/employee/models/model_person_list_response.dart';

part 'employee_event.dart';
part 'employee_state.dart';

@injectable
class EmployeeBloc extends Bloc<EmployeeEvent, EmployeeState> {
  final EmployeeService _employeeService;
  final LocalStorageService _localStorageService;
  EmployeeBloc(
    this._employeeService,
    this._localStorageService,
  ) : super(EmployeeState.initial()) {
    /*
    Get employees list
    */
    on<GetEmployeeList>((event, emit) async {
      emit(
        EmployeeState(
          isLoading: true,
          hasError: false,
          employeeList: [],
          errorReason: '',
        ),
      );
      /*
      Check employees found in local db
      */
      if (_localStorageService.isEmployeeDbEmpty) {
        /*
        Employees not found in local db. Getting from server
        */
        showSnackBar(message: 'Getting data from server');
        final _result = await _employeeService.getEmployeesList();
        _result.fold(
          (NetworkExceptions exp) {
            emit(EmployeeState(
              isLoading: false,
              hasError: true,
              employeeList: [],
              errorReason: getMessageFromException(exp),
            ));
          },
          (List<ModelEmployeeData> employeeList) async {
            showSnackBar(message: 'Saving Data');
            await _localStorageService.saveEmployees(employeeList);
          },
        );
      }
      /*
        getting employees from db
        */
      showSnackBar(message: 'Showing data from local storage');
      emit(EmployeeState(
        isLoading: false,
        hasError: false,
        employeeList: _localStorageService.getAllEmployees,
        errorReason: '',
      ));
    });
  }
}
