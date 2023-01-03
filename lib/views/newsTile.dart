import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';
import 'article.dart';

class NewsTile extends StatelessWidget {
  final image, title, description, url, source, publishedAt;
  const NewsTile({Key? key, required this.image, required this.title, required this.description, required this.url, required this.source, required this.publishedAt}) : super(key: key);

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
            image != '' ? ClipRRect(
              child: Image.network(image, fit: BoxFit.cover,
                loadingBuilder:(BuildContext context, Widget child,ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                    child: Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null ?
                        loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    ),
                  );
                },
              ),
              borderRadius: BorderRadius.circular(20),
            ) : Container(),
            source != null ? Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.fromLTRB(10,10,10,2),
                child: Text(source,
                  style: TextStyle(fontWeight: FontWeight.w300, fontSize: 18),
                ),
              ),
            ) : Container(),
            title != null ? Padding(
              padding: EdgeInsets.all(10),
              child: Text(title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ) : Container(),
            description != null ? Padding(
              padding: EdgeInsets.fromLTRB(10,5,10,10),
              child: Text(description,
                style: TextStyle(fontWeight: FontWeight.w300, fontSize: 18),
              ),
            ) : Container(),
            Row(
              children: [
                publishedAt != null ? Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(DateFormat('dd/MM/yy hh:mm a')
                      .format(publishedAt),
                    style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16),
                  ),
                ) : Container(),
                Spacer(),
                IconButton(
                  onPressed: (){
                    Share.share(url);
                  },
                  icon: Icon(Icons.share),
                )
              ],
            ),
            SizedBox(height: 15)
          ],
        ),
      ),
      onTap: (){
        Navigator.push(context,
            MaterialPageRoute(
                builder: (context) => Article(url: url, title: title, source: source)));
      },
    );
  }
}