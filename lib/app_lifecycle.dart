import 'package:flutter/material.dart';

///如何获取Flutter应用生命周期
///WidgetBindingObserver：是一个Widget绑定观察器，通过它可以监听应用的生命周期、语言变化
class AppLifecycle extends StatefulWidget {
  @override
  _AppLifecycleState createState() => _AppLifecycleState();
}

class _AppLifecycleState extends State<AppLifecycle>
    with WidgetsBindingObserver {
  @override
  void initState() {
    ///添加监听器、监听app生命周期变化
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter应用生命周期'),
        leading: BackButton(),
      ),
      body: Container(
        child: Text('Flutter应用生命周期'),
      ),
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print('----AppLifecycleState = $state----');
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.paused) {
      print('app进入后台');
    } else if (state == AppLifecycleState.resumed) {
      print('app进入前台');
    } else if (state == AppLifecycleState.inactive) {
      print('app处于非活动状态');
    }
  }

  @override
  void dispose() {
    ///移除生命周期监听
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
