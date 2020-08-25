import 'dart:convert';

import 'package:demo/model/home_page_entity.dart';
import 'package:http/http.dart' as http;

class HomeDao {
  static Future<HomePageEntity> fetch() async {
    final response = await http
        .get('https://www.devio.org/io/flutter_app/json/home_page.json');
    if (response.statusCode == 200) {
      return HomePageEntity()
          .fromJson(json.decode(Utf8Decoder().convert(response.bodyBytes)));
    }
    return null;
  }
}
