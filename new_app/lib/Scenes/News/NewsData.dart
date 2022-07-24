import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:new_app/Model/NewsModel.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class NewsData extends ChangeNotifier {
  late List<NewsModel> newsModel;

  fetchData(context) async {
    newsModel = await getData(context);

    notifyListeners();
  }
}

Future<List<NewsModel>> getData(context) async {
  late List<NewsModel> newsData;

  try {
    final response = await http.get(Uri.parse(
        'http://192.168.0.102:8080/news/all/perPage/100/currentPage/1"'));

    if (response.statusCode == 200) {
      final List<NewsModel> data = json.decode(response.body);
      newsData = data;
    } else {
      print("something went wrong..");
    }
  } catch (e) {
    print(e.toString());
  }

  return newsData;
}
