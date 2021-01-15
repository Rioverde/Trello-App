import 'dart:async';

import 'package:trello_project_test/API/requestHandler.dart';
import 'package:trello_project_test/Models/card.dart' as Models;

import 'validators.dart';
import 'package:rxdart/rxdart.dart';

class Bloc with Validators {
  final BehaviorSubject _usernameController = BehaviorSubject<String>();
  final BehaviorSubject _passwordController = BehaviorSubject<String>();
  List<Models.Card> cardList = List() ?? [];

  Function(String) get changeUsername => _usernameController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  Stream<String> get username =>
      _usernameController.stream.transform(validateUsername);
  Stream<String> get password =>
      _passwordController.stream.transform(validatePassword);
  Stream<bool> get submitValid => Observable.combineLatest2(
      username, password, (username, password) => true);

  submit() async {
    final validUsername = _usernameController.value;
    final validPassword = _passwordController.value;

    print('Username is $validUsername');
    print('Password is $validPassword');

    await fetchJWT(validUsername, validPassword).then((String token) async {
      if (token.isNotEmpty) {
        await fetchCards(token).then((List<Models.Card> list) {
          cardList = list;
        });
      }
    });
  }

  void dispose() {
    _usernameController.close();
    _passwordController.close();
  }
}
