import 'dart:convert';

import 'package:demo/model/travel_page_entity.dart';
import 'package:demo/model/travel_tab_entity.dart';
import 'package:http/http.dart' as http;

class TravelPageDao {
  static Future<TravelPageEntity> fetch(String url, TravelTabParams params,
      String groupChannelCode, int pageIndex, int pageSize) async {
    TravelTabParamsPagePara pagePara = params.pagePara;
    pagePara.pageIndex = pageIndex;
    pagePara.pageSize = pageSize;
    params.groupChannelCode = groupChannelCode;
    final response = await http.post(url, body: json.encode(params));
    if (response.statusCode == 200) {
      return TravelPageEntity()
          .fromJson(json.decode(Utf8Decoder().convert(response.bodyBytes)));
    }
    return null;
  }
}
