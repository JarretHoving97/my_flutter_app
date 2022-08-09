// To parse this JSON data, do
//
//     final eventModel = eventModelFromJson(jsonString);

import 'dart:convert';

List<EventModel> eventModelFromJson(String str) =>
    List<EventModel>.from(json.decode(str).map((x) => EventModel.fromJson(x)));

String eventModelToJson(List<EventModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EventModel {
  EventModel({
    required this.id,
    required this.title,
    required this.content,
    required this.image,
    required this.registerFrom,
    required this.registerTill,
    required this.membersOnly,
    required this.eventDate,
    required this.cancelled,
  });

  final int id;
  final String title;
  final String content;
  final String image;
  final DateTime registerFrom;
  final DateTime registerTill;
  final bool membersOnly;
  final DateTime eventDate;
  final bool cancelled;

  factory EventModel.fromJson(Map<String, dynamic> json) => EventModel(
        id: json["id"],
        title: json["title"],
        content: json["content"],
        image: json["image"] == null ? null : json["image"],
        registerFrom: DateTime.parse(json["register_from"]),
        registerTill: DateTime.parse(json["register_till"]),
        membersOnly: json["members_only"],
        eventDate: DateTime.parse(json["event_date"]),
        cancelled: json["cancelled"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "content": content,
        "image": image == null ? null : image,
        "register_from": registerFrom.toIso8601String(),
        "register_till": registerTill.toIso8601String(),
        "members_only": membersOnly,
        "event_date": eventDate.toIso8601String(),
        "cancelled": cancelled,
      };
}
