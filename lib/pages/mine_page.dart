import 'package:demo/widgets/webview.dart';
import 'package:flutter/material.dart';

class MinePage extends StatefulWidget {
  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
        url: 'https://m.ctrip.com/webapp/myctrip',
        statusBarColor: 0xff4c5bca,
        hideAppBar: true,
        backForbid: true,
      ),
    );
  }
}
