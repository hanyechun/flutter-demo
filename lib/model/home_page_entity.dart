import 'package:demo/generated/json/base/json_convert_content.dart';

class HomePageEntity with JsonConvert<HomePageEntity> {
	HomePageConfig config;
	List<HomePageBannerList> bannerList;
	List<HomePageLocalNavList> localNavList;
	HomePageGridNav gridNav;
	List<HomePageSubNavList> subNavList;
	HomePageSalesBox salesBox;
}

class HomePageConfig with JsonConvert<HomePageConfig> {
	String searchUrl;
}

class HomePageBannerList with JsonConvert<HomePageBannerList> {
	String icon;
	String url;
}

class HomePageLocalNavList with JsonConvert<HomePageLocalNavList> {
	String icon;
	String title;
	String url;
	String statusBarColor;
	bool hideAppBar;
}

class HomePageGridNav with JsonConvert<HomePageGridNav> {
	HomePageGridNavHotel hotel;
	HomePageGridNavFlight flight;
	HomePageGridNavTravel travel;
}

class HomePageGridNavHotel with JsonConvert<HomePageGridNavHotel> {
	String startColor;
	String endColor;
	HomePageGridNavHotelMainItem mainItem;
	HomePageGridNavHotelItem1 item1;
	HomePageGridNavHotelItem2 item2;
	HomePageGridNavHotelItem3 item3;
	HomePageGridNavHotelItem4 item4;
}

class HomePageGridNavHotelMainItem with JsonConvert<HomePageGridNavHotelMainItem> {
	String title;
	String icon;
	String url;
	String statusBarColor;
}

class HomePageGridNavHotelItem1 with JsonConvert<HomePageGridNavHotelItem1> {
	String title;
	String url;
	String statusBarColor;
}

class HomePageGridNavHotelItem2 with JsonConvert<HomePageGridNavHotelItem2> {
	String title;
	String url;
}

class HomePageGridNavHotelItem3 with JsonConvert<HomePageGridNavHotelItem3> {
	String title;
	String url;
	bool hideAppBar;
}

class HomePageGridNavHotelItem4 with JsonConvert<HomePageGridNavHotelItem4> {
	String title;
	String url;
	bool hideAppBar;
}

class HomePageGridNavFlight with JsonConvert<HomePageGridNavFlight> {
	String startColor;
	String endColor;
	HomePageGridNavFlightMainItem mainItem;
	HomePageGridNavFlightItem1 item1;
	HomePageGridNavFlightItem2 item2;
	HomePageGridNavFlightItem3 item3;
	HomePageGridNavFlightItem4 item4;
}

class HomePageGridNavFlightMainItem with JsonConvert<HomePageGridNavFlightMainItem> {
	String title;
	String icon;
	String url;
}

class HomePageGridNavFlightItem1 with JsonConvert<HomePageGridNavFlightItem1> {
	String title;
	String url;
	bool hideAppBar;
}

class HomePageGridNavFlightItem2 with JsonConvert<HomePageGridNavFlightItem2> {
	String title;
	String url;
}

class HomePageGridNavFlightItem3 with JsonConvert<HomePageGridNavFlightItem3> {
	String title;
	String url;
	bool hideAppBar;
}

class HomePageGridNavFlightItem4 with JsonConvert<HomePageGridNavFlightItem4> {
	String title;
	String url;
	bool hideAppBar;
}

class HomePageGridNavTravel with JsonConvert<HomePageGridNavTravel> {
	String startColor;
	String endColor;
	HomePageGridNavTravelMainItem mainItem;
	HomePageGridNavTravelItem1 item1;
	HomePageGridNavTravelItem2 item2;
	HomePageGridNavTravelItem3 item3;
	HomePageGridNavTravelItem4 item4;
}

class HomePageGridNavTravelMainItem with JsonConvert<HomePageGridNavTravelMainItem> {
	String title;
	String icon;
	String url;
	bool hideAppBar;
	String statusBarColor;
}

class HomePageGridNavTravelItem1 with JsonConvert<HomePageGridNavTravelItem1> {
	String title;
	String url;
	String statusBarColor;
	bool hideAppBar;
}

class HomePageGridNavTravelItem2 with JsonConvert<HomePageGridNavTravelItem2> {
	String title;
	String url;
	String statusBarColor;
	bool hideAppBar;
}

class HomePageGridNavTravelItem3 with JsonConvert<HomePageGridNavTravelItem3> {
	String title;
	String url;
	bool hideAppBar;
}

class HomePageGridNavTravelItem4 with JsonConvert<HomePageGridNavTravelItem4> {
	String title;
	String url;
	bool hideAppBar;
}

class HomePageSubNavList with JsonConvert<HomePageSubNavList> {
	String icon;
	String title;
	String url;
	bool hideAppBar;
}

class HomePageSalesBox with JsonConvert<HomePageSalesBox> {
	String icon;
	String moreUrl;
	HomePageSalesBoxBigCard1 bigCard1;
	HomePageSalesBoxBigCard2 bigCard2;
	HomePageSalesBoxSmallCard1 smallCard1;
	HomePageSalesBoxSmallCard2 smallCard2;
	HomePageSalesBoxSmallCard3 smallCard3;
	HomePageSalesBoxSmallCard4 smallCard4;
}

class HomePageSalesBoxBigCard1 with JsonConvert<HomePageSalesBoxBigCard1> {
	String icon;
	String url;
	String title;
}

class HomePageSalesBoxBigCard2 with JsonConvert<HomePageSalesBoxBigCard2> {
	String icon;
	String url;
	String title;
}

class HomePageSalesBoxSmallCard1 with JsonConvert<HomePageSalesBoxSmallCard1> {
	String icon;
	String url;
	String title;
}

class HomePageSalesBoxSmallCard2 with JsonConvert<HomePageSalesBoxSmallCard2> {
	String icon;
	String url;
	String title;
}

class HomePageSalesBoxSmallCard3 with JsonConvert<HomePageSalesBoxSmallCard3> {
	String icon;
	String url;
	String title;
}

class HomePageSalesBoxSmallCard4 with JsonConvert<HomePageSalesBoxSmallCard4> {
	String icon;
	String url;
	String title;
}
