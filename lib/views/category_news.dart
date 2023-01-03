import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../service/service.dart';
import 'newsTile.dart';

class CategoryNews extends StatefulWidget {
  final category;
  const CategoryNews({Key? key, required this.category}) : super(key: key);

  @override
  _CategoryNewsState createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {

  Service service = Service();
  List articles = [];
  bool loading = true;

  getCategoryArticles() async {
    articles = await service.getCategoryNews(widget.category);
    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getCategoryArticles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loading ?
      Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Padding(
            padding: EdgeInsets.fromLTRB(12, 5, 12, 5),
            child: ListView.builder(
              itemCount: 5,
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemBuilder: (context, index) {
                return Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)
                  ),
                  margin: EdgeInsets.fromLTRB(5,5,5,30),
                  elevation: 15,
                  shadowColor: Colors.grey,
                  child: Container(
                    height: MediaQuery.of(context).size.height*0.4,
                  ),
                );
              },
            ),
          )
      ) :
      SingleChildScrollView(
        child: Padding(
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
                  publishedAt: articles[index].publishedAt
              );
            },
          ),
        ),
      ),
    );
  }
}