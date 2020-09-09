import 'package:demo/dao/travel_page_dao.dart';
import 'package:demo/model/travel_page_entity.dart';
import 'package:demo/model/travel_tab_entity.dart';
import 'package:demo/widgets/loading_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

const PAGE_SIZE = 10;
const TRAVEL_URL =
    'https://m.ctrip.com/restapi/soa2/16189/json/searchTripShootListForHomePageV2?_fxpcqlniredt=09031014111431397988&__gw_appid=99999999&__gw_ver=1.0&__gw_from=10650013707&__gw_platform=H5';

class TravelTabPage extends StatefulWidget {
  final String travelUrl;
  final TravelTabParams params;
  final String groupChannelCode;

  const TravelTabPage(
      {Key key, this.travelUrl, this.params, this.groupChannelCode})
      : super(key: key);

  @override
  _TravelTabPageState createState() => _TravelTabPageState();
}

class _TravelTabPageState extends State<TravelTabPage>
    with AutomaticKeepAliveClientMixin {
  bool _isLoading = true, noMore = false;
  ScrollController _scrollController;
  int pageIndex = 1;
  List<TravelPageResultList> travelItems;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (!noMore &&
          _scrollController.position.pixels ==
              _scrollController.position.maxScrollExtent) {
        _loadData(loadMore: true);
      }
    });
    _loadData();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return LoadingContainer(
        isLoading: _isLoading,
        child: RefreshIndicator(
            onRefresh: _handleRefresh,
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: StaggeredGridView.countBuilder(
                controller: _scrollController,
                crossAxisCount: 4,
                itemCount: travelItems?.length ?? 0,
                itemBuilder: (BuildContext context, int index) => _TravelItem(
                  index: index,
                  travelItem: travelItems[index],
                ),
                staggeredTileBuilder: (int index) => new StaggeredTile.fit(2),
                mainAxisSpacing: 4.0,
                crossAxisSpacing: 4.0,
              ),
            )));
  }

  void _loadData({loadMore = false}) {
    loadMore ? pageIndex++ : pageIndex = 1;
    TravelPageDao.fetch(widget.travelUrl ?? TRAVEL_URL, widget.params,
            widget.groupChannelCode, pageIndex, PAGE_SIZE)
        .then((value) {
      _isLoading = false;
      noMore = value.resultList == null || value.resultList.length == 0;
      setState(() {
        if (pageIndex == 1) {
          travelItems = value.resultList;
        } else {
          travelItems.addAll(value.resultList);
        }
      });
    }).catchError((e) {
      _isLoading = false;
      noMore = true;
      print(e);
    });
  }

  @override
  // tab保活，防止每次切换tab都重新加载
  bool get wantKeepAlive => true;

  Future<void> _handleRefresh() async {
    _loadData();
  }
}

class _TravelItem extends StatelessWidget {
  final int index;
  final TravelPageResultList travelItem;

  const _TravelItem({Key key, this.index, this.travelItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.white,
        elevation: 5,
        child: PhysicalModel(
          color: Colors.transparent,
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.circular(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _itemImage(),
              Padding(
                padding: EdgeInsets.all(4),
                child: Text(
                  travelItem.article.articleTitle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 14, color: Colors.black87),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(6, 0, 6, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        PhysicalModel(
                          color: Colors.transparent,
                          clipBehavior: Clip.antiAlias,
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            travelItem.article.author?.coverImage?.dynamicUrl,
                            width: 24,
                            height: 24,
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.all(5),
                            width: 90,
                            child: Text(
                              travelItem.article.author?.nickName,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 12),
                            ))
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.thumb_up,
                          size: 14,
                          color: Colors.grey,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 3),
                          child: Text(
                            travelItem.article.likeCount.toString(),
                            style: TextStyle(fontSize: 10),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }

  _itemImage() {
    return Stack(
      children: [
        Image.network(travelItem.article.images[0]?.dynamicUrl),
        Positioned(
            bottom: 8,
            left: 8,
            child: Container(
              padding: EdgeInsets.fromLTRB(5, 1, 5, 1),
              decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 3),
                    child: Icon(
                      Icons.location_on,
                      color: Colors.white,
                      size: 12,
                    ),
                  ),
                  LimitedBox(
                    maxWidth: 130,
                    child: Text(
                      travelItem.article.pois[0]?.poiName ?? '未知',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
            ))
      ],
    );
  }
}
