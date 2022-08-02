import 'dart:convert';

import 'package:crudflutter/models/AuthenticationResponse.dart';
import 'package:crudflutter/models/players.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'SecureStorageUtil.dart';

class HttpService {
  static const String JwtToken = "";
  static const baseURL = "https://api-hockeylab.com/";

  Future<Players> GetPlayers() async {
    const playersEndpoint = "$baseURL/api/GetAllPlayers";

    http.Response response = await http.get(Uri.parse(playersEndpoint));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      List<dynamic> values = json.decode(response.body);
      return Players.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  Future Authenticate() async {
    const loginEndpoint = "$baseURL/Login";
    final Response reponse;
    var response = http.post(
      Uri.parse("$loginEndpoint"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': "davidbuckleyweb@outlook.com",
        'password': "Test12345!"
      }),
    );

    final responseBody = await response;
    Map<String, dynamic> data = jsonDecode(responseBody.body);
    final Map parsed = json.decode(responseBody.body);
    final auth = AuthenticationResponse.fromJson(parsed);
    await SecureStorageUtil.putString("jwtToken", auth.JwtToken);
    var test = await SecureStorageUtil.getString("jwtToken");
    print(test);
  }
}
