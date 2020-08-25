import 'package:demo/model/home_page_entity.dart';

homePageEntityFromJson(HomePageEntity data, Map<String, dynamic> json) {
	if (json['config'] != null) {
		data.config = new HomePageConfig().fromJson(json['config']);
	}
	if (json['bannerList'] != null) {
		data.bannerList = new List<HomePageBannerList>();
		(json['bannerList'] as List).forEach((v) {
			data.bannerList.add(new HomePageBannerList().fromJson(v));
		});
	}
	if (json['localNavList'] != null) {
		data.localNavList = new List<HomePageLocalNavList>();
		(json['localNavList'] as List).forEach((v) {
			data.localNavList.add(new HomePageLocalNavList().fromJson(v));
		});
	}
	if (json['gridNav'] != null) {
		data.gridNav = new HomePageGridNav().fromJson(json['gridNav']);
	}
	if (json['subNavList'] != null) {
		data.subNavList = new List<HomePageSubNavList>();
		(json['subNavList'] as List).forEach((v) {
			data.subNavList.add(new HomePageSubNavList().fromJson(v));
		});
	}
	if (json['salesBox'] != null) {
		data.salesBox = new HomePageSalesBox().fromJson(json['salesBox']);
	}
	return data;
}

Map<String, dynamic> homePageEntityToJson(HomePageEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.config != null) {
		data['config'] = entity.config.toJson();
	}
	if (entity.bannerList != null) {
		data['bannerList'] =  entity.bannerList.map((v) => v.toJson()).toList();
	}
	if (entity.localNavList != null) {
		data['localNavList'] =  entity.localNavList.map((v) => v.toJson()).toList();
	}
	if (entity.gridNav != null) {
		data['gridNav'] = entity.gridNav.toJson();
	}
	if (entity.subNavList != null) {
		data['subNavList'] =  entity.subNavList.map((v) => v.toJson()).toList();
	}
	if (entity.salesBox != null) {
		data['salesBox'] = entity.salesBox.toJson();
	}
	return data;
}

homePageConfigFromJson(HomePageConfig data, Map<String, dynamic> json) {
	if (json['searchUrl'] != null) {
		data.searchUrl = json['searchUrl']?.toString();
	}
	return data;
}

Map<String, dynamic> homePageConfigToJson(HomePageConfig entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['searchUrl'] = entity.searchUrl;
	return data;
}

homePageBannerListFromJson(HomePageBannerList data, Map<String, dynamic> json) {
	if (json['icon'] != null) {
		data.icon = json['icon']?.toString();
	}
	if (json['url'] != null) {
		data.url = json['url']?.toString();
	}
	return data;
}

Map<String, dynamic> homePageBannerListToJson(HomePageBannerList entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['icon'] = entity.icon;
	data['url'] = entity.url;
	return data;
}

homePageLocalNavListFromJson(HomePageLocalNavList data, Map<String, dynamic> json) {
	if (json['icon'] != null) {
		data.icon = json['icon']?.toString();
	}
	if (json['title'] != null) {
		data.title = json['title']?.toString();
	}
	if (json['url'] != null) {
		data.url = json['url']?.toString();
	}
	if (json['statusBarColor'] != null) {
		data.statusBarColor = json['statusBarColor']?.toString();
	}
	if (json['hideAppBar'] != null) {
		data.hideAppBar = json['hideAppBar'];
	}
	return data;
}

Map<String, dynamic> homePageLocalNavListToJson(HomePageLocalNavList entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['icon'] = entity.icon;
	data['title'] = entity.title;
	data['url'] = entity.url;
	data['statusBarColor'] = entity.statusBarColor;
	data['hideAppBar'] = entity.hideAppBar;
	return data;
}

homePageGridNavFromJson(HomePageGridNav data, Map<String, dynamic> json) {
	if (json['hotel'] != null) {
		data.hotel = new HomePageGridNavHotel().fromJson(json['hotel']);
	}
	if (json['flight'] != null) {
		data.flight = new HomePageGridNavFlight().fromJson(json['flight']);
	}
	if (json['travel'] != null) {
		data.travel = new HomePageGridNavTravel().fromJson(json['travel']);
	}
	return data;
}

Map<String, dynamic> homePageGridNavToJson(HomePageGridNav entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.hotel != null) {
		data['hotel'] = entity.hotel.toJson();
	}
	if (entity.flight != null) {
		data['flight'] = entity.flight.toJson();
	}
	if (entity.travel != null) {
		data['travel'] = entity.travel.toJson();
	}
	return data;
}

