class AppConfig {
  AppConfig._();
  static const String scheme = "https://";
  static const String host = "digitifyze.com/";
  static const String api = "api/";

  static const String mainUrl = scheme + host + api;

  ///Login
  static const String loginUrl = "${mainUrl}User/UserLogin";
  static const String loginToken = "${scheme + host}token";

  ///Lead
  static const String leadInsert = "${mainUrl}Lead/LeadInsert";
  static const String getStateList = "${mainUrl}state/GetStateList";
  static const String getCityList = "${mainUrl}city/GetCityList";
  static const String getLeadList = "${mainUrl}Lead/GetLeadList";
  static const String getGeneralListById =
      "${mainUrl}Lead/GetMasterList?typeId=";
  static const String leadListByPagination =
      "${mainUrl}Lead/LeadListByPagination";
  static const String leadDetailsById =
      "${mainUrl}Lead/LeadDetailsById?leadId=";

  ///Kyc
  static const String kycInsert = "${mainUrl}Lead/LeadKYCInsertUpdate";
  static const String leadKYCDetailsById =
      "${mainUrl}Lead/LeadKYCDetailsById?leadId=";

  ///Onboarding



  static const int timeOutDuration = 3000000;
}
