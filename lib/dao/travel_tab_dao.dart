import 'dart:convert';

import 'package:demo/model/travel_tab_entity.dart';
import 'package:http/http.dart' as http;

class TravelTabDao {
  static Future<TravelTabEntity> fetch() async {
    final response = await http
        .get('https://www.devio.org/io/flutter_app/json/travel_page.json');
    if (response.statusCode == 200) {
      return TravelTabEntity()
          .fromJson(json.decode(Utf8Decoder().convert(response.bodyBytes)));
    }
    return null;
  }
}
