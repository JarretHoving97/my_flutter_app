import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:new_app/Helper/DateFormatHelper.dart';
import 'package:new_app/Model/NewsModel.dart';
import 'package:new_app/Network/MediaClient.dart';

class NewsItemWidget extends StatelessWidget {
  const NewsItemWidget({Key? key, required this.newsArticle}) : super(key: key);

  final NewsModel newsArticle;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Card(
      elevation: 2.0,
      child: SizedBox(
          width: 80,
          height: 110,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(children: [
              newsArticle.image != ""
                  ? FadeInImage.assetNetwork(
                      placeholder: 'assets/images/dac-logo.png',
                      image: Mediaclient.mediaUrl + newsArticle.image,
                      fadeInDuration: const Duration(milliseconds: 3),
                      fit: BoxFit.cover,
                      imageScale: 10,
                      width: 100,
                      height: 100,
                    )
                  : const SizedBox(
                      width: 100,
                      height: 100,
                    ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 8, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: screenWidth * 0.5,
                      child: Text(
                        newsArticle.title,
                        style: const TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width: screenWidth * 0.5,
                      child: RichText(
                        text: TextSpan(
                            text: newsArticle.content,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 18.0)),
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: screenWidth * 0.57,
                      child: Row(
                        children: [
                          const Spacer(),
                          Text(
                            DateFormatHelper.formatFromServer(
                                newsArticle.createdAt),
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 16.0),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          )),
    );
  }
}
