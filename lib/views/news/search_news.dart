import 'package:flutter/material.dart';
import 'package:vmnews/service/service.dart';
import 'package:vmnews/views/news.dart';

class SearchNews extends StatefulWidget {
  const SearchNews({Key? key}) : super(key: key);

  @override
  _SearchNewsState createState() => _SearchNewsState();
}

class _SearchNewsState extends State<SearchNews> {
  Service service = Service();
  List articles = [];
  TextEditingController search = TextEditingController();

  getSearchArticles(search) async {
    articles = await service.getSearchNews(search);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(20, 5, 20, 0),
              child: TextField(
                textInputAction: TextInputAction.go,
                onSubmitted: (_) {
                  getSearchArticles(search.text);
                },
                controller: search,
                decoration: InputDecoration(
                  hintText: "Search for topics, locations & sources",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
                ),
              ),
            ),
            articles.length == 0 ? Container() : News(articles: articles)
          ],
        ),
      ),
    );
  }
}
