import 'package:flutter/material.dart';

class LessGroupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(fontSize: 20);
    return MaterialApp(
      title: 'StatelessWeight与基础组件',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("StatelessWeight与基础组件"),
          leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(color: Colors.white),
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              Text(
                "i am Text",
                style: textStyle,
              ),
              Icon(
                Icons.android,
                size: 50,
                color: Colors.cyan,
              ),
              CloseButton(),
              BackButton(),
              Chip(
                avatar: Icon(Icons.people),
                label: Text('StatelessWeight与基础组件'),
              ),
              Divider(
                height: 10,
                indent: 10,
                color: Colors.amberAccent,
              ),
              Card(
                color: Colors.white,
                elevation: 5,
                margin: EdgeInsets.all(10),
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'i am card',
                    style: textStyle,
                  ),
                ),
              ),
              AlertDialog(
                title: Text('title'),
                content: Text('加夫里什健康'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
