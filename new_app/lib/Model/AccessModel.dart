import 'dart:convert';

AccessModel accessModelFromJson(String str) =>
    AccessModel.fromJson(json.decode(str));

String accessModelToJson(AccessModel data) => json.encode(data.toJson());

class AccessModel {
  AccessModel({
    required this.verified,
    required this.registered,
  });

  final bool verified;
  final bool registered;

  factory AccessModel.fromJson(Map<String, dynamic> json) => AccessModel(
        verified: json["verified"],
        registered: json["registered"],
      );

  Map<String, dynamic> toJson() => {
        "verified": verified,
        "registered": registered,
      };
}
