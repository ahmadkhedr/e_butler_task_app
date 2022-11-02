import 'package:e_butler_task/src/configs/Routes/AppRoutes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../business_logic_layer/Blocs/AllUsersBloc.dart';
import '../../business_logic_layer/Blocs/LoginBloc.dart';
import '../../data_layer/Resourses/UsersDBProvider.dart';

class App extends StatefulWidget {
  App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late DbHelper helper;

  @override
  void initState() {
    helper = DbHelper();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<LoginBloc>(create: (_) => LoginBloc()),
          Provider<AllUsersBloc>(create: (_) => AllUsersBloc()),
        ],
        child: Sizer(builder: (context, orientation, deviceType) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            onGenerateRoute: AppRoutes.onGenerateRoute,
          );
        }));
  }
}