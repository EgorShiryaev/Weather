class Constants {
  static const String protokolOpenWeatherMap = "https://";
  static const String openWeatherMapBaseUrl = "api.openweathermap.org";
  static const String openWeatherMapPath = "/data/2.5/onecall";
  static const String openWeatherMapIcon =
      protokolOpenWeatherMap + openWeatherMapBaseUrl + "/img/w/";

  // Зарегистрируйтесь на openweathermap.org и получите appId
  static const String appID = "";

  // Зарегистрируйте googleApiKey на googlePlace
  static const String googleApiKey = "";

  static const String geocodeSputnikBaseUrl =
      'http://search.maps.sputnik.ru/search/addr?q=';

  static late String placeName = '';

  static late double lat = 0;
  static late double long = 0;

  static late bool useGeolocator = false;

  static late int timezoneOffset;
}
