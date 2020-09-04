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
  List<HomePageBannerList> _images;
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
        _images = _homePageEntity.bannerList;
      });
    }).catchError((onError) {
      print(onError);
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
                        child: _images != null
                            ? Swiper(
                                onTap: (index) {
                                  _jumpWebView(_images[index].url,
                                      int.parse('0x00000000'), 'banner', true);
                                },
                                itemBuilder: (BuildContext context, int index) {
                                  return Image.network(
                                    _images[index].icon,
                                    fit: BoxFit.fill,
                                  );
                                },
                                pagination: SwiperPagination(),
                                itemCount: _images.length,
                                autoplay: true,
                                autoplayDelay: 5000,
                              )
                            : null,
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
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5)),
                          child: Column(
                            children: _saleBoxItems(),
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
            _jumpWebView(
                localNav.url,
                int.parse('0xff' + localNav.statusBarColor),
                localNav.title,
                localNav.hideAppBar);
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
              _jumpWebView(subNav.url, int.parse('0xffffffff'), subNav.title,
                  subNav.hideAppBar);
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

  _saleBoxItems() {
    List<Widget> items = [];
    if (_homePageEntity == null) return items;
    items.add(_saleBoxTopItem());
    items.add(_saleBoxItem(_homePageEntity.salesBox.bigCard1.icon,
        _homePageEntity.salesBox.bigCard2.icon, true));
    items.add(_saleBoxItem(_homePageEntity.salesBox.smallCard1.icon,
        _homePageEntity.salesBox.smallCard2.icon, false));
    items.add(_saleBoxItem(_homePageEntity.salesBox.smallCard3.icon,
        _homePageEntity.salesBox.smallCard4.icon, false));
    return items;
  }

  _saleBoxTopItem() {
    return Container(
      height: 44,
      padding: EdgeInsets.only(left: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.network(
            _homePageEntity.salesBox.icon,
            height: 15,
            fit: BoxFit.fill,
          ),
          Container(
            margin: EdgeInsets.only(right: 10),
            padding: EdgeInsets.fromLTRB(7, 1, 7, 2),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: LinearGradient(colors: [
                  Color(0xffff4e63),
                  Color(0xffff6cc9),
                ], begin: Alignment.centerLeft, end: Alignment.centerRight)),
            child: Text(
              '获取更多福利>',
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          )
        ],
      ),
    );
  }

  _saleBoxItem(String icon1, String icon2, bool big) {
    BorderSide borderSide = BorderSide(color: Color(0xfff2f2f2), width: 0.8);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          decoration:
              BoxDecoration(border: Border(right: borderSide, top: borderSide)),
          child: Image.network(
            icon1,
            width: MediaQuery.of(context).size.width / 2 - 10.5,
            height: big ? 129 : 80,
            fit: BoxFit.fill,
          ),
        ),
        Container(
          decoration: BoxDecoration(border: Border(top: borderSide)),
          child: Image.network(
            icon2,
            width: MediaQuery.of(context).size.width / 2 - 10.5,
            height: big ? 129 : 80,
            fit: BoxFit.fill,
          ),
        ),
      ],
    );
  }

  _jumpWebView(String url, int color, String title, bool hideAppBar) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => WebView(
                  url: url,
                  statusBarColor: color,
                  title: title,
                  hideAppBar: hideAppBar,
                )));
  }
}
