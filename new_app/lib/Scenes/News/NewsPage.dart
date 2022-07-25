import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:new_app/Model/NewsModel.dart';

import 'package:new_app/Scenes/News/NewsData.dart';
import 'package:provider/provider.dart';

class Newspage extends StatefulWidget {
  const Newspage({Key? key}) : super(key: key);

  @override
  State<Newspage> createState() => _NewspageState();
}

class _NewspageState extends State<Newspage> {
  @override
  void initState() {
    super.initState();
    final data = Provider.of<NewsData>(context, listen: false);
    data.fetchData(context);
  }

  @override
  Widget build(BuildContext context) {
    final newsData = Provider.of<NewsData>(context);

    return Scaffold(
      body: Center(
        child: Text(newsData.newsModel.news[0].title),
      ),
    );
  }
}
