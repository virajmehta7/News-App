import 'package:flutter/material.dart';
import 'package:news/model/model.dart';
import 'package:news/service/service.dart';
import 'package:news/views/news_list.dart';

class TopNews extends StatefulWidget {
  const TopNews({Key? key}) : super(key: key);

  @override
  State<TopNews> createState() => _TopNewsState();
}

class _TopNewsState extends State<TopNews> with AutomaticKeepAliveClientMixin {
  Service service = Service();
  List<Article> articles = [];

  @override
  bool get wantKeepAlive => true;

  getTopArticles() async {
    articles = await service.getTopNews();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getTopArticles();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return NewsList(articles: articles);
  }
}
