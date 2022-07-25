import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:new_app/Model/NewsModel.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class NewsData extends ChangeNotifier {
  late NewsResponse newsModel;

  fetchData(context) async {
    newsModel = await getData(context);

    notifyListeners();
  }
}

Future<NewsResponse> getData(context) async {
  late NewsResponse newsData;

  try {
    final response = await http.get(Uri.parse(
        'http://192.168.0.102:8080/news/all/perPage/100/currentPage/1"'));

    if (response.statusCode == 200) {
      Map<String, dynamic> map = json.decode(response.body);
      final List<NewsModel> newsList = (map['news'] as List)
          .map((news) => NewsModel.fromJson(news))
          .toList();
      newsData = NewsResponse(news: newsList);
    } else {
      print("something went wrong..");
    }
  } catch (e) {
    print("Probeelmn " + e.toString());
  }
  return newsData;
}
