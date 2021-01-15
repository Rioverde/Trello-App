import 'package:flutter/material.dart';
import 'package:trello_project_test/Bloc/bloc.dart';
import 'package:trello_project_test/Bloc/provider.dart';
import 'package:trello_project_test/Screens/dashboard.dart';

class Login extends StatefulWidget {
  Login({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          textAlign: TextAlign.start,
        ),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _usernameField(bloc),
              _passwordField(bloc),
              submitButton(bloc)
            ]),
      ),
    );
  }

  Widget _usernameField(Bloc bloc) => StreamBuilder<String>(
        stream: bloc.username ?? " ",
        builder: (context, snap) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              textAlign: TextAlign.center,
              keyboardType: TextInputType.emailAddress,
              onChanged: bloc.changeUsername,
              decoration: InputDecoration(
                  hintText: 'Enter your username', errorText: snap.error),
            ),
          );
        },
      );

  Widget _passwordField(Bloc bloc) => StreamBuilder<String>(
      stream: bloc.password ?? " ",
      builder: (context, snap) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            textAlign: TextAlign.center,
            obscureText: true,
            onChanged: bloc.changePassword,
            decoration:
                InputDecoration(hintText: 'Password', errorText: snap.error),
          ),
        );
      });

  Widget submitButton(Bloc bloc) => StreamBuilder<bool>(
        stream: bloc.submitValid ?? " ",
        builder: (context, snap) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: ButtonTheme(
              height: 55,
              minWidth: double.infinity,
              child: RaisedButton(
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30)),
                onPressed: () async {
                  if (!snap.hasData) {
                    print('Snap Data is at empty is ' + snap.data.toString());
                  } else {
                    await bloc.submit();

                    bloc.cardList.isNotEmpty
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Dashboard(bloc.cardList)),
                          )
                        : Scaffold.of(context).showSnackBar(SnackBar(
                            backgroundColor: Colors.teal.shade300,
                            content: Text(
                              'Invalid Username or Password',
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black),
                            )));
                  }
                },
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
                color: Colors.teal,
              ),
            ),
          );
        },
      );
}
