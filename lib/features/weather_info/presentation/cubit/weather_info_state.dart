import 'package:weather_mobile_app/features/weather_info/domain/entities/weather_info_entity.dart';

abstract class WeatherInfoState {}

class WeatherEmptyState extends WeatherInfoState {}

class WeatherLoadingState extends WeatherInfoState {}

class WeatherLoadedState extends WeatherInfoState {
  final WeatherInfoEntity weatherInfo;

  WeatherLoadedState({required this.weatherInfo});
}

class WeatherErrorState extends WeatherInfoState {
  final String message;

  WeatherErrorState({required this.message});
}
