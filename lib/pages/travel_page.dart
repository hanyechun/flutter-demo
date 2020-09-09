import 'package:demo/dao/travel_tab_dao.dart';
import 'package:demo/model/travel_tab_entity.dart';
import 'package:demo/pages/travel_tab_page.dart';
import 'package:flutter/material.dart';

class TravelPage extends StatefulWidget {
  @override
  _TravelPageState createState() => _TravelPageState();
}

class _TravelPageState extends State<TravelPage> with TickerProviderStateMixin {
  TabController _controller;
  TravelTabEntity _tabEntity;
  List<TravelTabTab> _tabs = [];

  @override
  void initState() {
    _controller = TabController(length: _tabs.length, vsync: this);
    TravelTabDao.fetch().then((value) {
      setState(() {
        _tabEntity = value;
        _tabs = value.tabs;
        _controller = TabController(length: _tabs.length, vsync: this);
      });
    }).catchError((onError) {
      print(onError);
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 20),
            color: Colors.white,
            child: TabBar(
                controller: _controller,
                isScrollable: true,
                labelColor: Colors.black,
                labelPadding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(color: Color(0xff2fcfbb), width: 3),
                ),
                tabs: _tabs.map((tab) {
                  return Tab(
                    text: tab.labelName,
                  );
                }).toList()),
          ),
          Flexible(
              child: TabBarView(
                  controller: _controller,
                  children: _tabs.map((tab) {
                    return TravelTabPage(
                      travelUrl: _tabEntity.url,
                      params: _tabEntity.params,
                      groupChannelCode: tab.groupChannelCode,
                    );
                  }).toList()))
        ],
      ),
    );
  }
}
