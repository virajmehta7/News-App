import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'article.dart';

class NewsTile extends StatelessWidget {
  final String? image, title, description, url, source;
  const NewsTile({Key? key, this.image, this.title, this.description, this.url, this.source}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30)
        ),
        margin: EdgeInsets.fromLTRB(5,5,5,30),
        color: Colors.grey.shade200,
        elevation: 15,
        shadowColor: Colors.grey,
        child: Column(
          children: [
            image != null ? ClipRRect(
              child: CachedNetworkImage(
                imageUrl: image!,
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(20),
            ) : Container(),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(title!,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10,5,10,10),
              child: Text(description!,
                style: TextStyle(fontWeight: FontWeight.w300, fontSize: 18),
              ),
            ),
            SizedBox(height: 15)
          ],
        ),
      ),
      onTap: (){
        Navigator.push(context,
            MaterialPageRoute(
                builder: (context) => Article(url: url, title: title, source: source,)));
      },
    );
  }
}