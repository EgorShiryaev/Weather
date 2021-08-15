import 'package:weather_mobile_app/features/weather_info/data/models/weather_model.dart';
import 'package:weather_mobile_app/features/weather_info/domain/entities/current_entity.dart';

class CurrentModel extends CurrentEntity {
  CurrentModel({
    required dt,
    required sunrise,
    required sunset,
    required temp,
    required feelsLike,
    required pressure,
    required humidity,
    required dewPoint,
    required uvi,
    required clouds,
    required visibility,
    required windSpeed,
    required windDeg,
    required weather,
  }) : super(
          dt: dt,
          sunrise: sunrise,
          sunset: sunset,
          visibility: visibility,
          temp: temp,
          feelsLike: feelsLike,
          pressure: pressure,
          humidity: humidity,
          dewPoint: dewPoint,
          windSpeed: windSpeed,
          windDeg: windDeg,
          weather: weather,
          clouds: clouds,
          uvi: uvi,
        );

  factory CurrentModel.fromJson(Map<String, dynamic> json) {
    var weather = <WeatherModel>[];
    if (json['weather'] != null) {
      json['weather'].forEach((v) {
        weather.add(new WeatherModel.fromJson(v));
      });
    }
    return CurrentModel(
      dt: json['dt'],
      sunrise: json['sunrise'],
      sunset: json['sunset'],
      temp: json['temp'].toDouble(),
      feelsLike: json['feels_like'].toDouble(),
      pressure: json['pressure'],
      humidity: json['humidity'],
      dewPoint: json['dew_point'].toDouble(),
      uvi: json['uvi'],
      clouds: json['clouds'],
      visibility: json['visibility'],
      windSpeed: json['wind_speed'].toDouble(),
      windDeg: json['wind_deg'],
      weather: weather,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dt'] = this.dt;
    data['sunrise'] = this.sunrise;
    data['sunset'] = this.sunset;
    data['temp'] = this.temp;
    data['feels_like'] = this.feelsLike;
    data['pressure'] = this.pressure;
    data['humidity'] = this.humidity;
    data['dew_point'] = this.dewPoint;
    data['uvi'] = this.uvi;
    data['clouds'] = this.clouds;
    data['visibility'] = this.visibility;
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
    return data;
  }
}
