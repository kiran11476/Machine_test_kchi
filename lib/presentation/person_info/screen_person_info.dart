import 'package:flutter/material.dart';

import '../../domain/employee/models/model_person_list_response.dart';

class ScreenPersonInfo extends StatelessWidget {
  static final routeName = '/ScreenPersonInfo';

  final ModelEmployeeData data;

  const ScreenPersonInfo({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final widgetList = [
      if (data.profileImage != null)
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * .3,
          child: Image.network(
            data.profileImage!,
            fit: BoxFit.cover,
          ),
        ),
      ListTile(
        title: Text('Name'),
        subtitle: Text(data.name ?? 'Name not available'),
      ),
      ListTile(
        title: Text('Username'),
        subtitle: Text(data.username ?? 'Usename not available'),
      ),
      ListTile(
        title: Text('Email'),
        subtitle: Text(data.email ?? 'Email not available'),
      ),
      ListTile(
        title: Text('Address'),
        subtitle: Text(
          data.address == null
              ? 'Address not available'
              : '${data.address!.street}\n${data.address!.suite}\n${data.address!.city}\n${data.address!.zipcode}',
        ),
      ),
      ListTile(
        title: Text('Phone'),
        subtitle: Text(data.phone ?? 'Phone not available'),
      ),
      ListTile(
        title: Text('Website'),
        subtitle: Text(data.website ?? 'Website not available'),
      ),
      ListTile(
        title: Text('Company Details'),
        subtitle: Text(
          data.company == null
              ? 'Company not available'
              : '${data.company!.name}\n${data.company!.catchPhrase}\n${data.company!.bs}',
        ),
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(data.name ?? ''),
      ),
      body: SafeArea(
        child: ListView.separated(
          itemBuilder: (ctx, index) => widgetList[index],
          separatorBuilder: (ctx, index) {
            return const SizedBox(height: 5);
          },
          itemCount: widgetList.length,
        ),
      ),
    );
  }
}
