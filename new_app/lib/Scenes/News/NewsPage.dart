import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:new_app/Network/NewsClient.dart';
import 'package:new_app/Scenes/News/NewsDetailPage.dart';
import 'package:new_app/Scenes/News/NewsWidgetItem.dart';
import 'package:new_app/Util/AppColor.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

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
        backgroundColor: AppColor.appColor,
        title: Text("Nieuws"),
      ),
      body: Container(
          child: newsProvider.loading
              ? Container(
                  child: CircularProgressIndicator(),
                )
              : Container(
                  child: ListView.builder(
                    padding: EdgeInsets.fromLTRB(17, 10, 17, 0),
                    itemCount: newsProvider.newsResponse.news.length,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => NewsDetailWidget(
                                      newsArticle:
                                          newsProvider.newsResponse.news[index],
                                    )))),
                      },
                      child: NewsItemWidget(
                          newsArticle: newsProvider.newsResponse.news[index]),
                    ),
                  ),
                )),
    );
  }
}
