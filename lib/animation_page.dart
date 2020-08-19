import 'package:flutter/material.dart';

class AnimationPage extends StatefulWidget {
  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class AnimatedLogo extends AnimatedWidget {
  AnimatedLogo({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return new Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        width: animation.value,
        height: animation.value,
        child: FlutterLogo(),
      ),
    );
  }
}

class _AnimationPageState extends State<AnimationPage>
    with SingleTickerProviderStateMixin {
  Animation _animation;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _animation = Tween<double>(begin: 0, end: 300).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation的使用'),
        leading: BackButton(),
      ),
      body: Container(
          margin: EdgeInsets.only(top: 50),
          alignment: Alignment.center,
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  _controller.reset();
                  _controller.forward();
                },
                child: Text(
                  'start',
                ),
              ),
              AnimatedLogo(
                animation: _animation,
              ),
            ],
          )),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
