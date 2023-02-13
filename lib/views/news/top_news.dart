import 'package:flutter/material.dart';
import 'package:vmnews/service/service.dart';
import 'package:vmnews/views/news.dart';

class TopNews extends StatefulWidget {
  const TopNews({Key? key}) : super(key: key);

  @override
  State<TopNews> createState() => _TopNewsState();
}

class _TopNewsState extends State<TopNews> {
  Service service = Service();
  List articles = [];

  getArticles() async {
    articles = await service.getNews();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getArticles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: News(articles: articles));
  }
}
