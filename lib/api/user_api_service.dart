import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:ew_app/models/bearer_token.dart';

Future<BearerToken> getBeaverToken(
    String apiUrl, String username, String password) async {
  // Here we can get beaver token
  var url = Uri.parse(apiUrl);
  final response = await http.post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(
      <String, String>{
        'username': username,
        'password': password,
      },
    ),
  );
  if (response.statusCode == 200) {
    return BearerToken.fromJson(json.decode(response.body));
  } else {
    throw Exception('Error: ${response.reasonPhrase}');
  }
}
