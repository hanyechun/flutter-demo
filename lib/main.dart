import 'dart:io';

import 'package:demo/animation_page.dart';
import 'package:demo/app_lifecycle.dart';
import 'package:demo/gesture_page.dart';
import 'package:demo/hero_page.dart';
import 'package:demo/image_page.dart';
import 'package:demo/launch_page.dart';
import 'package:demo/layout_page.dart';
import 'package:demo/navigator/tab_navigator.dart';
import 'package:demo/photo_page.dart';
import 'package:demo/stateful_group_page.dart';
import 'package:demo/stateless_group_page.dart';
import 'package:demo/widget_lifecycle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(TabNavigator());
  if (Platform.isAndroid) {
    SystemUiOverlayStyle style =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(style);
  }
}

class DynamicTheme extends StatefulWidget {
  @override
  _DynamicThemeState createState() => _DynamicThemeState();
}

class _DynamicThemeState extends State<DynamicTheme> {
  bool _isDayMode = true;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: _isDayMode ? Brightness.light : Brightness.dark,
//        fontFamily: 'Roboto-Light', //全局更换字体
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('如何创建Flutter的路由与导航?'),
        ),
        body: Column(
          children: [
            SwitchListTile(
              title: Text('切换${_isDayMode ? '夜' : '日'}间模式'),
              value: _isDayMode,
              onChanged: (value) {
                setState(() {
                  _isDayMode = value;
                });
              },
            ),
            RouteNavigator()
          ],
        ),
      ),
      routes: <String, WidgetBuilder>{
        'less': (BuildContext context) => LessGroupPage(),
        'ful': (BuildContext context) => StatefulGroup(),
        'layout': (BuildContext context) => LayoutPage(),
        'gesture': (BuildContext context) => GesturePage(),
        'launch': (BuildContext context) => LaunchPage(),
        'lifecycle': (BuildContext context) => WidgetLifecycle(),
        'applife': (BuildContext context) => AppLifecycle(),
        'photo': (BuildContext context) => PhotoPage(),
        'image': (BuildContext context) => ImageWidgetPage(),
        'animation': (BuildContext context) => AnimationPage(),
        'hero': (BuildContext context) => HeroAnimation(),
        'trip': (BuildContext context) => TabNavigator(),
      },
    );
  }
}

class RouteNavigator extends StatefulWidget {
  @override
  _RouteNavigatorState createState() => _RouteNavigatorState();
}

class _RouteNavigatorState extends State<RouteNavigator> {
  bool byName = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SwitchListTile(
          title: Text('${byName ? '' : '不'}通过路由名跳转'),
          value: byName,
          onChanged: (value) {
            setState(() {
              byName = value;
            });
          },
        ),
        _item('StatelessWeight与基础组件', LessGroupPage(), 'less'),
        _item('StateFulWeight与基础组件', StatefulGroup(), 'ful'),
        _item('Flutter如何进行layout布局', LayoutPage(), 'layout'),
        _item('如何检测用户手势和点击事件', GesturePage(), 'gesture'),
        _item('如何打开第三方应用', LaunchPage(), 'launch'),
        _item('Flutter生命周期', WidgetLifecycle(), 'lifecycle'),
        _item('Flutter应用生命周期', AppLifecycle(), 'applife'),
        _item('拍照', PhotoPage(), 'photo'),
        _item('ImageWidget', ImageWidgetPage(), 'image'),
        _item('Animation', AnimationPage(), 'animation'),
        _item('Hero动画使用', HeroAnimation(), 'hero'),
        _item('携程demo', TabNavigator(), 'trip'),
      ],
    );
  }

  _item(String title, page, String routeName) {
    return Container(
      child: RaisedButton(
        onPressed: () {
          if (byName) {
            Navigator.pushNamed(context, routeName);
          } else {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => page));
          }
        },
        child: Text(title),
      ),
    );
  }
}
