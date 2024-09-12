import 'dart:convert';

AuthResponse authResponseFromJson(String str) =>
    AuthResponse.fromJson(json.decode(str));

String authResponseToJson(AuthResponse data) => json.encode(data.toJson());

class AuthResponse {
  final String? token;
  final String? tokentype;
  final int? expiredAt;
  final Object? errors;

  AuthResponse({
    required this.token,
    required this.tokentype,
    required this.expiredAt,
    required this.errors,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) => AuthResponse(
        token: json["access_token"],
        tokentype: json["token_type"],
        expiredAt: json["expires_in"],
        errors: json["errors"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "tokentype": tokentype,
        "expiredAt": expiredAt,
        "errors": errors.toString(),
      };
}
