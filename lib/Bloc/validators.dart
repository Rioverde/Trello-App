import 'dart:async';

class Validators {
  final validateUsername = StreamTransformer<String, String>.fromHandlers(
      handleData: (String username, EventSink<String> sink) {
    Pattern pattern = r'[a-zA-Z0-9]+([_ -]?[a-zA-Z0-9])*$';
    RegExp regex = new RegExp(pattern);
    if (regex.hasMatch(username) || username.length > 3) {
      sink.add(username);
    } else if (username.contains(" ")) {
      sink.addError("Username should not contain spaces");
    } else {
      sink.addError('Enter a valid username');
    }
    //FSH6zBZ0p9yH
  });

  final validatePassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (String password, EventSink<String> sink) {
    if (password.length > 3 && !password.contains(" ")) {
      sink.add(password);
    } else if (password.contains(" ")) {
      sink.addError('Password should not contain spaces');
    } else {
      sink.addError('Enter must be at least 4 characters');
    }
  });
}
