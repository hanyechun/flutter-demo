import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

const APPBAR_SCROLL_OFFSET = 100;

class _HomePageState extends State<HomePage> {
  List _imageUrl = [
    'http://www.devio.org/img/avatar.png',
    'http://www.devio.org/img/avatar.png',
    'http://www.devio.org/img/avatar.png'
  ];
  double _appBarAlpha = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        MediaQuery.removePadding(
          removeTop: true,
          context: context,
          child: NotificationListener<ScrollNotification>(
              onNotification: (notification) {
                if (notification is ScrollUpdateNotification &&
                    notification.depth == 0)
                  _onScroll(notification.metrics.pixels);
                return true;
              },
              child: ListView(
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
                  ),
                  Container(
                    height: 800,
                    child: ListTile(
                      title: Text('flkdsnglksn'),
                    ),
                  )
                ],
              )),
        ),
        Opacity(
          opacity: _appBarAlpha,
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 20),
            height: 80,
            decoration: BoxDecoration(color: Colors.white),
            child: Text('首页'),
          ),
        )
      ],
    ));
  }

  _onScroll(offset) {
    double alpha = offset / APPBAR_SCROLL_OFFSET;
    if (alpha < 0) {
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
    }
    setState(() {
      _appBarAlpha = alpha;
    });
  }
}
