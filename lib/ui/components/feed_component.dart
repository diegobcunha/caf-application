import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FeedComponent extends StatelessWidget {
  const FeedComponent(this._imageUrl, this._description, this._id, this._title, this._onClick);

  final String _imageUrl;
  final String _title;
  final String _description;
  final String _id;
  final Function _onClick;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onClick(),
      child: Card(
        child: Row(children: [
          FadeInImage.assetNetwork(
              placeholder: "",
              image: _imageUrl,
              fit: BoxFit.cover,
              width: 95.0,
              height: 95.0),
          Column(
            children: [],
          )
        ]),
      ),
    );
  }
}
