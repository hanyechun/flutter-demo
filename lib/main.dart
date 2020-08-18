import 'package:demo/gesture_page.dart';
import 'package:demo/launch_page.dart';
import 'package:demo/layout_page.dart';
import 'package:demo/stateful_group_page.dart';
import 'package:demo/stateless_group_page.dart';
import 'package:demo/widget_lifecycle.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RouteNavigator(),
      routes: <String, WidgetBuilder>{
        'less': (BuildContext context) => LessGroupPage(),
        'ful': (BuildContext context) => StatefulGroup(),
        'layout': (BuildContext context) => LayoutPage(),
        'gesture': (BuildContext context) => GesturePage(),
        'launch': (BuildContext context) => LaunchPage(),
        'lifecycle': (BuildContext context) => WidgetLifecycle(),
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
    return Scaffold(
      appBar: AppBar(
        title: Text('如何创建Flutter的路由与导航?'),
      ),
      body: Center(
        child: Column(
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
          ],
        ),
      ),
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
