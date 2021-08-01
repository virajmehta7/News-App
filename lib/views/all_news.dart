import 'package:flutter/material.dart';
import 'package:vmnews/service/service.dart';
import 'newsTile.dart';

class AllNews extends StatefulWidget {
  const AllNews({Key key}) : super(key: key);

  @override
  _AllNewsState createState() => _AllNewsState();
}

class _AllNewsState extends State<AllNews> {

  Service service = Service();
  List articles = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    getAllArticles();
  }

  getAllArticles() async {
    articles = await service.getAllNews();
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All News",
          style: TextStyle(color: Colors.blue, fontSize: 22),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
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