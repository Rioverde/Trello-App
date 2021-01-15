import 'package:flutter/material.dart';
import 'package:trello_project_test/theme.dart';

import 'Bloc/provider.dart';
import 'Screens/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => Provider(
          child: MaterialApp(
        title: 'Kanban',
        theme: ThemeData.dark().copyWith(
          inputDecorationTheme: inputDecorationhandler(),
        ),
        home: Login(title: 'Kanbal'),
      ));
}
