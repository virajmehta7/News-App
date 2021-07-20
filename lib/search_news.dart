import 'package:flutter/material.dart';
import 'get_news.dart';
import 'newsTile.dart';

class SearchNews extends StatefulWidget {
  const SearchNews({Key key}) : super(key: key);

  @override
  _SearchNewsState createState() => _SearchNewsState();
}

class _SearchNewsState extends State<SearchNews> {

  List articles = [];
  TextEditingController search = TextEditingController();

  getSearchArticles(search) async {
    GetSearchNews getSearchNews = GetSearchNews();
    await getSearchNews.getSearchNews(search);
    setState(() {
      articles = getSearchNews.news;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search",
          style: TextStyle(color: Colors.blue, fontSize: 23.5),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20,5,5,0),
                    child: TextField(
                      controller: search,
                      decoration: InputDecoration(
                          hintText: "Search for news",
                          hintStyle: TextStyle(color: Colors.grey, fontSize: 16)
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(5,5,10,0),
                  child: IconButton(
                    onPressed: (){
                      getSearchArticles(search.text);
                    },
                    icon: Icon(Icons.search),
                    iconSize: 30,
                    color: Colors.black,
                  ),
                )
              ],
            ),
            articles.length == 0 ?
            Container() :
            Padding(
              padding: EdgeInsets.fromLTRB(12, 30, 12, 5),
              child: ListView.builder(
                itemCount: articles.length,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemBuilder: (context, index) {
                  return NewsTile(
                    image: articles[index].urlToImage,
                    title: articles[index].title,
                    description: articles[index].description,
                    url: articles[index].url,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}