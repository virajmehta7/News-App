import 'package:flutter/material.dart';
import 'package:vmnews/service/service.dart';
import 'newsTile.dart';

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
        title: Text(
          "Search",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: Theme.of(context).iconTheme,
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
            articles.length == 0
                ? Container()
                : Padding(
                    padding: EdgeInsets.fromLTRB(12, 30, 12, 5),
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
                            publishedAt: articles[index].publishedAt);
                      },
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
