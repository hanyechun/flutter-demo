import 'dart:convert';

import 'package:demo/model/search_entity.dart';
import 'package:http/http.dart' as http;

class SearchDao {
  static Future<SearchEntity> fetch(String url, String keyword) async {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      SearchEntity model = SearchEntity()
          .fromJson(json.decode(Utf8Decoder().convert(response.bodyBytes)));
      model.keyword = keyword;
      return model;
    }
    return null;
  }
}
