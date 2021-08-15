import 'package:weather_mobile_app/features/weather_info/domain/entities/weather_info_entity.dart';

import 'current_model.dart';
import 'daily_model.dart';
import 'hourly_model.dart';
import 'minutely_model.dart';

class WeatherInfoModel extends WeatherInfoEntity {
  WeatherInfoModel(
      {required lat,
      required lon,
      required timezone,
      required timezoneOffset,
      required current,
      required minutely,
      required hourly,
      required daily})
      : super(
          lat: lat,
          lon: lon,
          timezone: timezone,
          timezoneOffset: timezoneOffset,
          current: current,
          minutely: minutely,
          hourly: hourly,
          daily: daily,
        );

  factory WeatherInfoModel.fromJson(Map<String, dynamic> json) {
    var minutely = <MinutelyModel>[];
    var hourly = <HourlyModel>[];
    var daily = <DailyModel>[];

    if (json['minutely'] != null) {
      json['minutely'].forEach((v) {
        minutely.add(new MinutelyModel.fromJson(v));
      });
    }
    if (json['hourly'] != null) {
      json['hourly'].forEach((v) {
        hourly.add(new HourlyModel.fromJson(v));
      });
    }
    if (json['daily'] != null) {
      json['daily'].forEach((v) {
        daily.add(new DailyModel.fromJson(v));
      });
    }
    return WeatherInfoModel(
      minutely: minutely,
      daily: daily,
      hourly: hourly,
      lat: json['lat'].toDouble(),
      lon: json['lon'].toDouble(),
      timezone: json['timezone'],
      timezoneOffset: json['timezone_offset'],
      current: json['current'] != null
          ? new CurrentModel.fromJson(json['current'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lat'] = this.lat;
    data['lon'] = this.lon;
    data['timezone'] = this.timezone;
    data['timezone_offset'] = this.timezoneOffset;
    if (this.current != null) {
      data['current'] = CurrentModel(
        dt: current.dt,
        sunrise: current.sunrise,
        sunset: current.sunset,
        temp: current.temp,
        feelsLike: current.feelsLike,
        pressure: current.pressure,
        humidity: current.humidity,
        dewPoint: current.dewPoint,
        uvi: current.uvi,
        clouds: current.clouds,
        visibility: current.visibility,
        windSpeed: current.windSpeed,
        windDeg: current.windDeg,
        weather: current.weather,
      ).toJson();
    }
    if (this.minutely != null) {
      data['minutely'] = this
          .minutely
          .map((v) => MinutelyModel(
                dt: v.dt,
                precipitation: v.precipitation,
              ).toJson())
          .toList();
    }
    if (this.hourly != null) {
      data['hourly'] = this
          .hourly
          .map((v) => HourlyModel(
                dt: v.dt,
                temp: v.temp,
                feelsLike: v.feelsLike,
                pressure: v.pressure,
                humidity: v.humidity,
                dewPoint: v.dewPoint,
                uvi: v.uvi,
                clouds: v.clouds,
                visibility: v.visibility,
                windSpeed: v.windSpeed,
                windDeg: v.windDeg,
                weather: v.weather,
                pop: v.pop,
              ).toJson())
          .toList();
    }
    if (this.daily != null) {
      data['daily'] = this
          .daily
          .map((v) => DailyModel(
                dt: v.dt,
                sunrise: v.sunrise,
                sunset: v.sunset,
                moonrise: v.moonrise,
                moonset: v.moonset,
                moonPhase: v.moonPhase,
                temp: v.temp,
                feelsLike: v.feelsLike,
                pressure: v.pressure,
                humidity: v.humidity,
                dewPoint: v.dewPoint,
                windSpeed: v.windSpeed,
                windDeg: v.windDeg,
                weather: v.weather,
                clouds: v.clouds,
                pop: v.pop,
                uvi: v.uvi,
              ).toJson())
          .toList();
    }
    return data;
  }
}
