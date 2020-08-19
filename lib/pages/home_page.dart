import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List _imageUrl = [
    'http://www.devio.org/img/avatar.png',
    'http://www.devio.org/img/avatar.png',
    'http://www.devio.org/img/avatar.png'
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
          body: Column(
        children: [
          Container(
            height: 160,
            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                return Image.network(
                  _imageUrl[index],
                  fit: BoxFit.fill,
                );
              },
              pagination: SwiperPagination(),
              itemCount: _imageUrl.length,
              autoplay: true,
            ),
          )
        ],
      )),
    );
  }
}
