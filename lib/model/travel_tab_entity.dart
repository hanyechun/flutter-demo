import 'package:demo/generated/json/base/json_convert_content.dart';

class TravelTabEntity with JsonConvert<TravelTabEntity> {
	String url;
	TravelTabParams params;
	List<TravelTabTab> tabs;
}

class TravelTabParams with JsonConvert<TravelTabParams> {
	int districtId;
	String groupChannelCode;
	dynamic type;
	int lat;
	int lon;
	int locatedDistrictId;
	TravelTabParamsPagePara pagePara;
	int imageCutType;
	TravelTabParamsHead head;
	String contentType;
}

class TravelTabParamsPagePara with JsonConvert<TravelTabParamsPagePara> {
	int pageIndex;
	int pageSize;
	int sortType;
	int sortDirection;
}

class TravelTabParamsHead with JsonConvert<TravelTabParamsHead> {
	String cid;
	String ctok;
	String cver;
	String lang;
	String sid;
	String syscode;
	dynamic auth;
	List<TravelTabParamsHeadExtension> extension;
}

class TravelTabParamsHeadExtension with JsonConvert<TravelTabParamsHeadExtension> {
	String name;
	String value;
}

class TravelTabTab with JsonConvert<TravelTabTab> {
	String labelName;
	String groupChannelCode;
}
