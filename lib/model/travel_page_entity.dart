import 'package:demo/generated/json/base/json_convert_content.dart';
import 'package:demo/generated/json/base/json_filed.dart';

class TravelPageEntity with JsonConvert<TravelPageEntity> {
	@JSONField(name: "ResponseStatus")
	TravelPageResponseStatus responseStatus;
	int totalCount;
	List<TravelPageResultList> resultList;
}

class TravelPageResponseStatus with JsonConvert<TravelPageResponseStatus> {
	@JSONField(name: "Timestamp")
	String timestamp;
	@JSONField(name: "Ack")
	String ack;
	@JSONField(name: "Errors")
	List<dynamic> errors;
	@JSONField(name: "Extension")
	List<TravelPageResponseStatusExtension> extension;
}

class TravelPageResponseStatusExtension with JsonConvert<TravelPageResponseStatusExtension> {
	@JSONField(name: "Id")
	String id;
	@JSONField(name: "Value")
	String value;
}

class TravelPageResultList with JsonConvert<TravelPageResultList> {
	int type;
	TravelPageResultListArticle article;
}

class TravelPageResultListArticle with JsonConvert<TravelPageResultListArticle> {
	int articleId;
	int productType;
	int sourceType;
	String articleTitle;
	String content;
	TravelPageResultListArticleAuthor author;
	List<TravelPageResultListArticleImage> images;
	bool hasVideo;
	int readCount;
	int likeCount;
	int commentCount;
	int shareCount;
	List<TravelPageResultListArticleUrl> urls;
	List<TravelPageResultListArticleTag> tags;
	List<TravelPageResultListArticleTopic> topics;
	List<TravelPageResultListArticleRelatedTopic> relatedTopics;
	List<TravelPageResultListArticlePoi> pois;
	String publishTime;
	String publishTimeDisplay;
	String shootTime;
	String shootTimeDisplay;
	int level;
	String distanceText;
	bool isLike;
	int imageCounts;
	bool isCollected;
	int collectCount;
	int articleStatus;
	String poiName;
	TravelPageResultListArticleShareInfo shareInfo;
	String currentDate;
	int sourceId;
	String videoAutoplayNet;
}

class TravelPageResultListArticleAuthor with JsonConvert<TravelPageResultListArticleAuthor> {
	int authorId;
	String nickName;
	String describe;
	String clientAuth;
	String userUrl;
	String jumpUrl;
	TravelPageResultListArticleAuthorCoverImage coverImage;
	String qualification;
	int identityType;
	String identityTypeName;
	String tag;
	int followCount;
	String vIcon;
	int levelValue;
	String levelValueText;
	String identityDesc;
	List<TravelPageResultListArticleAuthorShowTagList> showTagList;
}

class TravelPageResultListArticleAuthorCoverImage with JsonConvert<TravelPageResultListArticleAuthorCoverImage> {
	String dynamicUrl;
	String originalUrl;
}

class TravelPageResultListArticleAuthorShowTagList with JsonConvert<TravelPageResultListArticleAuthorShowTagList> {
	int tagStyle;
	int tagType;
	String tagName;
	String tagShortName;
}

class TravelPageResultListArticleImage with JsonConvert<TravelPageResultListArticleImage> {
	int imageId;
	String dynamicUrl;
	String originalUrl;
	int width;
	int height;
	int mediaType;
	int lat;
	int lon;
	bool isWaterMarked;
}

class TravelPageResultListArticleUrl with JsonConvert<TravelPageResultListArticleUrl> {
	String version;
	String appUrl;
	String h5Url;
	String wxUrl;
}

class TravelPageResultListArticleTag with JsonConvert<TravelPageResultListArticleTag> {
	int tagId;
	String tagName;
	int tagLevel;
	int parentTagId;
	int source;
	int sortIndex;
}

class TravelPageResultListArticleTopic with JsonConvert<TravelPageResultListArticleTopic> {
	int topicId;
	String topicName;
	int level;
}

class TravelPageResultListArticleRelatedTopic with JsonConvert<TravelPageResultListArticleRelatedTopic> {
	int topicId;
	String topicName;
	int type;
}

class TravelPageResultListArticlePoi with JsonConvert<TravelPageResultListArticlePoi> {
	int poiType;
	int poiId;
	String poiName;
	int businessId;
	int districtId;
	TravelPageResultListArticlePoisPoiExt poiExt;
	int source;
	int isMain;
	bool isInChina;
	String countryName;
	String districtName;
	String districtENName;
}

class TravelPageResultListArticlePoisPoiExt with JsonConvert<TravelPageResultListArticlePoisPoiExt> {
	String h5Url;
	String appUrl;
}

class TravelPageResultListArticleShareInfo with JsonConvert<TravelPageResultListArticleShareInfo> {
	String imageUrl;
	String shareTitle;
	String shareContent;
	String platForm;
	String token;
}
