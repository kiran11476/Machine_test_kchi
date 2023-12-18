import 'package:flutter/material.dart';
import 'package:white_rabbit_challenge/domain/employee/models/model_person_list_response.dart';

import '../person_info/screen_person_info.dart';

class EmployeeWidgetItem extends StatelessWidget {
  final ModelEmployeeData data;

  EmployeeWidgetItem(this.data);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(data.name ?? 'Name not available'),
      subtitle: Text(getCompanyName(data)),
      leading: getProfileImage(data),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (ctx) => ScreenPersonInfo(
                  data: data,
                )));
      },
    );
  }

  String getCompanyName(ModelEmployeeData data) =>
      data.company?.name ?? 'Company not available';

  Widget getProfileImage(ModelEmployeeData employeeData) {
    if (employeeData.profileImage == null) {
      return Icon(Icons.error);
    } else {
      return FadeInImage(
        placeholder: AssetImage('assets/loading_gif.gif'),
        image: NetworkImage(employeeData.profileImage!),
        imageErrorBuilder: (BuildContext c, Object o, StackTrace? _) {
          return Icon(Icons.wifi_off);
        },
      );
    }
  }
}
