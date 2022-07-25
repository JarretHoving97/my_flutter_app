import 'package:meta/meta.dart';
import 'dart:convert';

NewsResponse newsResponseFromJson(String str) =>
    NewsResponse.fromJson(json.decode(str));

String newsResponseToJson(NewsResponse data) => json.encode(data.toJson());

class NewsResponse {
  NewsResponse({
    required this.news,
  });

  final List<NewsModel> news;

  factory NewsResponse.fromJson(Map<String, dynamic> json) => NewsResponse(
        news: List<NewsModel>.from(
            json["news"].map((x) => NewsModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "news": List<dynamic>.from(news.map((x) => x.toJson())),
      };
}

class NewsModel {
  final int id;
  final String title;
  final String content;
  final String image;
  final String createdAt;
  final String updatedAt;

  const NewsModel(
      {required this.id,
      required this.title,
      required this.content,
      required this.image,
      required this.createdAt,
      required this.updatedAt});

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
        id: json['id'],
        title: json['title'],
        content: json['content'],
        image: json["image"] ?? "",
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt']);
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "content": content,
        "image": image == null ? null : image,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
      };
}
