import 'package:flutter/material.dart';

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
        image: json['image'],
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt']);
  }
}
