import 'package:flutter/material.dart';
import 'package:vmnews/views/newsTile.dart';

class News extends StatelessWidget {
  const News({
    Key? key,
    required this.articles,
  }) : super(key: key);

  final List articles;

  @override
  Widget build(BuildContext context) {
    return articles.isEmpty
        ? Center(child: CircularProgressIndicator())
        : Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: ListView.builder(
              itemCount: articles.length,
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemBuilder: (context, index) {
                return NewsTile(
                  source: articles[index].source.name,
                  image: articles[index].urlToImage,
                  title: articles[index].title,
                  description: articles[index].description,
                  url: articles[index].url,
                  publishedAt: articles[index].publishedAt,
                );
              },
            ),
          );
  }
}
