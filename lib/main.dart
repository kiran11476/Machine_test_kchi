import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:white_rabbit_challenge/application/employee/employee_bloc.dart';
import 'package:white_rabbit_challenge/presentation/persons_list/screen_person_list.dart';

import 'domain/core/injection/injection.dart';

final navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // LOCAL DATABASE
  await Hive.initFlutter();
  Hive.registerAdapter(ModelEmployeeDataAdapter());
  Hive.registerAdapter(GeoAdapter());
  Hive.registerAdapter(CompanyAdapter());
  Hive.registerAdapter(AddressAdapter());
  // DEPENDENCY INJECTION
  await configureInjection();
  // ROOT APP
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<EmployeeBloc>(
            create: (context) => getIt<EmployeeBloc>(),
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          navigatorKey: navigatorKey,
          theme: ThemeData(
            primarySwatch: Colors.purple,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: ScreenPersonList(),
          routes: {
            ScreenPersonList.routeName: (ctx) => ScreenPersonList(),
          },
        ));
  }
}
