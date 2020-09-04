import 'package:demo/model/search_entity.dart';

searchEntityFromJson(SearchEntity data, Map<String, dynamic> json) {
	if (json['data'] != null) {
		data.data = new List<SearchData>();
		(json['data'] as List).forEach((v) {
			data.data.add(new SearchData().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> searchEntityToJson(SearchEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.data != null) {
		data['data'] =  entity.data.map((v) => v.toJson()).toList();
	}
	return data;
}

searchDataFromJson(SearchData data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code']?.toString();
	}
	if (json['word'] != null) {
		data.word = json['word']?.toString();
	}
	if (json['type'] != null) {
		data.type = json['type']?.toString();
	}
	if (json['price'] != null) {
		data.price = json['price']?.toString();
	}
	if (json['star'] != null) {
		data.star = json['star']?.toString();
	}
	if (json['zonename'] != null) {
		data.zonename = json['zonename']?.toString();
	}
	if (json['districtname'] != null) {
		data.districtname = json['districtname']?.toString();
	}
	if (json['url'] != null) {
		data.url = json['url']?.toString();
	}
	return data;
}

Map<String, dynamic> searchDataToJson(SearchData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['word'] = entity.word;
	data['type'] = entity.type;
	data['price'] = entity.price;
	data['star'] = entity.star;
	data['zonename'] = entity.zonename;
	data['districtname'] = entity.districtname;
	data['url'] = entity.url;
	return data;
}