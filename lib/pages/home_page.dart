import 'package:demo/dao/home_dao.dart';
import 'package:demo/model/home_page_entity.dart';
import 'package:demo/widgets/grid_nav.dart';
import 'package:demo/widgets/webview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
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
  HomePageEntity _homePageEntity;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  _loadData() {
    HomeDao.fetch().then((value) {
      setState(() {
        _homePageEntity = value;
      });
    }).catchError((onError) {
      debugPrint(onError);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfff2f2f2),
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
                      Padding(
                          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                          child: Container(
                            padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5)),
                            child: Wrap(
                              alignment: WrapAlignment.spaceBetween,
                              children: _items(),
                            ),
                          )),
                      Padding(
                          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                          child: GridNav(
                              homePageGridNav: _homePageEntity?.gridNav)),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5)),
                          child: Wrap(
                            alignment: WrapAlignment.spaceAround,
                            children: _subItems(),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          _incrementCounter();
                        },
                        child: Text('$counter'),
                      ),
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

  List<Widget> _items() {
    if (_homePageEntity == null) return [];
    return _homePageEntity.localNavList.map((localNav) {
      return InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => WebView(
                          url: localNav.url,
                          statusBarColor:
                              int.parse('0xff' + localNav.statusBarColor),
                          title: localNav.title,
                          hideAppBar: localNav.hideAppBar,
                        )));
          },
          child: Column(
            children: [
              Image.network(
                localNav.icon,
                height: 32,
                width: 32,
              ),
              Text(
                localNav.title,
                style: TextStyle(fontSize: 12),
              )
            ],
          ));
    }).toList();
  }

  List<Widget> _subItems() {
    if (_homePageEntity == null) return [];
    return _homePageEntity.subNavList.map((subNav) {
      return Container(
          width: 60,
          height: 40,
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => WebView(
                            url: subNav.url,
                            statusBarColor: int.parse('0xffffffff'),
                            title: subNav.title,
                            hideAppBar: subNav.hideAppBar,
                          )));
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  subNav.icon,
                  width: 18,
                  height: 18,
                ),
                Text(
                  subNav.title,
                  style: TextStyle(fontSize: 12),
                )
              ],
            ),
          ));
    }).toList();
  }
}
