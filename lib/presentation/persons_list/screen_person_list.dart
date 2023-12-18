import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:white_rabbit_challenge/application/employee/employee_bloc.dart';
import 'package:white_rabbit_challenge/presentation/persons_list/employee_item.dart';
import 'package:white_rabbit_challenge/presentation/persons_list/search_deligate.dart';

class ScreenPersonList extends StatelessWidget {
  static final routeName = '/ScreenPersonList';

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      BlocProvider.of<EmployeeBloc>(context).add(const GetEmployeeList());
    });
    return Scaffold(
      appBar: AppBar(
        title: Text('Employees'),
        actions: [
          IconButton(
              onPressed: () async {
                var result = await showSearch<String>(
                  context: context,
                  delegate: CustomDelegate(),
                );
              },
              icon: Icon(Icons.search)),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<EmployeeBloc, EmployeeState>(
            builder: (context, state) {
              if (state.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state.hasError) {
                return Center(
                  child: Text(state.errorReason),
                );
              } else {
                return ListView.separated(
                  itemBuilder: (ctx, index) =>
                      EmployeeWidgetItem(state.employeeList[index]),
                  separatorBuilder: (ctx, index) => SizedBox(height: 10),
                  itemCount: state.employeeList.length,
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
