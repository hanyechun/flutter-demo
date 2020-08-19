import 'package:flutter/material.dart';

class AnimationPage extends StatefulWidget {
  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage>
    with SingleTickerProviderStateMixin {
  Animation _animation;
  AnimationController _controller;
  AnimationStatus _animationStatus;
  double _animationValue;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _animation = Tween<double>(begin: 0, end: 300).animate(_controller)
      ..addListener(() {
        setState(() {
          _animationValue = _animation.value;
        });
      })
      ..addStatusListener((status) {
        setState(() {
          _animationStatus = status;
        });
      });
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
              Text('value: ' + _animationValue.toString()),
              Text('status: ' + _animationStatus.toString()),
              Container(
                width: _animation.value,
                height: _animation.value,
                child: FlutterLogo(),
              )
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
