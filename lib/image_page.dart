import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageWidgetPage extends StatefulWidget {
  @override
  _ImageWidgetPageState createState() => _ImageWidgetPageState();
}

class _ImageWidgetPageState extends State<ImageWidgetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ImageWidget使用'),
        leading: BackButton(),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.network('http://www.devio.org/img/avatar.png'),
          Image.asset(
            'images/pic_head.png',
            width: 100,
            height: 100,
          ),
          FadeInImage.assetNetwork(
              placeholder: 'images/pic_head.png',
              image: 'http://www.devio.org/img/avatar.png'),
          CachedNetworkImage(
            placeholder: (context, url) => CircularProgressIndicator(),
            imageUrl: 'http://www.devio.org/img/avatar.png',
          ),
          Icon(
            Icons.android,
            size: 75,
          ),
        ],
      ),
    );
  }
}
