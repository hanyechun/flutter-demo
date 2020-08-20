import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

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
  String showResult = '';
  int counter = 0;

  Future<CommonModel> fetchPost() async {
    final response = await http
        .get('http://www.devio.org/io/flutter_app/json/test_common_model.json');
    final result = json.decode(Utf8Decoder().convert(response.bodyBytes));
    return CommonModel.fromJson(result);
  }

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
                  InkWell(
                    onTap: () {
                      _incrementCounter();
                    },
                    child: Text('$counter'),
                  ),
                  InkWell(
                    onTap: () {
                      fetchPost().then((value) {
                        setState(() {
                          showResult = value.icon;
                        });
                      });
                    },
                    child: Text('点我请求'),
                  ),
                  Image.network(
                    showResult,
                    fit: BoxFit.fill,
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

  _incrementCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
//    prefs.remove('counter');
    setState(() {
      counter = prefs.getInt('counter') ?? 100;
    });
    counter--;
    await prefs.setInt('counter', counter);
  }
}

class CommonModel {
  final String icon;
  final String title;
  final String url;

  CommonModel({this.icon, this.title, this.url});

  factory CommonModel.fromJson(Map<String, dynamic> json) {
    return CommonModel(
      icon: json['icon'],
      title: json['title'],
      url: json['url'],
    );
  }
}
