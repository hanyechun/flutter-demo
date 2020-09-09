import 'package:demo/model/travel_page_entity.dart';

travelPageEntityFromJson(TravelPageEntity data, Map<String, dynamic> json) {
	if (json['ResponseStatus'] != null) {
		data.responseStatus = new TravelPageResponseStatus().fromJson(json['ResponseStatus']);
	}
	if (json['totalCount'] != null) {
		data.totalCount = json['totalCount']?.toInt();
	}
	if (json['resultList'] != null) {
		data.resultList = new List<TravelPageResultList>();
		(json['resultList'] as List).forEach((v) {
			data.resultList.add(new TravelPageResultList().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> travelPageEntityToJson(TravelPageEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.responseStatus != null) {
		data['ResponseStatus'] = entity.responseStatus.toJson();
	}
	data['totalCount'] = entity.totalCount;
	if (entity.resultList != null) {
		data['resultList'] =  entity.resultList.map((v) => v.toJson()).toList();
	}
	return data;
}

travelPageResponseStatusFromJson(TravelPageResponseStatus data, Map<String, dynamic> json) {
	if (json['Timestamp'] != null) {
		data.timestamp = json['Timestamp']?.toString();
	}
	if (json['Ack'] != null) {
		data.ack = json['Ack']?.toString();
	}
	if (json['Errors'] != null) {
		data.errors = new List<dynamic>();
		data.errors.addAll(json['Errors']);
	}
	if (json['Extension'] != null) {
		data.extension = new List<TravelPageResponseStatusExtension>();
		(json['Extension'] as List).forEach((v) {
			data.extension.add(new TravelPageResponseStatusExtension().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> travelPageResponseStatusToJson(TravelPageResponseStatus entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['Timestamp'] = entity.timestamp;
	data['Ack'] = entity.ack;
	if (entity.errors != null) {
		data['Errors'] =  [];
	}
	if (entity.extension != null) {
		data['Extension'] =  entity.extension.map((v) => v.toJson()).toList();
	}
	return data;
}

travelPageResponseStatusExtensionFromJson(TravelPageResponseStatusExtension data, Map<String, dynamic> json) {
	if (json['Id'] != null) {
		data.id = json['Id']?.toString();
	}
	if (json['Value'] != null) {
		data.value = json['Value']?.toString();
	}
	return data;
}

Map<String, dynamic> travelPageResponseStatusExtensionToJson(TravelPageResponseStatusExtension entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['Id'] = entity.id;
	data['Value'] = entity.value;
	return data;
}

travelPageResultListFromJson(TravelPageResultList data, Map<String, dynamic> json) {
	if (json['type'] != null) {
		data.type = json['type']?.toInt();
	}
	if (json['article'] != null) {
		data.article = new TravelPageResultListArticle().fromJson(json['article']);
	}
	return data;
}

Map<String, dynamic> travelPageResultListToJson(TravelPageResultList entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['type'] = entity.type;
	if (entity.article != null) {
		data['article'] = entity.article.toJson();
	}
	return data;
}

travelPageResultListArticleFromJson(TravelPageResultListArticle data, Map<String, dynamic> json) {
	if (json['articleId'] != null) {
		data.articleId = json['articleId']?.toInt();
	}
	if (json['productType'] != null) {
		data.productType = json['productType']?.toInt();
	}
	if (json['sourceType'] != null) {
		data.sourceType = json['sourceType']?.toInt();
	}
	if (json['articleTitle'] != null) {
		data.articleTitle = json['articleTitle']?.toString();
	}
	if (json['content'] != null) {
		data.content = json['content']?.toString();
	}
	if (json['author'] != null) {
		data.author = new TravelPageResultListArticleAuthor().fromJson(json['author']);
	}
	if (json['images'] != null) {
		data.images = new List<TravelPageResultListArticleImage>();
		(json['images'] as List).forEach((v) {
			data.images.add(new TravelPageResultListArticleImage().fromJson(v));
		});
	}
	if (json['hasVideo'] != null) {
		data.hasVideo = json['hasVideo'];
	}
	if (json['readCount'] != null) {
		data.readCount = json['readCount']?.toInt();
	}
	if (json['likeCount'] != null) {
		data.likeCount = json['likeCount']?.toInt();
	}
	if (json['commentCount'] != null) {
		data.commentCount = json['commentCount']?.toInt();
	}
	if (json['shareCount'] != null) {
		data.shareCount = json['shareCount']?.toInt();
	}
	if (json['urls'] != null) {
		data.urls = new List<TravelPageResultListArticleUrl>();
		(json['urls'] as List).forEach((v) {
			data.urls.add(new TravelPageResultListArticleUrl().fromJson(v));
		});
	}
	if (json['tags'] != null) {
		data.tags = new List<TravelPageResultListArticleTag>();
		(json['tags'] as List).forEach((v) {
			data.tags.add(new TravelPageResultListArticleTag().fromJson(v));
		});
	}
	if (json['topics'] != null) {
		data.topics = new List<TravelPageResultListArticleTopic>();
		(json['topics'] as List).forEach((v) {
			data.topics.add(new TravelPageResultListArticleTopic().fromJson(v));
		});
	}
	if (json['relatedTopics'] != null) {
		data.relatedTopics = new List<TravelPageResultListArticleRelatedTopic>();
		(json['relatedTopics'] as List).forEach((v) {
			data.relatedTopics.add(new TravelPageResultListArticleRelatedTopic().fromJson(v));
		});
	}
	if (json['pois'] != null) {
		data.pois = new List<TravelPageResultListArticlePoi>();
		(json['pois'] as List).forEach((v) {
			data.pois.add(new TravelPageResultListArticlePoi().fromJson(v));
		});
	}
	if (json['publishTime'] != null) {
		data.publishTime = json['publishTime']?.toString();
	}
	if (json['publishTimeDisplay'] != null) {
		data.publishTimeDisplay = json['publishTimeDisplay']?.toString();
	}
	if (json['shootTime'] != null) {
		data.shootTime = json['shootTime']?.toString();
	}
	if (json['shootTimeDisplay'] != null) {
		data.shootTimeDisplay = json['shootTimeDisplay']?.toString();
	}
	if (json['level'] != null) {
		data.level = json['level']?.toInt();
	}
	if (json['distanceText'] != null) {
		data.distanceText = json['distanceText']?.toString();
	}
	if (json['isLike'] != null) {
		data.isLike = json['isLike'];
	}
	if (json['imageCounts'] != null) {
		data.imageCounts = json['imageCounts']?.toInt();
	}
	if (json['isCollected'] != null) {
		data.isCollected = json['isCollected'];
	}
	if (json['collectCount'] != null) {
		data.collectCount = json['collectCount']?.toInt();
	}
	if (json['articleStatus'] != null) {
		data.articleStatus = json['articleStatus']?.toInt();
	}
	if (json['poiName'] != null) {
		data.poiName = json['poiName']?.toString();
	}
	if (json['shareInfo'] != null) {
		data.shareInfo = new TravelPageResultListArticleShareInfo().fromJson(json['shareInfo']);
	}
	if (json['currentDate'] != null) {
		data.currentDate = json['currentDate']?.toString();
	}
	if (json['sourceId'] != null) {
		data.sourceId = json['sourceId']?.toInt();
	}
	if (json['videoAutoplayNet'] != null) {
		data.videoAutoplayNet = json['videoAutoplayNet']?.toString();
	}
	return data;
}

Map<String, dynamic> travelPageResultListArticleToJson(TravelPageResultListArticle entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['articleId'] = entity.articleId;
	data['productType'] = entity.productType;
	data['sourceType'] = entity.sourceType;
	data['articleTitle'] = entity.articleTitle;
	data['content'] = entity.content;
	if (entity.author != null) {
		data['author'] = entity.author.toJson();
	}
	if (entity.images != null) {
		data['images'] =  entity.images.map((v) => v.toJson()).toList();
	}
	data['hasVideo'] = entity.hasVideo;
	data['readCount'] = entity.readCount;
	data['likeCount'] = entity.likeCount;
	data['commentCount'] = entity.commentCount;
	data['shareCount'] = entity.shareCount;
	if (entity.urls != null) {
		data['urls'] =  entity.urls.map((v) => v.toJson()).toList();
	}
	if (entity.tags != null) {
		data['tags'] =  entity.tags.map((v) => v.toJson()).toList();
	}
	if (entity.topics != null) {
		data['topics'] =  entity.topics.map((v) => v.toJson()).toList();
	}
	if (entity.relatedTopics != null) {
		data['relatedTopics'] =  entity.relatedTopics.map((v) => v.toJson()).toList();
	}
	if (entity.pois != null) {
		data['pois'] =  entity.pois.map((v) => v.toJson()).toList();
	}
	data['publishTime'] = entity.publishTime;
	data['publishTimeDisplay'] = entity.publishTimeDisplay;
	data['shootTime'] = entity.shootTime;
	data['shootTimeDisplay'] = entity.shootTimeDisplay;
	data['level'] = entity.level;
	data['distanceText'] = entity.distanceText;
	data['isLike'] = entity.isLike;
	data['imageCounts'] = entity.imageCounts;
	data['isCollected'] = entity.isCollected;
	data['collectCount'] = entity.collectCount;
	data['articleStatus'] = entity.articleStatus;
	data['poiName'] = entity.poiName;
	if (entity.shareInfo != null) {
		data['shareInfo'] = entity.shareInfo.toJson();
	}
	data['currentDate'] = entity.currentDate;
	data['sourceId'] = entity.sourceId;
	data['videoAutoplayNet'] = entity.videoAutoplayNet;
	return data;
}

travelPageResultListArticleAuthorFromJson(TravelPageResultListArticleAuthor data, Map<String, dynamic> json) {
	if (json['authorId'] != null) {
		data.authorId = json['authorId']?.toInt();
	}
	if (json['nickName'] != null) {
		data.nickName = json['nickName']?.toString();
	}
	if (json['describe'] != null) {
		data.describe = json['describe']?.toString();
	}
	if (json['clientAuth'] != null) {
		data.clientAuth = json['clientAuth']?.toString();
	}
	if (json['userUrl'] != null) {
		data.userUrl = json['userUrl']?.toString();
	}
	if (json['jumpUrl'] != null) {
		data.jumpUrl = json['jumpUrl']?.toString();
	}
	if (json['coverImage'] != null) {
		data.coverImage = new TravelPageResultListArticleAuthorCoverImage().fromJson(json['coverImage']);
	}
	if (json['qualification'] != null) {
		data.qualification = json['qualification']?.toString();
	}
	if (json['identityType'] != null) {
		data.identityType = json['identityType']?.toInt();
	}
	if (json['identityTypeName'] != null) {
		data.identityTypeName = json['identityTypeName']?.toString();
	}
	if (json['tag'] != null) {
		data.tag = json['tag']?.toString();
	}
	if (json['followCount'] != null) {
		data.followCount = json['followCount']?.toInt();
	}
	if (json['vIcon'] != null) {
		data.vIcon = json['vIcon']?.toString();
	}
	if (json['levelValue'] != null) {
		data.levelValue = json['levelValue']?.toInt();
	}
	if (json['levelValueText'] != null) {
		data.levelValueText = json['levelValueText']?.toString();
	}
	if (json['identityDesc'] != null) {
		data.identityDesc = json['identityDesc']?.toString();
	}
	if (json['showTagList'] != null) {
		data.showTagList = new List<TravelPageResultListArticleAuthorShowTagList>();
		(json['showTagList'] as List).forEach((v) {
			data.showTagList.add(new TravelPageResultListArticleAuthorShowTagList().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> travelPageResultListArticleAuthorToJson(TravelPageResultListArticleAuthor entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['authorId'] = entity.authorId;
	data['nickName'] = entity.nickName;
	data['describe'] = entity.describe;
	data['clientAuth'] = entity.clientAuth;
	data['userUrl'] = entity.userUrl;
	data['jumpUrl'] = entity.jumpUrl;
	if (entity.coverImage != null) {
		data['coverImage'] = entity.coverImage.toJson();
	}
	data['qualification'] = entity.qualification;
	data['identityType'] = entity.identityType;
	data['identityTypeName'] = entity.identityTypeName;
	data['tag'] = entity.tag;
	data['followCount'] = entity.followCount;
	data['vIcon'] = entity.vIcon;
	data['levelValue'] = entity.levelValue;
	data['levelValueText'] = entity.levelValueText;
	data['identityDesc'] = entity.identityDesc;
	if (entity.showTagList != null) {
		data['showTagList'] =  entity.showTagList.map((v) => v.toJson()).toList();
	}
	return data;
}

travelPageResultListArticleAuthorCoverImageFromJson(TravelPageResultListArticleAuthorCoverImage data, Map<String, dynamic> json) {
	if (json['dynamicUrl'] != null) {
		data.dynamicUrl = json['dynamicUrl']?.toString();
	}
	if (json['originalUrl'] != null) {
		data.originalUrl = json['originalUrl']?.toString();
	}
	return data;
}

Map<String, dynamic> travelPageResultListArticleAuthorCoverImageToJson(TravelPageResultListArticleAuthorCoverImage entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['dynamicUrl'] = entity.dynamicUrl;
	data['originalUrl'] = entity.originalUrl;
	return data;
}

travelPageResultListArticleAuthorShowTagListFromJson(TravelPageResultListArticleAuthorShowTagList data, Map<String, dynamic> json) {
	if (json['tagStyle'] != null) {
		data.tagStyle = json['tagStyle']?.toInt();
	}
	if (json['tagType'] != null) {
		data.tagType = json['tagType']?.toInt();
	}
	if (json['tagName'] != null) {
		data.tagName = json['tagName']?.toString();
	}
	if (json['tagShortName'] != null) {
		data.tagShortName = json['tagShortName']?.toString();
	}
	return data;
}

Map<String, dynamic> travelPageResultListArticleAuthorShowTagListToJson(TravelPageResultListArticleAuthorShowTagList entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['tagStyle'] = entity.tagStyle;
	data['tagType'] = entity.tagType;
	data['tagName'] = entity.tagName;
	data['tagShortName'] = entity.tagShortName;
	return data;
}

travelPageResultListArticleImageFromJson(TravelPageResultListArticleImage data, Map<String, dynamic> json) {
	if (json['imageId'] != null) {
		data.imageId = json['imageId']?.toInt();
	}
	if (json['dynamicUrl'] != null) {
		data.dynamicUrl = json['dynamicUrl']?.toString();
	}
	if (json['originalUrl'] != null) {
		data.originalUrl = json['originalUrl']?.toString();
	}
	if (json['width'] != null) {
		data.width = json['width']?.toInt();
	}
	if (json['height'] != null) {
		data.height = json['height']?.toInt();
	}
	if (json['mediaType'] != null) {
		data.mediaType = json['mediaType']?.toInt();
	}
	if (json['lat'] != null) {
		data.lat = json['lat']?.toInt();
	}
	if (json['lon'] != null) {
		data.lon = json['lon']?.toInt();
	}
	if (json['isWaterMarked'] != null) {
		data.isWaterMarked = json['isWaterMarked'];
	}
	return data;
}

Map<String, dynamic> travelPageResultListArticleImageToJson(TravelPageResultListArticleImage entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['imageId'] = entity.imageId;
	data['dynamicUrl'] = entity.dynamicUrl;
	data['originalUrl'] = entity.originalUrl;
	data['width'] = entity.width;
	data['height'] = entity.height;
	data['mediaType'] = entity.mediaType;
	data['lat'] = entity.lat;
	data['lon'] = entity.lon;
	data['isWaterMarked'] = entity.isWaterMarked;
	return data;
}

travelPageResultListArticleUrlFromJson(TravelPageResultListArticleUrl data, Map<String, dynamic> json) {
	if (json['version'] != null) {
		data.version = json['version']?.toString();
	}
	if (json['appUrl'] != null) {
		data.appUrl = json['appUrl']?.toString();
	}
	if (json['h5Url'] != null) {
		data.h5Url = json['h5Url']?.toString();
	}
	if (json['wxUrl'] != null) {
		data.wxUrl = json['wxUrl']?.toString();
	}
	return data;
}

Map<String, dynamic> travelPageResultListArticleUrlToJson(TravelPageResultListArticleUrl entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['version'] = entity.version;
	data['appUrl'] = entity.appUrl;
	data['h5Url'] = entity.h5Url;
	data['wxUrl'] = entity.wxUrl;
	return data;
}

travelPageResultListArticleTagFromJson(TravelPageResultListArticleTag data, Map<String, dynamic> json) {
	if (json['tagId'] != null) {
		data.tagId = json['tagId']?.toInt();
	}
	if (json['tagName'] != null) {
		data.tagName = json['tagName']?.toString();
	}
	if (json['tagLevel'] != null) {
		data.tagLevel = json['tagLevel']?.toInt();
	}
	if (json['parentTagId'] != null) {
		data.parentTagId = json['parentTagId']?.toInt();
	}
	if (json['source'] != null) {
		data.source = json['source']?.toInt();
	}
	if (json['sortIndex'] != null) {
		data.sortIndex = json['sortIndex']?.toInt();
	}
	return data;
}

Map<String, dynamic> travelPageResultListArticleTagToJson(TravelPageResultListArticleTag entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['tagId'] = entity.tagId;
	data['tagName'] = entity.tagName;
	data['tagLevel'] = entity.tagLevel;
	data['parentTagId'] = entity.parentTagId;
	data['source'] = entity.source;
	data['sortIndex'] = entity.sortIndex;
	return data;
}

travelPageResultListArticleTopicFromJson(TravelPageResultListArticleTopic data, Map<String, dynamic> json) {
	if (json['topicId'] != null) {
		data.topicId = json['topicId']?.toInt();
	}
	if (json['topicName'] != null) {
		data.topicName = json['topicName']?.toString();
	}
	if (json['level'] != null) {
		data.level = json['level']?.toInt();
	}
	return data;
}

Map<String, dynamic> travelPageResultListArticleTopicToJson(TravelPageResultListArticleTopic entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['topicId'] = entity.topicId;
	data['topicName'] = entity.topicName;
	data['level'] = entity.level;
	return data;
}

travelPageResultListArticleRelatedTopicFromJson(TravelPageResultListArticleRelatedTopic data, Map<String, dynamic> json) {
	if (json['topicId'] != null) {
		data.topicId = json['topicId']?.toInt();
	}
	if (json['topicName'] != null) {
		data.topicName = json['topicName']?.toString();
	}
	if (json['type'] != null) {
		data.type = json['type']?.toInt();
	}
	return data;
}

Map<String, dynamic> travelPageResultListArticleRelatedTopicToJson(TravelPageResultListArticleRelatedTopic entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['topicId'] = entity.topicId;
	data['topicName'] = entity.topicName;
	data['type'] = entity.type;
	return data;
}

travelPageResultListArticlePoiFromJson(TravelPageResultListArticlePoi data, Map<String, dynamic> json) {
	if (json['poiType'] != null) {
		data.poiType = json['poiType']?.toInt();
	}
	if (json['poiId'] != null) {
		data.poiId = json['poiId']?.toInt();
	}
	if (json['poiName'] != null) {
		data.poiName = json['poiName']?.toString();
	}
	if (json['businessId'] != null) {
		data.businessId = json['businessId']?.toInt();
	}
	if (json['districtId'] != null) {
		data.districtId = json['districtId']?.toInt();
	}
	if (json['poiExt'] != null) {
		data.poiExt = new TravelPageResultListArticlePoisPoiExt().fromJson(json['poiExt']);
	}
	if (json['source'] != null) {
		data.source = json['source']?.toInt();
	}
	if (json['isMain'] != null) {
		data.isMain = json['isMain']?.toInt();
	}
	if (json['isInChina'] != null) {
		data.isInChina = json['isInChina'];
	}
	if (json['countryName'] != null) {
		data.countryName = json['countryName']?.toString();
	}
	if (json['districtName'] != null) {
		data.districtName = json['districtName']?.toString();
	}
	if (json['districtENName'] != null) {
		data.districtENName = json['districtENName']?.toString();
	}
	return data;
}

Map<String, dynamic> travelPageResultListArticlePoiToJson(TravelPageResultListArticlePoi entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['poiType'] = entity.poiType;
	data['poiId'] = entity.poiId;
	data['poiName'] = entity.poiName;
	data['businessId'] = entity.businessId;
	data['districtId'] = entity.districtId;
	if (entity.poiExt != null) {
		data['poiExt'] = entity.poiExt.toJson();
	}
	data['source'] = entity.source;
	data['isMain'] = entity.isMain;
	data['isInChina'] = entity.isInChina;
	data['countryName'] = entity.countryName;
	data['districtName'] = entity.districtName;
	data['districtENName'] = entity.districtENName;
	return data;
}

travelPageResultListArticlePoisPoiExtFromJson(TravelPageResultListArticlePoisPoiExt data, Map<String, dynamic> json) {
	if (json['h5Url'] != null) {
		data.h5Url = json['h5Url']?.toString();
	}
	if (json['appUrl'] != null) {
		data.appUrl = json['appUrl']?.toString();
	}
	return data;
}

Map<String, dynamic> travelPageResultListArticlePoisPoiExtToJson(TravelPageResultListArticlePoisPoiExt entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['h5Url'] = entity.h5Url;
	data['appUrl'] = entity.appUrl;
	return data;
}

travelPageResultListArticleShareInfoFromJson(TravelPageResultListArticleShareInfo data, Map<String, dynamic> json) {
	if (json['imageUrl'] != null) {
		data.imageUrl = json['imageUrl']?.toString();
	}
	if (json['shareTitle'] != null) {
		data.shareTitle = json['shareTitle']?.toString();
	}
	if (json['shareContent'] != null) {
		data.shareContent = json['shareContent']?.toString();
	}
	if (json['platForm'] != null) {
		data.platForm = json['platForm']?.toString();
	}
	if (json['token'] != null) {
		data.token = json['token']?.toString();
	}
	return data;
}

Map<String, dynamic> travelPageResultListArticleShareInfoToJson(TravelPageResultListArticleShareInfo entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['imageUrl'] = entity.imageUrl;
	data['shareTitle'] = entity.shareTitle;
	data['shareContent'] = entity.shareContent;
	data['platForm'] = entity.platForm;
	data['token'] = entity.token;
	return data;
}