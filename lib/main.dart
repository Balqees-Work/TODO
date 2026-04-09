import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bal/config/routes.dart';

import 'config/config_injection.dart';

Future<void> main() async {
  await configureDependencies();
  runApp(StartApp());
}

class StartApp extends StatelessWidget {
  const StartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Todo App',
      // theme
      theme: ThemeData(primarySwatch: Colors.blue),
      // routes
      routerConfig: AppRoutes.routes,
    );
  }
}
