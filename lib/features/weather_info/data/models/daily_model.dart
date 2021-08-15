import 'package:weather_mobile_app/features/weather_info/data/models/temp_model.dart';
import 'package:weather_mobile_app/features/weather_info/data/models/weather_model.dart';
import 'package:weather_mobile_app/features/weather_info/domain/entities/daily_entity.dart';

import 'feels_like_model.dart';

class DailyModel extends DailyEntity {
  DailyModel({
    required dt,
    required sunrise,
    required sunset,
    required moonrise,
    required moonset,
    required moonPhase,
    required temp,
    required feelsLike,
    required pressure,
    required humidity,
    required dewPoint,
    required windSpeed,
    required windDeg,
    required weather,
    required clouds,
    required pop,
    required uvi,
  }) : super(
          dt: dt,
          sunrise: sunrise,
          sunset: sunset,
          moonrise: moonrise,
          moonset: moonset,
          moonPhase: moonPhase,
          temp: temp,
          feelsLike: feelsLike,
          pressure: pressure,
          humidity: humidity,
          dewPoint: dewPoint,
          windSpeed: windSpeed,
          windDeg: windDeg,
          weather: weather,
          clouds: clouds,
          pop: pop,
          uvi: uvi,
        );

  factory DailyModel.fromJson(Map<String, dynamic> json) {
    var weather = <WeatherModel>[];
    if (json['weather'] != null) {
      json['weather'].forEach((v) {
        weather.add(new WeatherModel.fromJson(v));
      });
    }

    return DailyModel(
      dt: json['dt'],
      sunrise: json['sunrise'],
      sunset: json['sunset'],
      moonrise: json['moonrise'],
      moonset: json['moonset'],
      moonPhase: json['moon_phase'].toDouble(),
      temp: json['temp'] != null ? new TempModel.fromJson(json['temp']) : null,
      feelsLike: json['feels_like'] != null
          ? new FeelsLikeModel.fromJson(json['feels_like'])
          : null,
      pressure: json['pressure'],
      humidity: json['humidity'],
      dewPoint: json['dew_point'].toDouble(),
      windSpeed: json['wind_speed'].toDouble(),
      windDeg: json['wind_deg'],
      weather: weather,
      clouds: json['clouds'],
      pop: json['pop'].toDouble(),
      uvi: json['uvi'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dt'] = this.dt;
    data['sunrise'] = this.sunrise;
    data['sunset'] = this.sunset;
    data['moonrise'] = this.moonrise;
    data['moonset'] = this.moonset;
    data['moon_phase'] = this.moonPhase;
    if (this.temp != null) {
      data['temp'] = TempModel(
        day: temp.day,
        min: temp.min,
        max: temp.max,
        night: temp.night,
        eve: temp.eve,
        morn: temp.morn,
      ).toJson();
    }
    if (this.feelsLike != null) {
      data['feels_like'] = FeelsLikeModel(
        day: feelsLike.day,
        night: feelsLike.night,
        eve: feelsLike.eve,
        morn: feelsLike.morn,
      ).toJson();
    }
    data['pressure'] = this.pressure;
    data['humidity'] = this.humidity;
    data['dew_point'] = this.dewPoint;
    data['wind_speed'] = this.windSpeed;
    data['wind_deg'] = this.windDeg;
    if (this.weather != null) {
      data['weather'] = this
          .weather
          .map((v) => WeatherModel(
                id: v.id,
                main: v.main,
                description: v.description,
                icon: v.icon,
              ).toJson())
          .toList();
    }
    data['clouds'] = this.clouds;
    data['pop'] = this.pop;
    data['uvi'] = this.uvi;
    return data;
  }
}
