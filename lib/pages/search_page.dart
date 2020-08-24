import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

const CITY_NAMES = {
  '北京': ['东城区', '西城区', '朝阳区', '丰台区', '海淀区'],
  '南京': ['东城区', '西城区', '朝阳区', '丰台区', '海淀区'],
  '上海': ['东城区', '西城区', '朝阳区', '丰台区', '海淀区'],
  '苏州': ['东城区', '西城区', '朝阳区', '丰台区', '海淀区'],
};

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        children: _buildList(),
      ),
    );
  }

  List<Widget> _buildList() {
    List<Widget> widgets = [];
    CITY_NAMES.keys.forEach((key) {
      widgets.add(_item(key, CITY_NAMES[key]));
    });
    return widgets;
  }

  Widget _item(String city, List<String> subCities) {
    return ExpansionTile(
      title: Text(city),
      children: subCities.map((subCity) => _buildSubCity(subCity)).toList(),
    );
  }

  Widget _buildSubCity(String subCity) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: Container(
        height: 50,
        margin: EdgeInsets.only(bottom: 5),
        decoration: BoxDecoration(
          color: Colors.cyan,
        ),
        child: Text(subCity),
      ),
    );
  }
}
