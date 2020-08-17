import 'package:flutter/material.dart';

///Flutter如何进行layout布局
class LayoutPage extends StatefulWidget {
  @override
  _LayoutPageState createState() => _LayoutPageState();
}

class _LayoutPageState extends State<LayoutPage> {
  int _currentIndex = 0;

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
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    color: Colors.grey,
                  ),
                  activeIcon: Icon(
                    Icons.home,
                    color: Colors.blue,
                  ),
                  title: Text('首页')),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.list,
                    color: Colors.grey,
                  ),
                  activeIcon: Icon(
                    Icons.list,
                    color: Colors.blue,
                  ),
                  title: Text('列表'))
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: null,
            child: Text('float'),
          ),
          body: _currentIndex == 0
              ? Container(
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
                      ),
//                      Expanded(
//                        child: Container(
//                          decoration: BoxDecoration(
//                              color: Colors.redAccent
//                          ),
//                          child: Text('高度撑满'),
//                        ),
//                      )
                    ],
                  ),
                )
              : RefreshIndicator(
                  child: ListView(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(color: Colors.white),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                ClipOval(
                                  child: SizedBox(
                                    width: 100,
                                    height: 100,
                                    child: Image.network(
                                        'http://www.devio.org/img/avatar.png'),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(10),
                                  child: ClipRRect(
                                    //圆角
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4)),
                                    child: Opacity(
                                      opacity: 0.6,
                                      child: Image.network(
                                        'http://www.devio.org/img/avatar.png',
                                        width: 100,
                                        height: 100,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            TextField(
                              decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.fromLTRB(5, 0, 5, 0),
                                  hintText: '请输入',
                                  hintStyle: TextStyle(fontSize: 15)),
                            ),
                            Container(
                              height: 100,
                              margin: EdgeInsets.all(10),
//                              decoration:
//                                  BoxDecoration(color: Colors.lightBlueAccent),
                              child: PhysicalModel(
                                color: Colors.transparent,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4)),
                                clipBehavior: Clip.antiAlias, //抗锯齿
                                child: PageView(
                                  children: <Widget>[
                                    _item('Page1', Colors.cyanAccent),
                                    _item('Page1', Colors.pink),
                                    _item('Page1', Colors.yellow),
                                  ],
                                ),
                              ),
                            ),
                            FractionallySizedBox(
                              widthFactor: 1,
                              child: Container(
                                decoration:
                                    BoxDecoration(color: Colors.amberAccent),
                                child: Text('宽度撑满'),
                              ),
                            )
                          ],
                        ),
                      ),
                      Stack(
                        children: <Widget>[
                          Image.network(
                            'http://www.devio.org/img/avatar.png',
                            width: 100,
                            height: 100,
                          ),
                          Positioned(
                            left: 0,
                            bottom: 0,
                            child: Image.network(
                              'http://www.devio.org/img/avatar.png',
                              width: 36,
                              height: 36,
                            ),
                          )
                        ],
                      ),
                      Wrap(
                        spacing: 8, //水平间距
                        runSpacing: 6, //垂直间距
                        children: <Widget>[
                          _chip('Flutter'),
                          _chip('进阶'),
                          _chip('学习'),
                          _chip('实战'),
                          _chip('App'),
                        ],
                      )
                    ],
                  ),
                  onRefresh: _handleRefresh,
                )),
    );
  }

  Future<Null> _handleRefresh() async {
    await Future.delayed(Duration(milliseconds: 200));
    return null;
  }

  _item(String s, Color color) {
    return Container(
      decoration: BoxDecoration(color: color),
      alignment: Alignment.center,
      child: Text(
        s,
        style: TextStyle(fontSize: 22, color: Colors.white),
      ),
    );
  }

  _chip(String label) {
    return Chip(
      label: Text(label),
      avatar: CircleAvatar(
        backgroundColor: Colors.cyanAccent.shade700,
        child: Text(
          label.substring(0, 1),
          style: TextStyle(fontSize: 10),
        ),
      ),
    );
  }
}