homePageGridNavHotelFromJson(HomePageGridNavHotel data, Map<String, dynamic> json) {
	if (json['startColor'] != null) {
		data.startColor = json['startColor']?.toString();
	}
	if (json['endColor'] != null) {
		data.endColor = json['endColor']?.toString();
	}
	if (json['mainItem'] != null) {
		data.mainItem = new HomePageGridNavHotelMainItem().fromJson(json['mainItem']);
	}
	if (json['item1'] != null) {
		data.item1 = new HomePageGridNavHotelItem1().fromJson(json['item1']);
	}
	if (json['item2'] != null) {
		data.item2 = new HomePageGridNavHotelItem2().fromJson(json['item2']);
	}
	if (json['item3'] != null) {
		data.item3 = new HomePageGridNavHotelItem3().fromJson(json['item3']);
	}
	if (json['item4'] != null) {
		data.item4 = new HomePageGridNavHotelItem4().fromJson(json['item4']);
	}
	return data;
}

Map<String, dynamic> homePageGridNavHotelToJson(HomePageGridNavHotel entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['startColor'] = entity.startColor;
	data['endColor'] = entity.endColor;
	if (entity.mainItem != null) {
		data['mainItem'] = entity.mainItem.toJson();
	}
	if (entity.item1 != null) {
		data['item1'] = entity.item1.toJson();
	}
	if (entity.item2 != null) {
		data['item2'] = entity.item2.toJson();
	}
	if (entity.item3 != null) {
		data['item3'] = entity.item3.toJson();
	}
	if (entity.item4 != null) {
		data['item4'] = entity.item4.toJson();
	}
	return data;
}

homePageGridNavHotelMainItemFromJson(HomePageGridNavHotelMainItem data, Map<String, dynamic> json) {
	if (json['title'] != null) {
		data.title = json['title']?.toString();
	}
	if (json['icon'] != null) {
		data.icon = json['icon']?.toString();
	}
	if (json['url'] != null) {
		data.url = json['url']?.toString();
	}
	if (json['statusBarColor'] != null) {
		data.statusBarColor = json['statusBarColor']?.toString();
	}
	return data;
}

Map<String, dynamic> homePageGridNavHotelMainItemToJson(HomePageGridNavHotelMainItem entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['title'] = entity.title;
	data['icon'] = entity.icon;
	data['url'] = entity.url;
	data['statusBarColor'] = entity.statusBarColor;
	return data;
}

homePageGridNavHotelItem1FromJson(HomePageGridNavHotelItem1 data, Map<String, dynamic> json) {
	if (json['title'] != null) {
		data.title = json['title']?.toString();
	}
	if (json['url'] != null) {
		data.url = json['url']?.toString();
	}
	if (json['statusBarColor'] != null) {
		data.statusBarColor = json['statusBarColor']?.toString();
	}
	return data;
}

Map<String, dynamic> homePageGridNavHotelItem1ToJson(HomePageGridNavHotelItem1 entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['title'] = entity.title;
	data['url'] = entity.url;
	data['statusBarColor'] = entity.statusBarColor;
	return data;
}

homePageGridNavHotelItem2FromJson(HomePageGridNavHotelItem2 data, Map<String, dynamic> json) {
	if (json['title'] != null) {
		data.title = json['title']?.toString();
	}
	if (json['url'] != null) {
		data.url = json['url']?.toString();
	}
	return data;
}

Map<String, dynamic> homePageGridNavHotelItem2ToJson(HomePageGridNavHotelItem2 entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['title'] = entity.title;
	data['url'] = entity.url;
	return data;
}

homePageGridNavHotelItem3FromJson(HomePageGridNavHotelItem3 data, Map<String, dynamic> json) {
	if (json['title'] != null) {
		data.title = json['title']?.toString();
	}
	if (json['url'] != null) {
		data.url = json['url']?.toString();
	}
	if (json['hideAppBar'] != null) {
		data.hideAppBar = json['hideAppBar'];
	}
	return data;
}

Map<String, dynamic> homePageGridNavHotelItem3ToJson(HomePageGridNavHotelItem3 entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['title'] = entity.title;
	data['url'] = entity.url;
	data['hideAppBar'] = entity.hideAppBar;
	return data;
}

