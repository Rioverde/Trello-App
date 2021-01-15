import 'package:flutter/material.dart';
import 'bloc.dart';

class Provider extends InheritedWidget {
  final Bloc bloc = Bloc();

  Provider({Key key, Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  // ignore: deprecated_member_use
  static Bloc of(BuildContext context) =>
      // ignore: deprecated_member_use
      (context.inheritFromWidgetOfExactType(Provider) as Provider).bloc;
}
