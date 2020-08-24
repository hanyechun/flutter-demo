import 'package:flutter/material.dart';

class TravelPage extends StatefulWidget {
  @override
  _TravelPageState createState() => _TravelPageState();
}

const CITY_NAME = ['粉丝', '刚发的', '刚发的', '换个', '火凤凰', '好烦好烦', '火凤凰更好'];

class _TravelPageState extends State<TravelPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GridView.count(
        crossAxisCount: 2,
        children: _buildCities(),
      ),
    );
  }

  List<Widget> _buildCities() {
    return CITY_NAME.map((city) => _item(city)).toList();
  }

  Widget _item(String city) {
    return Container(
      height: 50,
      alignment: Alignment.center,
      margin: EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(color: Colors.teal),
      child: Text(
        city,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
