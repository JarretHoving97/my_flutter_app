import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:new_app/Helper/DateFormatHelper.dart';
import 'package:new_app/Network/MediaClient.dart';

import '../../Model/NewsModel.dart';

class NewsDetailWidget extends StatelessWidget {
  const NewsDetailWidget({Key? key, required this.newsArticle})
      : super(key: key);

  final NewsModel newsArticle;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    String imageUrl = Mediaclient.mediaUrl + newsArticle.image;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        top: false,
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  width: screenWidth,
                  height: 280,
                  child: CachedNetworkImage(
                    imageUrl: imageUrl,
                    placeholder: (context, url) =>
                        Image.asset('assets/images/dac-logo.png'),
                    errorWidget: (context, url, error) =>
                        Image.asset('assets/images/dac-logo.png'),
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  )),
              Container(
                  width: screenWidth,
                  padding: EdgeInsets.fromLTRB(17, 10, 17, 40),
                  child: Column(
                    children: [
                      Container(
                          width: screenWidth,
                          child: Text(
                            newsArticle.title,
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w700),
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                          width: screenWidth,
                          child: Text(
                            newsArticle.content,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.normal),
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Container(
                              child: Text(
                            DateFormatHelper.formatFromServer(
                                newsArticle.createdAt),
                            textAlign: TextAlign.right,
                          ))
                        ],
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
