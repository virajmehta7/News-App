import 'package:flutter/material.dart';
import 'category_news.dart';

class CategoryTile extends StatefulWidget {
  final String? image, category;
  const CategoryTile({Key? key, this.image, this.category}) : super(key: key);

  @override
  _CategoryTileState createState() => _CategoryTileState();
}

class _CategoryTileState extends State<CategoryTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => CategoryNews(category: widget.category,))
        );
      },
      child: Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(15, 50, 15, 40),
          child: Text(widget.category!,
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(widget.image!),
              fit: BoxFit.fitWidth,
              colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.hardLight),
            )
        ),
      ),
    );
  }
}