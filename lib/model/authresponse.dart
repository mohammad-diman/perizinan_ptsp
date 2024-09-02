// To parse this JSON data, do
//
//     final AuthResponse = AuthResponseFromJson(jsonString);

import 'dart:convert';

AuthResponse authResponseFromJson(String str) => AuthResponse.fromJson(json.decode(str));

String authResponseToJson(AuthResponse data) => json.encode(data.toJson());


class AuthResponse {
    final String token;
    final String tokentype;
    final DateTime expiredAt;


    AuthResponse({
        required this.token,
        required this.tokentype,
        required this.expiredAt,
    });

    factory AuthResponse.fromJson(Map<String, dynamic> json) => AuthResponse(
        token: json["token"],
        tokentype: json["token_type"],
        expiredAt: json["expires_in"],
    );

    Map<String, dynamic> toJson() => {
        "token": token,
        "tokentype": tokentype,
        "expiredAt": expiredAt,
    };
}
