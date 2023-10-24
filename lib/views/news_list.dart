import 'package:flutter/material.dart';
import 'package:news/model/model.dart';
import 'package:news/views/news_tile.dart';

class NewsList extends StatelessWidget {
  const NewsList({Key? key, required this.articles}) : super(key: key);

  final List<Article> articles;

  @override
  Widget build(BuildContext context) {
    return articles.isEmpty
        ? const Center(child: CircularProgressIndicator())
        : ListView.builder(
            itemCount: articles.length,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: NewsTile(
                    source: articles[index].source.name,
                    image: articles[index].urlToImage,
                    title: articles[index].title,
                    description: articles[index].description,
                    url: articles[index].url,
                    publishedAt: articles[index].publishedAt),
              );
            },
          );
  }
}
