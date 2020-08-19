import 'package:demo/pages/home_page.dart';
import 'package:demo/pages/mine_page.dart';
import 'package:demo/pages/search_page.dart';
import 'package:demo/pages/travel_page.dart';
import 'package:flutter/material.dart';

class TabNavigator extends StatefulWidget {
  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  final Color _defaultColor = Colors.grey;
  final Color _activeColor = Colors.blue;
  final PageController _controller = PageController(initialPage: 0);
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: [HomePage(), SearchPage(), TravelPage(), MinePage()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
          onTap: (index) {
            _controller.jumpToPage(index);
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                title: Text(
                  '首页',
                  style: TextStyle(
                      color: _currentIndex == 0 ? _activeColor : _defaultColor),
                ),
                icon: Icon(
                  Icons.home,
                  color: _defaultColor,
                ),
                activeIcon: Icon(
                  Icons.home,
                  color: _activeColor,
                )),
            BottomNavigationBarItem(
                title: Text(
                  '搜索',
                  style: TextStyle(
                      color: _currentIndex == 1 ? _activeColor : _defaultColor),
                ),
                icon: Icon(
                  Icons.search,
                  color: _defaultColor,
                ),
                activeIcon: Icon(
                  Icons.search,
                  color: _activeColor,
                )),
            BottomNavigationBarItem(
                title: Text(
                  '旅拍',
                  style: TextStyle(
                      color: _currentIndex == 2 ? _activeColor : _defaultColor),
                ),
                icon: Icon(
                  Icons.camera_alt,
                  color: _defaultColor,
                ),
                activeIcon: Icon(
                  Icons.camera_alt,
                  color: _activeColor,
                )),
            BottomNavigationBarItem(
                title: Text(
                  '我的',
                  style: TextStyle(
                      color: _currentIndex == 3 ? _activeColor : _defaultColor),
                ),
                icon: Icon(
                  Icons.account_circle,
                  color: _defaultColor,
                ),
                activeIcon: Icon(
                  Icons.account_circle,
                  color: _activeColor,
                )),
          ]),
    );
  }
}
