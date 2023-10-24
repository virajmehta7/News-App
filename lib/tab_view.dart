import 'package:flutter/material.dart';
import 'package:news/utils/text_style.dart';
import 'package:news/views/news_types/world_news.dart';
import 'package:news/views/news_types/category_news.dart';
import 'package:news/views/news_types/search_news.dart';
import 'package:news/views/news_types/top_news.dart';

class TabView extends StatelessWidget {
  const TabView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 8,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("VM News"),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SearchNews()));
              },
              icon: const Icon(Icons.search),
            )
          ],
          bottom: TabBar(
            labelStyle: styleN.copyWith(fontWeight: FontWeight.normal),
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 3.5,
            isScrollable: true,
            physics: const BouncingScrollPhysics(),
            tabs: const [
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
        body: const TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            TopNews(),
            WorldNews(),
            CategoryNews(category: 'Business'),
            CategoryNews(category: 'Technology'),
            CategoryNews(category: 'Entertainment'),
            CategoryNews(category: 'Sports'),
            CategoryNews(category: 'Science'),
            CategoryNews(category: 'Health')
          ],
        ),
      ),
    );
  }
}
