import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'article.dart';

class NewsTile extends StatelessWidget {
  final String image, title, description, url;
  const NewsTile({Key key, this.image, this.title, this.description, this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.shade700,
            width: 0.5,
          ),
          borderRadius: BorderRadius.circular(15),
          color: Colors.grey.shade200
        ),
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(bottom: 22),
        child: Column(
          children: [
            ClipRRect(
              child: CachedNetworkImage(
                imageUrl: image,
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            SizedBox(height: 10),
            Text(title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(height: 8),
            Text(description,
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 18),
            )
          ],
        ),
      ),
      onTap: (){
        Navigator.push(context,
            MaterialPageRoute(
                builder: (context) => Article(url: url, title: title,)));
      },
    );
  }
}