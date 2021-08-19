import 'dart:convert';
import 'dart:developer';

import 'package:weather_mobile_app/core/constants/constants.dart';
import 'package:weather_mobile_app/core/error/exception.dart';
import 'package:weather_mobile_app/features/weather_info/data/models/weather_info_model.dart';
import 'package:http/http.dart' as http;

abstract class WeatherInfoRemoteDataSource {
  Future<WeatherInfoModel> getWeatherInfo(double lat, double long);
}

class WeatherInfoRemoteDataSourceImpl implements WeatherInfoRemoteDataSource {
  @override
  Future<WeatherInfoModel> getWeatherInfo(double lat, double long) async {
    var params = {
      'lat': lat.toString(),
      'lon': long.toString(),
      'exclude': 'alerts',
      'appid': '${Constants.appID}',
      'units': 'metric',
      'lang': 'ru',
    };

    var uri = Uri.https(Constants.openWeatherMapBaseUrl, Constants.openWeatherMapPath, params);
    log("Request: $uri"); 

    var response = await http.get(uri);


    if (response.statusCode == 200) {
      return WeatherInfoModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
