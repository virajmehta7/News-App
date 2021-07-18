import 'dart:convert';
import 'package:http/http.dart' as http;

class GetNews{
  List news = [];
  Future getNews() async {
    var res = await http.get(Uri.parse("https://newsapi.org/v2/top-headlines?country=in&pageSize=100&apiKey=e384bb1a856a4051984dc40de691c58f"));
    var jsonData = jsonDecode(res.body);
    if(jsonData['status'] == "ok"){
      jsonData['articles'].forEach((ele){
        if(ele['urlToImage'] != null && ele['description'] != null){
          Article article = Article(
            author: ele['author'],
            title: ele['title'],
            description: ele['description'],
            url: ele['url'],
            urlToImage: ele['urlToImage'],
            publishedAt: ele['publishedAt'],
            content: ele['content'],
          );
          news.add(article);
        }
      });
    }
  }
}

class GetCategoryNews{
  List news = [];
  Future getCategoryNews(String category) async {
    var res = await http.get(Uri.parse("https://newsapi.org/v2/top-headlines?category=$category&country=in&pageSize=100&apiKey=e384bb1a856a4051984dc40de691c58f"));
    var jsonData = jsonDecode(res.body);
    if(jsonData['status'] == "ok"){
      jsonData['articles'].forEach((ele){
        if(ele['urlToImage'] != null && ele['description'] != null){
          Article article = Article(
              author: ele['author'],
              title: ele['title'],
              description: ele['description'],
              url: ele['url'],
              urlToImage: ele['urlToImage'],
              publishedAt: ele['publishedAt'],
              content: ele['content']
          );
          news.add(article);
        }
      });
    }
  }
}

class Article{
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  String content;

  Article({
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content
  });
}