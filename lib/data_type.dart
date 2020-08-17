import 'package:flutter/material.dart';

class DataType extends StatefulWidget {
  @override
  _DataTypeState createState() => _DataTypeState();
}

class _DataTypeState extends State<DataType> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(_listType()),
    );
  }

  String _listType(){
    return '离开广泛的交流开高速路口';
  }
}
