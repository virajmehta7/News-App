import 'package:flutter/material.dart';
import 'all_news.dart';
import 'category_news.dart';
import 'get_news.dart';
import 'newsTile.dart';
import 'search_news.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List articles = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    getArticles();
  }

  getArticles() async {
    GetNews getNews = GetNews();
    await getNews.getNews();
    articles = getNews.news;
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("VM",
              style: TextStyle(color: Colors.blue, fontSize: 23.5),
            ),
            Text("News",
              style: TextStyle(color: Colors.black, fontSize: 24),
            )
          ],
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
        iconTheme: IconThemeData(color: Colors.black),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            GestureDetector(
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(
                        builder: (context) => AllNews()));
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
            GestureDetector(
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(
                        builder: (context) => CategoryNews(category: "Business")));
              },
              child: Container(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(15, 40, 15, 40),
                  child: Text('Business',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/business.jpg"),
                    fit: BoxFit.fitWidth,
                    colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.hardLight),
                  )
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(
                        builder: (context) => CategoryNews(category: "Health")));
              },
              child: Container(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(15, 40, 15, 40),
                  child: Text('Health',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/health.jpg"),
                      fit: BoxFit.fitWidth,
                      colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.hardLight),
                    )
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(
                        builder: (context) => CategoryNews(category: "Sports")));
              },
              child: Container(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(15, 40, 15, 40),
                  child: Text('Sports',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/sports.jpg"),
                      fit: BoxFit.fitWidth,
                      colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.hardLight),
                    )
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(
                        builder: (context) => CategoryNews(category: "Entertainment")));
              },
              child: Container(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(15, 40, 15, 40),
                  child: Text('Entertainment',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/entertainment.jpg"),
                      fit: BoxFit.fitWidth,
                      colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.hardLight),
                    )
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(
                        builder: (context) => CategoryNews(category: "Science")));
              },
              child: Container(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(15, 40, 15, 40),
                  child: Text('Science',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/science.jpg"),
                      fit: BoxFit.fitWidth,
                      colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.hardLight),
                    )
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(
                        builder: (context) => CategoryNews(category: "Technology")));
              },
              child: Container(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(15, 40, 15, 40),
                  child: Text('Technology',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/technology.jpg"),
                      fit: BoxFit.fitWidth,
                      colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.hardLight),
                    )
                ),
              ),
            ),
          ],
        ),
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
              padding: EdgeInsets.fromLTRB(12, 2, 12, 2),
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