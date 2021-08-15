import 'current_entity.dart';
import 'daily_entity.dart';
import 'hourly_entity.dart';
import 'minutely_entity.dart';

class WeatherInfoEntity {
  final double lat;
  final double lon;
  final String timezone;
  final int timezoneOffset;
  final CurrentEntity current;
  final List<MinutelyEntity> minutely;
  final List<HourlyEntity> hourly;
  final List<DailyEntity> daily;

  WeatherInfoEntity({
    required this.lat,
    required this.lon,
    required this.timezone,
    required this.timezoneOffset,
    required this.current,
    required this.minutely,
    required this.hourly,
    required this.daily,
  });
}
