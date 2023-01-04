import 'package:flutter/material.dart';
import 'all_news.dart';
import 'category_news.dart';
import 'search_news.dart';
import 'top_news.dart';

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
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "VM",
                style: TextStyle(color: Colors.blue, fontSize: 22),
              ),
              Text(
                " News",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SearchNews()));
              },
              icon: Icon(Icons.search),
              iconSize: 26,
            )
          ],
          iconTheme: Theme.of(context).iconTheme,
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          bottom: TabBar(
            indicatorColor: Colors.blue,
            labelStyle: TextStyle(fontSize: 18),
            indicatorSize: TabBarIndicatorSize.label,
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
        ));
  }
}
