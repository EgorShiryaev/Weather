import 'feelsLike.dart';
import 'temp_entity.dart';
import 'weather_entity.dart';

class DailyEntity {
  final int dt;
  final int sunrise;
  final int sunset;
  final int moonrise;
  final int moonset;
  final double moonPhase;
  final TempEntity temp;
  final FeelsLikeEntity feelsLike;
  final int pressure;
  final int humidity;
  final double dewPoint;
  final double windSpeed;
  final int windDeg;
  final List<WeatherEntity> weather;
  final int clouds;
  final double pop;
  final double uvi;


  DailyEntity({
    required this.dt,
    required this.sunrise,
    required this.sunset,
    required this.moonrise,
    required this.moonset,
    required this.moonPhase,
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.dewPoint,
    required this.windSpeed,
    required this.windDeg,
    required this.weather,
    required this.clouds,
    required this.pop,
    required this.uvi,

  });
}
