// ignore: file_names
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:new_app/Model/NewsModel.dart';
import 'package:http/http.dart' as http;

class NewsRouter {
  static const String homeServerUrl = "http://192.168.0.102:8080/news";
  static const String newsEndpoint =
      "${homeServerUrl}/all/perPage/100/currentPage/1";
}

class NewsDataProvider with ChangeNotifier {
  late NewsResponse newsResponse;

  bool loading = false;

  fetchNews(context) async {
    loading = true;
    newsResponse = await fetchNewsData(context);

    loading = false;

    notifyListeners();
  }
}

Future<NewsResponse> fetchNewsData(context) async {
  late NewsResponse newsResponse;

  try {
    final response = await http.get(Uri.parse(NewsRouter.newsEndpoint));
    print(NewsRouter.newsEndpoint);
    if (response.statusCode == 200) {
      Map<String, dynamic> map = json.decode(response.body);
      final List<NewsModel> newsList = (map['news'] as List)
          .map((news) => NewsModel.fromJson(news))
          .toList();

      newsResponse = NewsResponse(news: newsList);
    } else {
      print("statuscode not 200");
    }
  } catch (e) {
    print("error fetching news data");
  }
  return newsResponse;
}
