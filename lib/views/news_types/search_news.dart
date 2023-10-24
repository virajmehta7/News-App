import 'package:flutter/material.dart';
import 'package:news/model/model.dart';
import 'package:news/service/service.dart';
import 'package:news/views/news_list.dart';

class SearchNews extends StatefulWidget {
  const SearchNews({super.key});

  @override
  State<SearchNews> createState() => _SearchNewsState();
}

class _SearchNewsState extends State<SearchNews> {
  TextEditingController search = TextEditingController();

  Service service = Service();
  List<Article> articles = [];

  getSearchArticles(search) async {
    articles = await service.getSearchNews(search);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search"),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: TextField(
                textInputAction: TextInputAction.search,
                onSubmitted: (_) {
                  if (search.text.trim().isNotEmpty) {
                    getSearchArticles(search.text.trim());
                  }
                },
                controller: search,
                decoration: const InputDecoration(
                    hintText: "Search for topics, locations & sources"),
              ),
            ),
            if (articles.isNotEmpty) NewsList(articles: articles),
          ],
        ),
      ),
    );
  }
}