homePageGridNavHotelItem4FromJson(HomePageGridNavHotelItem4 data, Map<String, dynamic> json) {
	if (json['title'] != null) {
		data.title = json['title']?.toString();
	}
	if (json['url'] != null) {
		data.url = json['url']?.toString();
	}
	if (json['hideAppBar'] != null) {
		data.hideAppBar = json['hideAppBar'];
	}
	return data;
}

Map<String, dynamic> homePageGridNavHotelItem4ToJson(HomePageGridNavHotelItem4 entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['title'] = entity.title;
	data['url'] = entity.url;
	data['hideAppBar'] = entity.hideAppBar;
	return data;
}

homePageGridNavFlightFromJson(HomePageGridNavFlight data, Map<String, dynamic> json) {
	if (json['startColor'] != null) {
		data.startColor = json['startColor']?.toString();
	}
	if (json['endColor'] != null) {
		data.endColor = json['endColor']?.toString();
	}
	if (json['mainItem'] != null) {
		data.mainItem = new HomePageGridNavFlightMainItem().fromJson(json['mainItem']);
	}
	if (json['item1'] != null) {
		data.item1 = new HomePageGridNavFlightItem1().fromJson(json['item1']);
	}
	if (json['item2'] != null) {
		data.item2 = new HomePageGridNavFlightItem2().fromJson(json['item2']);
	}
	if (json['item3'] != null) {
		data.item3 = new HomePageGridNavFlightItem3().fromJson(json['item3']);
	}
	if (json['item4'] != null) {
		data.item4 = new HomePageGridNavFlightItem4().fromJson(json['item4']);
	}
	return data;
}

Map<String, dynamic> homePageGridNavFlightToJson(HomePageGridNavFlight entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['startColor'] = entity.startColor;
	data['endColor'] = entity.endColor;
	if (entity.mainItem != null) {
		data['mainItem'] = entity.mainItem.toJson();
	}
	if (entity.item1 != null) {
		data['item1'] = entity.item1.toJson();
	}
	if (entity.item2 != null) {
		data['item2'] = entity.item2.toJson();
	}
	if (entity.item3 != null) {
		data['item3'] = entity.item3.toJson();
	}
	if (entity.item4 != null) {
		data['item4'] = entity.item4.toJson();
	}
	return data;
}

homePageGridNavFlightMainItemFromJson(HomePageGridNavFlightMainItem data, Map<String, dynamic> json) {
	if (json['title'] != null) {
		data.title = json['title']?.toString();
	}
	if (json['icon'] != null) {
		data.icon = json['icon']?.toString();
	}
	if (json['url'] != null) {
		data.url = json['url']?.toString();
	}
	return data;
}

Map<String, dynamic> homePageGridNavFlightMainItemToJson(HomePageGridNavFlightMainItem entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['title'] = entity.title;
	data['icon'] = entity.icon;
	data['url'] = entity.url;
	return data;
}

homePageGridNavFlightItem1FromJson(HomePageGridNavFlightItem1 data, Map<String, dynamic> json) {
	if (json['title'] != null) {
		data.title = json['title']?.toString();
	}
	if (json['url'] != null) {
		data.url = json['url']?.toString();
	}
	if (json['hideAppBar'] != null) {
		data.hideAppBar = json['hideAppBar'];
	}
	return data;
}

Map<String, dynamic> homePageGridNavFlightItem1ToJson(HomePageGridNavFlightItem1 entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['title'] = entity.title;
	data['url'] = entity.url;
	data['hideAppBar'] = entity.hideAppBar;
	return data;
}

homePageGridNavFlightItem2FromJson(HomePageGridNavFlightItem2 data, Map<String, dynamic> json) {
	if (json['title'] != null) {
		data.title = json['title']?.toString();
	}
	if (json['url'] != null) {
		data.url = json['url']?.toString();
	}
	return data;
}

Map<String, dynamic> homePageGridNavFlightItem2ToJson(HomePageGridNavFlightItem2 entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['title'] = entity.title;
	data['url'] = entity.url;
	return data;
}

homePageGridNavFlightItem3FromJson(HomePageGridNavFlightItem3 data, Map<String, dynamic> json) {
	if (json['title'] != null) {
		data.title = json['title']?.toString();
	}
	if (json['url'] != null) {
		data.url = json['url']?.toString();
	}
	if (json['hideAppBar'] != null) {
		data.hideAppBar = json['hideAppBar'];
	}
	return data;
}

