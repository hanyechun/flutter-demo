import 'package:demo/dao/search_dao.dart';
import 'package:demo/model/search_entity.dart';
import 'package:demo/widgets/search_bar.dart';
import 'package:flutter/material.dart';

const URL =
    'https://m.ctrip.com/restapi/h5api/globalsearch/search?source=mobileweb&action=mobileweb&keyword=';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  SearchEntity _searchEntity;
  String keyword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _appBar(),
          MediaQuery.removeViewPadding(
              context: context,
              removeTop: true,
              child: Expanded(
                  flex: 1,
                  child: ListView.builder(
                      itemCount: _searchEntity?.data?.length ?? 0,
                      itemBuilder: (BuildContext context, int position) =>
                          _item(position))))
        ],
      ),
    );
  }

  _appBar() {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0x66000000), Colors.transparent],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
      child: Container(
        height: 80,
        padding: EdgeInsets.fromLTRB(15, 20, 15, 0),
        decoration: BoxDecoration(color: Colors.white),
        child: SearchBar(
          hideLeft: true,
          hint: '酒店 机票',
          rightButtonClick: null,
          onChanged: _onTextChanged,
        ),
      ),
    );
  }

  _item(int position) {
    if (_searchEntity == null || _searchEntity.data == null) return;
    SearchData item = _searchEntity.data[position];
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 0.3, color: Colors.grey))),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.flight,
              color: Colors.blue,
            ),
          ),
          Column(
            children: [
              Container(
                width: 300,
                child: _title(item),
              ),
              Container(
                width: 300,
                child: _subTitle(item),
              )
            ],
          )
        ],
      ),
    );
  }

  _onTextChanged(String text) {
    keyword = text;
    if (text.length == 0) {
      setState(() {
        _searchEntity = null;
      });
      return;
    }
    SearchDao.fetch(URL + text, text).then((value) {
      if (value.keyword != keyword) return;
      setState(() {
        _searchEntity = value;
      });
    }).catchError((e) {
      print(e);
    });
  }

  _title(SearchData item) {
    if (item == null) return null;
    List<TextSpan> spans = [];
    if (item.word != null && item.word.length > 0) {
      List<String> arr = item.word.split(_searchEntity.keyword);
      TextStyle normalStyle = TextStyle(fontSize: 16, color: Colors.black87);
      TextStyle keywordStyle = TextStyle(fontSize: 16, color: Colors.orange);
      for (int i = 0; i < arr.length; i++) {
        if ((i + 1) % 2 == 0) {
          spans.add(TextSpan(text: _searchEntity.keyword, style: keywordStyle));
        }
        if (arr[i].length > 0) {
          spans.add(TextSpan(text: arr[i], style: normalStyle));
        }
      }
      spans.add(TextSpan(
          text: '  ' + (item.districtname ?? '') + ' ' + (item.zonename ?? ''),
          style: TextStyle(fontSize: 14, color: Colors.grey)));
    }
    return RichText(text: TextSpan(children: spans));
  }

  _subTitle(SearchData item) {
    if (item == null) return;
    return RichText(
        text: TextSpan(children: [
      TextSpan(
          text: item.price ?? '',
          style: TextStyle(fontSize: 16, color: Colors.orange)),
      TextSpan(
          text: '  ' + (item.star ?? ''),
          style: TextStyle(fontSize: 12, color: Colors.grey))
    ]));
  }
}
