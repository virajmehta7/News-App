import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vmnews/model/model.dart';

class Service {

  getNews() async {
    var url = Uri.parse("https://newsapi.org/v2/top-headlines?country=in&language=en&pageSize=100&apiKey=e384bb1a856a4051984dc40de691c58f");
    var res = await http.get(url);
    Map<String, dynamic> json = jsonDecode(res.body);
    List<dynamic> body = json['articles'];
    List<Article> articles = body.map((dynamic item) => Article.fromJson(item)).toList();
    return articles;
  }

  getCategoryNews(String? category) async {
    var url = Uri.parse("https://newsapi.org/v2/top-headlines?category=$category&country=in&language=en&pageSize=100&apiKey=e384bb1a856a4051984dc40de691c58f");
    var res = await http.get(url);
    Map<String, dynamic> json = jsonDecode(res.body);
    List<dynamic> body = json['articles'];
    List<Article> articles = body.map((dynamic item) => Article.fromJson(item)).toList();
    return articles;
  }

  getAllNews() async {
    var url = Uri.parse("https://newsapi.org/v2/top-headlines?language=en&apiKey=e384bb1a856a4051984dc40de691c58f");
    var res = await http.get(url);
    Map<String, dynamic> json = jsonDecode(res.body);
    List<dynamic> body = json['articles'];
    List<Article> articles = body.map((dynamic item) => Article.fromJson(item)).toList();
    return articles;
  }

  getSearchNews(String search) async {
    var url = Uri.parse("https://newsapi.org/v2/everything?qInTitle=$search&sortBy=publishedAt&language=en&pageSize=100&apiKey=e384bb1a856a4051984dc40de691c58f");
    var res = await http.get(url);
    Map<String, dynamic> json = jsonDecode(res.body);
    List<dynamic> body = json['articles'];
    List<Article> articles = body.map((dynamic item) => Article.fromJson(item)).toList();
    return articles;
  }

}