import 'package:demo/generated/json/base/json_convert_content.dart';

class SearchEntity with JsonConvert<SearchEntity> {
	String keyword;
	List<SearchData> data;
}

class SearchData with JsonConvert<SearchData> {
	String code;
	String word;
	String type;
	String price;
	String star;
	String zonename;
	String districtname;
	String url;
}
