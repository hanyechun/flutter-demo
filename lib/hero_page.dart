import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class PhotoHero extends StatelessWidget {
  final String photo;
  final VoidCallback onTap;
  final double width;

  PhotoHero({Key key, this.photo, this.onTap, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Hero(
        tag: photo,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Image.network(
              photo,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}

class HeroAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    timeDilation = 10;
    return Scaffold(
      appBar: AppBar(
        title: Text('Basic hero animation'),
      ),
      body: Container(
        color: Colors.blueGrey,
        alignment: Alignment.topLeft,
        child: PhotoHero(
            photo: 'http://www.devio.org/img/avatar.png',
            width: 100,
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Scaffold(
                  appBar: AppBar(
                    title: Text('Flippers Page'),
                  ),
                  body: Center(
                    child: PhotoHero(
                      photo: 'http://www.devio.org/img/avatar.png',
                      width: 300,
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                );
              }));
            }),
      ),
    );
  }
}
