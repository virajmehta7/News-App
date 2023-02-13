import 'package:flutter/material.dart';
import 'package:vmnews/views/news/all_news.dart';
import 'package:vmnews/views/news/category_news.dart';
import 'package:vmnews/views/news/search_news.dart';
import 'package:vmnews/views/news/top_news.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(initialIndex: 0, length: 8, vsync: this);
    tabController!.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("VM News"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SearchNews()));
            },
            icon: Icon(Icons.search),
          )
        ],
        bottom: TabBar(
          labelStyle: TextStyle(fontSize: 18),
          indicatorSize: TabBarIndicatorSize.tab,
          controller: tabController,
          isScrollable: true,
          physics: ScrollPhysics(),
          tabs: [
            Tab(text: 'Top'),
            Tab(text: 'World'),
            Tab(text: 'Business'),
            Tab(text: 'Technology'),
            Tab(text: 'Entertainment'),
            Tab(text: 'Sports'),
            Tab(text: 'Science'),
            Tab(text: 'Health')
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          TopNews(),
          AllNews(),
          CategoryNews(category: 'Business'),
          CategoryNews(category: 'Technology'),
          CategoryNews(category: 'Entertainment'),
          CategoryNews(category: 'Sports'),
          CategoryNews(category: 'Science'),
          CategoryNews(category: 'Health')
        ],
      ),
    );
  }
}