Map<String, dynamic> homePageGridNavFlightItem3ToJson(HomePageGridNavFlightItem3 entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['title'] = entity.title;
	data['url'] = entity.url;
	data['hideAppBar'] = entity.hideAppBar;
	return data;
}

homePageGridNavFlightItem4FromJson(HomePageGridNavFlightItem4 data, Map<String, dynamic> json) {
	if (json['title'] != null) {
		data.title = json['title']?.toString();
	}
	if (json['url'] != null) {
		data.url = json['url']?.toString();
	}
	if (json['hideAppBar'] != null) {
		data.hideAppBar = json['hideAppBar'];
	}
	return data;
}

Map<String, dynamic> homePageGridNavFlightItem4ToJson(HomePageGridNavFlightItem4 entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['title'] = entity.title;
	data['url'] = entity.url;
	data['hideAppBar'] = entity.hideAppBar;
	return data;
}

homePageGridNavTravelFromJson(HomePageGridNavTravel data, Map<String, dynamic> json) {
	if (json['startColor'] != null) {
		data.startColor = json['startColor']?.toString();
	}
	if (json['endColor'] != null) {
		data.endColor = json['endColor']?.toString();
	}
	if (json['mainItem'] != null) {
		data.mainItem = new HomePageGridNavTravelMainItem().fromJson(json['mainItem']);
	}
	if (json['item1'] != null) {
		data.item1 = new HomePageGridNavTravelItem1().fromJson(json['item1']);
	}
	if (json['item2'] != null) {
		data.item2 = new HomePageGridNavTravelItem2().fromJson(json['item2']);
	}
	if (json['item3'] != null) {
		data.item3 = new HomePageGridNavTravelItem3().fromJson(json['item3']);
	}
	if (json['item4'] != null) {
		data.item4 = new HomePageGridNavTravelItem4().fromJson(json['item4']);
	}
	return data;
}

Map<String, dynamic> homePageGridNavTravelToJson(HomePageGridNavTravel entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['startColor'] = entity.startColor;
	data['endColor'] = entity.endColor;
	if (entity.mainItem != null) {
		data['mainItem'] = entity.mainItem.toJson();
	}
	if (entity.item1 != null) {
		data['item1'] = entity.item1.toJson();
	}
	if (entity.item2 != null) {
		data['item2'] = entity.item2.toJson();
	}
	if (entity.item3 != null) {
		data['item3'] = entity.item3.toJson();
	}
	if (entity.item4 != null) {
		data['item4'] = entity.item4.toJson();
	}
	return data;
}

homePageGridNavTravelMainItemFromJson(HomePageGridNavTravelMainItem data, Map<String, dynamic> json) {
	if (json['title'] != null) {
		data.title = json['title']?.toString();
	}
	if (json['icon'] != null) {
		data.icon = json['icon']?.toString();
	}
	if (json['url'] != null) {
		data.url = json['url']?.toString();
	}
	if (json['hideAppBar'] != null) {
		data.hideAppBar = json['hideAppBar'];
	}
	if (json['statusBarColor'] != null) {
		data.statusBarColor = json['statusBarColor']?.toString();
	}
	return data;
}

Map<String, dynamic> homePageGridNavTravelMainItemToJson(HomePageGridNavTravelMainItem entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['title'] = entity.title;
	data['icon'] = entity.icon;
	data['url'] = entity.url;
	data['hideAppBar'] = entity.hideAppBar;
	data['statusBarColor'] = entity.statusBarColor;
	return data;
}

homePageGridNavTravelItem1FromJson(HomePageGridNavTravelItem1 data, Map<String, dynamic> json) {
	if (json['title'] != null) {
		data.title = json['title']?.toString();
	}
	if (json['url'] != null) {
		data.url = json['url']?.toString();
	}
	if (json['statusBarColor'] != null) {
		data.statusBarColor = json['statusBarColor']?.toString();
	}
	if (json['hideAppBar'] != null) {
		data.hideAppBar = json['hideAppBar'];
	}
	return data;
}

Map<String, dynamic> homePageGridNavTravelItem1ToJson(HomePageGridNavTravelItem1 entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['title'] = entity.title;
	data['url'] = entity.url;
	data['statusBarColor'] = entity.statusBarColor;
	data['hideAppBar'] = entity.hideAppBar;
	return data;
}

