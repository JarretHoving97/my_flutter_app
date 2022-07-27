import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:new_app/Network/NewsClient.dart';
import 'package:provider/provider.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  void initState() {
    super.initState();

    final newsData = Provider.of<NewsDataProvider>(context, listen: false);
    newsData.fetchNews(context);
  }

  @override
  Widget build(BuildContext context) {
    final newsProvider = Provider.of<NewsDataProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Nieuws"),
      ),
      body: Container(
          child: newsProvider.loading
              ? Container(
                  child: CircularProgressIndicator(),
                )
              : Container(
                  child: Text(newsProvider.newsResponse.news.first.title),
                )),
    );
  }
}
