import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FeedComponent extends StatelessWidget {
  const FeedComponent(
      this.imageUrl, this.description, this.id, this.title, this.onClick);

  final String imageUrl;
  final String title;
  final String description;
  final String id;
  final Function() onClick;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onClick(),
      child: Card(
        margin: EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 5,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.network(
              imageUrl,
              width: 150,
              height: 150,
            ),
            Container(
              padding: EdgeInsets.only(left: 16, top: 8, right: 8, bottom: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text(title), Text(description)],
              ),
            )
          ],
        ),
      ),
    );
  }
}
