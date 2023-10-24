import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news/utils/text_style.dart';
import 'package:news/views/web_view_article.dart';

class NewsTile extends StatelessWidget {
  const NewsTile(
      {Key? key,
      required this.image,
      required this.title,
      required this.description,
      required this.url,
      required this.source,
      required this.publishedAt})
      : super(key: key);

  final String image, title, description, url, source;
  final DateTime publishedAt;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => Article(url: url)));
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 2),
        elevation: 8,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                image,
                fit: BoxFit.cover,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const CircularProgressIndicator();
                },
                errorBuilder: (BuildContext context, Object error,
                    StackTrace? stackTrace) {
                  return const Icon(Icons.newspaper, size: 100);
                },
              ),
            ),
            if (source != '')
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(source, style: styleN)),
              ),
            if (title != '')
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(title, style: styleB),
              ),
            if (description != '')
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                child: Text(description, style: styleN),
              ),
            if (publishedAt.toString() != '')
              Padding(
                padding: const EdgeInsets.all(10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                      DateFormat('dd/MM/yy hh:mm a').format(publishedAt),
                      style: styleS),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
