import 'package:flutter/material.dart';

///无状态的Widget，StatelessWidget只有createElement、build两个生命周期方法
///StatefulWidget的生命周期按照时期分为三组：
///1、初始化时期
///createState、initState
///2、更新时期
///didChangeDependencies、build、didUpdateWidget
///3、销毁期
///deactivate、dispose
class WidgetLifecycle extends StatefulWidget {
  ///构建StatefulWidget时，会立即调用createState()
  @override
  _WidgetLifecycleState createState() => _WidgetLifecycleState();
}

class _WidgetLifecycleState extends State<WidgetLifecycle> {
  int _count = 0;

  ///类似于Android的onCreate()方法，通常用于初始化，如channel初始化、监听器初始化等
  @override
  void initState() {
    print('-----initState()-----');
    super.initState();
  }

  ///当依赖的State对象改变时调用：
  ///a.在第一次构建widget时，在initState()之后立即调用此方法
  ///b.如果StatefulWidget依赖于InheredWidget，那么当当前State所依赖InheritedWidget中的变量改变时会再次调用
  ///拓展：InheritedWidget可以高效的将数据在Widget树中向下传递、共享。可参考：https://book.flutterchina.club/chapter7/inherited_widget.html
  @override
  void didChangeDependencies() {
    print('-----didChangeDependencies()-----');
    super.didChangeDependencies();
  }

  ///这是一个必须实现的方法，在这里呈现页面内容：
  ///它会在didChangeDependencies()之后立即调用
  ///另外调用setState()之后也会调用此方法
  @override
  Widget build(BuildContext context) {
    print('-----build()-----');
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter生命周期'),
        leading: BackButton(),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                setState(() {
                  _count++;
                });
              },
              child: Text(
                '点我',
                style: TextStyle(fontSize: 26),
              ),
            ),
            Text(_count.toString()),
          ],
        ),
      ),
    );
  }

  ///当父组件重绘的时候才会调用该方法
  ///该方法会携带一个oldWidget参数，可以与当前Widget进行对比以便执行一些额外逻辑，如：
  /// if (oldWidget.xxx != widget.xxx)
  @override
  void didUpdateWidget(WidgetLifecycle oldWidget) {
    print('-----didUpdateWidget()-----');
    super.didUpdateWidget(oldWidget);
  }

  ///很少使用，在组件被移除时调用，并在dispose()之前调用
  @override
  void deactivate() {
    print('-----deactivate()-----');
    super.deactivate();
  }

  ///类似于Android的onDestroy()方法，销毁时调用，通常用于释放资源
  @override
  void dispose() {
    print('-----dispose()-----');
    super.dispose();
  }
}
