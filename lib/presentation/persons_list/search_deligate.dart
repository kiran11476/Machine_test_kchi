import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:white_rabbit_challenge/application/employee/employee_bloc.dart';
import 'package:white_rabbit_challenge/presentation/persons_list/employee_item.dart';

class CustomDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) => [
        IconButton(
          icon: Icon(Icons.clear),
          onPressed: () => query = '',
        ),
      ];

  @override
  Widget buildLeading(BuildContext context) => IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () => close(context, ''),
      );

  @override
  Widget buildResults(BuildContext context) => Container();

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty || query == '') {
      return SizedBox();
    }
    final employeeList = BlocProvider.of<EmployeeBloc>(context)
        .state
        .employeeList
        .where((element) =>
            (element.name ?? '').toLowerCase().contains(query.toLowerCase()) ||
            (element.email ?? '').toLowerCase().contains(query.toLowerCase()))
        .toList();
    return ListView.separated(
      itemBuilder: (ctx, index) => EmployeeWidgetItem(employeeList[index]),
      separatorBuilder: (ctx, index) => SizedBox(height: 10),
      itemCount: employeeList.length,
    );
  }
}
