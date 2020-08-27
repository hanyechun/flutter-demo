import 'package:demo/model/home_page_entity.dart';
import 'package:demo/widgets/webview.dart';
import 'package:flutter/material.dart';

class GridNav extends StatelessWidget {
  final HomePageGridNav homePageGridNav;

  GridNav({@required this.homePageGridNav});

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(5),
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: _gridNavItems(context),
        ));
  }

  _gridNavItems(BuildContext context) {
    List<Widget> items = [];
    if (homePageGridNav != null) {
      HomePageGridNavHotel hotel = homePageGridNav.hotel;
      HomePageGridNavFlight flight = homePageGridNav.flight;
      HomePageGridNavTravel travel = homePageGridNav.travel;
      items.add(_gridNavItem(
        context,
        true,
        int.parse('0xff' + hotel.startColor),
        int.parse('0xff' + hotel.endColor),
        LeftCommonModel(
            title: hotel.mainItem.title,
            icon: hotel.mainItem.icon,
            url: hotel.mainItem.url,
            statusBarColor: hotel.mainItem.statusBarColor),
        CenterCommonModel(
          title: hotel.item1.title,
          url: hotel.item1.url,
        ),
        CenterCommonModel(
          title: hotel.item2.title,
          url: hotel.item2.url,
        ),
        CenterCommonModel(
          title: hotel.item3.title,
          url: hotel.item3.url,
        ),
        CenterCommonModel(
          title: hotel.item4.title,
          url: hotel.item4.url,
        ),
      ));
      items.add(_gridNavItem(
        context,
        false,
        int.parse('0xff' + flight.startColor),
        int.parse('0xff' + flight.endColor),
        LeftCommonModel(
            title: flight.mainItem.title,
            icon: flight.mainItem.icon,
            url: flight.mainItem.url),
        CenterCommonModel(
          title: flight.item1.title,
          url: flight.item1.url,
        ),
        CenterCommonModel(
          title: flight.item2.title,
          url: flight.item2.url,
        ),
        CenterCommonModel(
          title: flight.item3.title,
          url: flight.item3.url,
        ),
        CenterCommonModel(
          title: flight.item4.title,
          url: flight.item4.url,
        ),
      ));
      items.add(_gridNavItem(
        context,
        false,
        int.parse('0xff' + homePageGridNav.travel.startColor),
        int.parse('0xff' + homePageGridNav.travel.endColor),
        LeftCommonModel(
            title: travel.mainItem.title,
            icon: travel.mainItem.icon,
            url: travel.mainItem.url,
            statusBarColor: travel.mainItem.statusBarColor),
        CenterCommonModel(
          title: travel.item1.title,
          url: travel.item1.url,
        ),
        CenterCommonModel(
          title: travel.item2.title,
          url: travel.item2.url,
        ),
        CenterCommonModel(
          title: travel.item3.title,
          url: travel.item3.url,
        ),
        CenterCommonModel(
          title: travel.item4.title,
          url: travel.item4.url,
        ),
      ));
    }
    return items;
  }

  _gridNavItem(
      BuildContext context,
      bool first,
      int startColor,
      int endColor,
      LeftCommonModel leftModel,
      CenterCommonModel model1,
      CenterCommonModel model2,
      CenterCommonModel model3,
      CenterCommonModel model4) {
    return Container(
        height: 88,
        margin: first ? null : EdgeInsets.only(top: 3),
        decoration: BoxDecoration(
            gradient:
                LinearGradient(colors: [Color(startColor), Color(endColor)])),
        child: Row(
          children: [
            Expanded(
              child: _leftItem(context, leftModel),
              flex: 1,
            ),
            Expanded(
              child: _doubleItem(context, model1, model2),
              flex: 1,
            ),
            Expanded(
              child: _doubleItem(context, model3, model4),
              flex: 1,
            ),
          ],
        ));
  }

  _leftItem(BuildContext context, LeftCommonModel model) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => WebView(
                      url: model.url,
                      statusBarColor: int.parse('0xff' + model.statusBarColor),
                      title: model.title,
                      hideAppBar: model.hideAppBar,
                    )));
      },
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Image.network(
            model.icon,
            width: 121,
            height: 88,
            fit: BoxFit.contain,
            alignment: Alignment.bottomCenter,
          ),
          Container(
            margin: EdgeInsets.only(top: 11),
            child: Text(
              model.title,
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          )
        ],
      ),
    );
  }

  _doubleItem(BuildContext context, CenterCommonModel model1,
      CenterCommonModel model2) {
    return Column(
      children: [
        Expanded(child: _item(context, model1, true)),
        Expanded(child: _item(context, model2, false))
      ],
    );
  }

  _item(BuildContext context, CenterCommonModel model, bool first) {
    BorderSide borderSide = BorderSide(color: Colors.white, width: 0.8);
    return FractionallySizedBox(
        widthFactor: 1,
        child: _warpGesture(
          context,
          model,
          Container(
            decoration: BoxDecoration(
                border: Border(
                    left: borderSide,
                    bottom: first ? borderSide : BorderSide.none)),
            child: Center(
              child: Text(
                model.title,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
          ),
        ));
  }

  _warpGesture(BuildContext context, CenterCommonModel model, Widget widget) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => WebView(
                      url: model.url,
                      statusBarColor: int.parse('0xff' + model.statusBarColor),
                      title: model.title,
                      hideAppBar: model.hideAppBar,
                    )));
      },
      child: widget,
    );
  }
}

class LeftCommonModel {
  String title;
  String icon;
  String url;
  bool hideAppBar;
  String statusBarColor;

  LeftCommonModel(
      {this.title,
      this.icon,
      this.url,
      this.hideAppBar = true,
      this.statusBarColor = 'ffffff'});
}

class CenterCommonModel {
  String title;
  String url;
  String statusBarColor;
  bool hideAppBar;

  CenterCommonModel(
      {this.title,
      this.url,
      this.statusBarColor = 'ffffff',
      this.hideAppBar = true});
}
