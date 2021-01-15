import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:trello_project_test/Models/card.dart';

//FSH6zBZ0p9yH
Future<String> fetchJWT(String username, String password) async {
  final http.Response response = await http.post(
    'https://trello.backend.tests.nekidaem.ru/api/v1/users/login/',
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(<String, String>{
      'username': username,
      'password': password,
    }),
  );
  if (response.statusCode == 200) {
    // If the server did return a 200 CREATED response,
    // then parse the JWT token.
    Map data = jsonDecode(response.body);
    return data["token"];
  } else if (response.statusCode == 401) {
    return "Need to Renew Token";
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    return "Invalid Token";
  }
}

Future<List<Card>> fetchCards(String jwt) async {
  List<Card> cards = List() ?? [];
  print("JWT is: " + jwt);
  final response = await http.get(
    'https://trello.backend.tests.nekidaem.ru/api/v1/cards/',
    // Send authorization headers to the backend.
    headers: {
      'Content-type': 'application/json; charset=utf-8',
      HttpHeaders.authorizationHeader: "JWT $jwt"
    },
  );

  if (response.statusCode == 200) {
    cards = (json.decode(response.body) as List)
        .map((i) => Card.fromJson(i))
        .toList();
    print(utf8.decode(response.body.runes.toList()));
    return cards;
  }
  return cards ?? [];
}