homePageGridNavTravelItem2FromJson(HomePageGridNavTravelItem2 data, Map<String, dynamic> json) {
	if (json['title'] != null) {
		data.title = json['title']?.toString();
	}
	if (json['url'] != null) {
		data.url = json['url']?.toString();
	}
	if (json['statusBarColor'] != null) {
		data.statusBarColor = json['statusBarColor']?.toString();
	}
	if (json['hideAppBar'] != null) {
		data.hideAppBar = json['hideAppBar'];
	}
	return data;
}

Map<String, dynamic> homePageGridNavTravelItem2ToJson(HomePageGridNavTravelItem2 entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['title'] = entity.title;
	data['url'] = entity.url;
	data['statusBarColor'] = entity.statusBarColor;
	data['hideAppBar'] = entity.hideAppBar;
	return data;
}

homePageGridNavTravelItem3FromJson(HomePageGridNavTravelItem3 data, Map<String, dynamic> json) {
	if (json['title'] != null) {
		data.title = json['title']?.toString();
	}
	if (json['url'] != null) {
		data.url = json['url']?.toString();
	}
	if (json['hideAppBar'] != null) {
		data.hideAppBar = json['hideAppBar'];
	}
	return data;
}

Map<String, dynamic> homePageGridNavTravelItem3ToJson(HomePageGridNavTravelItem3 entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['title'] = entity.title;
	data['url'] = entity.url;
	data['hideAppBar'] = entity.hideAppBar;
	return data;
}

homePageGridNavTravelItem4FromJson(HomePageGridNavTravelItem4 data, Map<String, dynamic> json) {
	if (json['title'] != null) {
		data.title = json['title']?.toString();
	}
	if (json['url'] != null) {
		data.url = json['url']?.toString();
	}
	if (json['hideAppBar'] != null) {
		data.hideAppBar = json['hideAppBar'];
	}
	return data;
}

Map<String, dynamic> homePageGridNavTravelItem4ToJson(HomePageGridNavTravelItem4 entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['title'] = entity.title;
	data['url'] = entity.url;
	data['hideAppBar'] = entity.hideAppBar;
	return data;
}

homePageSubNavListFromJson(HomePageSubNavList data, Map<String, dynamic> json) {
	if (json['icon'] != null) {
		data.icon = json['icon']?.toString();
	}
	if (json['title'] != null) {
		data.title = json['title']?.toString();
	}
	if (json['url'] != null) {
		data.url = json['url']?.toString();
	}
	if (json['hideAppBar'] != null) {
		data.hideAppBar = json['hideAppBar'];
	}
	return data;
}

Map<String, dynamic> homePageSubNavListToJson(HomePageSubNavList entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['icon'] = entity.icon;
	data['title'] = entity.title;
	data['url'] = entity.url;
	data['hideAppBar'] = entity.hideAppBar;
	return data;
}

homePageSalesBoxFromJson(HomePageSalesBox data, Map<String, dynamic> json) {
	if (json['icon'] != null) {
		data.icon = json['icon']?.toString();
	}
	if (json['moreUrl'] != null) {
		data.moreUrl = json['moreUrl']?.toString();
	}
	if (json['bigCard1'] != null) {
		data.bigCard1 = new HomePageSalesBoxBigCard1().fromJson(json['bigCard1']);
	}
	if (json['bigCard2'] != null) {
		data.bigCard2 = new HomePageSalesBoxBigCard2().fromJson(json['bigCard2']);
	}
	if (json['smallCard1'] != null) {
		data.smallCard1 = new HomePageSalesBoxSmallCard1().fromJson(json['smallCard1']);
	}
	if (json['smallCard2'] != null) {
		data.smallCard2 = new HomePageSalesBoxSmallCard2().fromJson(json['smallCard2']);
	}
	if (json['smallCard3'] != null) {
		data.smallCard3 = new HomePageSalesBoxSmallCard3().fromJson(json['smallCard3']);
	}
	if (json['smallCard4'] != null) {
		data.smallCard4 = new HomePageSalesBoxSmallCard4().fromJson(json['smallCard4']);
	}
	return data;
}

