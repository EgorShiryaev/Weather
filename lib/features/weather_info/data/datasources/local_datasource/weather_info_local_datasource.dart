import 'dart:convert';


import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_mobile_app/core/error/exception.dart';
import 'package:weather_mobile_app/features/weather_info/data/models/weather_info_model.dart';

abstract class WeatherInfoLocalDataSource {
  Future<WeatherInfoModel> getLastWeatherFromCache();
  Future<void> weatherInfoToCache(WeatherInfoModel weatherInfo);
}

const CACHE_WEATHER_INFO = 'CACHE_WEATHER_INFO';

class WeatherInfoLocalDataSourceImpl implements WeatherInfoLocalDataSource {
  final SharedPreferences sharedPreferences;

  WeatherInfoLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<WeatherInfoModel> getLastWeatherFromCache() {
    final jsonWeatherInfo = sharedPreferences.getString(CACHE_WEATHER_INFO);
    if (jsonWeatherInfo!.isNotEmpty) {
      return Future.value(WeatherInfoModel.fromJson(json.decode(jsonWeatherInfo)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> weatherInfoToCache(WeatherInfoModel weatherInfo) {
    final String jsonWeatherInfo =
        json.encode(weatherInfo.toJson());

    sharedPreferences.setString(CACHE_WEATHER_INFO, jsonWeatherInfo);
    return Future.value(jsonWeatherInfo);
  }
}
