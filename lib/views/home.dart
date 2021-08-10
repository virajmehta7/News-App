import 'package:flutter/material.dart';
import 'package:vmnews/model/category.dart';
import 'package:vmnews/service/service.dart';
import 'all_news.dart';
import 'categoryTile.dart';
import 'newsTile.dart';
import 'search_news.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Service service = Service();
  List articles = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    getArticles();
  }

  getArticles() async {
    articles = await service.getNews();
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("VM News",
          style: TextStyle(color: Colors.black, fontSize: 22),
        ),
        actions: [
          IconButton(
            onPressed: (){
              Navigator.push(context,
                  MaterialPageRoute(
                      builder: (context) => SearchNews()));
            },
            icon: Icon(Icons.search),
            iconSize: 26,
          )
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            GestureDetector(
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AllNews())
                );
              },
              child: Container(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(15, 40, 15, 40),
                  child: Text('All News',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/allnews.jpg"),
                      fit: BoxFit.fitWidth,
                      colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.hardLight),
                    )
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemCount: category.length,
              itemBuilder: (context, index) {
                return CategoryTile(
                  image: category[index].image,
                  category: category[index].category,
                );
              },
            )
          ],
        )
      ),
      body: loading ?
      Center(
        child: Container(
          child: CircularProgressIndicator(),
        ),
      ) :
      SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(12, 5, 12, 5),
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