Map<String, dynamic> homePageSalesBoxToJson(HomePageSalesBox entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['icon'] = entity.icon;
	data['moreUrl'] = entity.moreUrl;
	if (entity.bigCard1 != null) {
		data['bigCard1'] = entity.bigCard1.toJson();
	}
	if (entity.bigCard2 != null) {
		data['bigCard2'] = entity.bigCard2.toJson();
	}
	if (entity.smallCard1 != null) {
		data['smallCard1'] = entity.smallCard1.toJson();
	}
	if (entity.smallCard2 != null) {
		data['smallCard2'] = entity.smallCard2.toJson();
	}
	if (entity.smallCard3 != null) {
		data['smallCard3'] = entity.smallCard3.toJson();
	}
	if (entity.smallCard4 != null) {
		data['smallCard4'] = entity.smallCard4.toJson();
	}
	return data;
}

homePageSalesBoxBigCard1FromJson(HomePageSalesBoxBigCard1 data, Map<String, dynamic> json) {
	if (json['icon'] != null) {
		data.icon = json['icon']?.toString();
	}
	if (json['url'] != null) {
		data.url = json['url']?.toString();
	}
	if (json['title'] != null) {
		data.title = json['title']?.toString();
	}
	return data;
}

Map<String, dynamic> homePageSalesBoxBigCard1ToJson(HomePageSalesBoxBigCard1 entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['icon'] = entity.icon;
	data['url'] = entity.url;
	data['title'] = entity.title;
	return data;
}

homePageSalesBoxBigCard2FromJson(HomePageSalesBoxBigCard2 data, Map<String, dynamic> json) {
	if (json['icon'] != null) {
		data.icon = json['icon']?.toString();
	}
	if (json['url'] != null) {
		data.url = json['url']?.toString();
	}
	if (json['title'] != null) {
		data.title = json['title']?.toString();
	}
	return data;
}

Map<String, dynamic> homePageSalesBoxBigCard2ToJson(HomePageSalesBoxBigCard2 entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['icon'] = entity.icon;
	data['url'] = entity.url;
	data['title'] = entity.title;
	return data;
}

homePageSalesBoxSmallCard1FromJson(HomePageSalesBoxSmallCard1 data, Map<String, dynamic> json) {
	if (json['icon'] != null) {
		data.icon = json['icon']?.toString();
	}
	if (json['url'] != null) {
		data.url = json['url']?.toString();
	}
	if (json['title'] != null) {
		data.title = json['title']?.toString();
	}
	return data;
}

Map<String, dynamic> homePageSalesBoxSmallCard1ToJson(HomePageSalesBoxSmallCard1 entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['icon'] = entity.icon;
	data['url'] = entity.url;
	data['title'] = entity.title;
	return data;
}

homePageSalesBoxSmallCard2FromJson(HomePageSalesBoxSmallCard2 data, Map<String, dynamic> json) {
	if (json['icon'] != null) {
		data.icon = json['icon']?.toString();
	}
	if (json['url'] != null) {
		data.url = json['url']?.toString();
	}
	if (json['title'] != null) {
		data.title = json['title']?.toString();
	}
	return data;
}

Map<String, dynamic> homePageSalesBoxSmallCard2ToJson(HomePageSalesBoxSmallCard2 entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['icon'] = entity.icon;
	data['url'] = entity.url;
	data['title'] = entity.title;
	return data;
}

homePageSalesBoxSmallCard3FromJson(HomePageSalesBoxSmallCard3 data, Map<String, dynamic> json) {
	if (json['icon'] != null) {
		data.icon = json['icon']?.toString();
	}
	if (json['url'] != null) {
		data.url = json['url']?.toString();
	}
	if (json['title'] != null) {
		data.title = json['title']?.toString();
	}
	return data;
}

Map<String, dynamic> homePageSalesBoxSmallCard3ToJson(HomePageSalesBoxSmallCard3 entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['icon'] = entity.icon;
	data['url'] = entity.url;
	data['title'] = entity.title;
	return data;
}

homePageSalesBoxSmallCard4FromJson(HomePageSalesBoxSmallCard4 data, Map<String, dynamic> json) {
	if (json['icon'] != null) {
		data.icon = json['icon']?.toString();
	}
	if (json['url'] != null) {
		data.url = json['url']?.toString();
	}
	if (json['title'] != null) {
		data.title = json['title']?.toString();
	}
	return data;
}

Map<String, dynamic> homePageSalesBoxSmallCard4ToJson(HomePageSalesBoxSmallCard4 entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['icon'] = entity.icon;
	data['url'] = entity.url;
	data['title'] = entity.title;
	return data;
}