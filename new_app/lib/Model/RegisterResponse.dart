import 'dart:convert';

RegisteResponse registeResponseFromJson(String str) =>
    RegisteResponse.fromJson(json.decode(str));

String registeResponseToJson(RegisteResponse data) =>
    json.encode(data.toJson());

class RegisteResponse {
  RegisteResponse({
    required this.message,
    required this.token,
  });

  final String message;
  final String token;

  factory RegisteResponse.fromJson(Map<String, dynamic> json) =>
      RegisteResponse(
        message: json["message"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "token": token,
      };
}
