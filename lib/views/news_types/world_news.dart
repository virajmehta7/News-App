import 'package:flutter/material.dart';
import 'package:news/model/model.dart';
import 'package:news/service/service.dart';
import 'package:news/views/news_list.dart';

class WorldNews extends StatefulWidget {
  const WorldNews({super.key});

  @override
  State<WorldNews> createState() => _WorldNewsState();
}

class _WorldNewsState extends State<WorldNews>
    with AutomaticKeepAliveClientMixin {
  Service service = Service();
  List<Article> articles = [];

  @override
  bool get wantKeepAlive => true;

  getWorldArticles() async {
    articles = await service.getWorldNews();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getWorldArticles();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return NewsList(articles: articles);
  }
}
