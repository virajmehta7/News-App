import 'package:flutter/material.dart';
import 'package:vmnews/service/service.dart';
import 'package:vmnews/views/news.dart';

class AllNews extends StatefulWidget {
  const AllNews({Key? key}) : super(key: key);

  @override
  _AllNewsState createState() => _AllNewsState();
}

class _AllNewsState extends State<AllNews> {
  Service service = Service();
  List articles = [];

  getAllArticles() async {
    articles = await service.getAllNews();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getAllArticles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: News(articles: articles));
  }
}
