import 'package:flutter/material.dart';
import 'package:news/model/model.dart';
import 'package:news/service/service.dart';
import 'package:news/views/news_list.dart';

class CategoryNews extends StatefulWidget {
  const CategoryNews({super.key, required this.category});

  final String category;

  @override
  State<CategoryNews> createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews>
    with AutomaticKeepAliveClientMixin {
  Service service = Service();
  List<Article> articles = [];

  @override
  bool get wantKeepAlive => true;

  getCategoryArticles() async {
    articles = await service.getCategoryNews(widget.category);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getCategoryArticles();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return NewsList(articles: articles);
  }
}
