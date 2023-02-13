import 'package:flutter/material.dart';
import 'package:vmnews/service/service.dart';
import 'package:vmnews/views/news.dart';

class CategoryNews extends StatefulWidget {
  final category;
  const CategoryNews({Key? key, required this.category}) : super(key: key);

  @override
  _CategoryNewsState createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  Service service = Service();
  List articles = [];

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
    return Scaffold(body: News(articles: articles));
  }
}
