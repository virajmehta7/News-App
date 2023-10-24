import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Article extends StatefulWidget {
  const Article({super.key, required this.url});

  final String url;

  @override
  State<Article> createState() => _ArticleState();
}

class _ArticleState extends State<Article> {
  int loadingPercentage = 0;
  WebViewController? controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (url) {
            setState(() {
              loadingPercentage = 0;
            });
          },
          onProgress: (progress) {
            setState(() {
              loadingPercentage = progress;
            });
          },
          onPageFinished: (url) {
            setState(() {
              loadingPercentage = 100;
            });
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url.toString()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Share.share(widget.url);
            },
            icon: const Icon(Icons.share),
          )
        ],
      ),
      body: Stack(
        children: [
          WebViewWidget(controller: controller!),
          if (loadingPercentage < 100)
            LinearProgressIndicator(value: loadingPercentage / 100),
        ],
      ),
    );
  }
}
