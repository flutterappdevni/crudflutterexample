import 'package:flutter/gestures.dart';

class AuthenticationResponse {
  final String userId;
  final String JwtToken;
  final String FirstName;
  final String LastName;

  const AuthenticationResponse({
    required this.userId,
    required this.JwtToken,
    required this.FirstName,
    required this.LastName,
  });
  Map<String, dynamic> toJson() => {
        "userId": userId,
        "firstName": FirstName,
        "Lastname": LastName,
        "JwtToken": JwtToken
      };

  factory AuthenticationResponse.fromJson(dynamic json) {
    return AuthenticationResponse(
      userId: json['id'],
      JwtToken: json['jwtToken'],
      FirstName: json['firstName'],
      LastName: json['lastName'],
    );
  }
}
