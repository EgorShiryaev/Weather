import 'package:dartz/dartz.dart';
import 'package:weather_mobile_app/core/error/failure.dart';
import 'package:weather_mobile_app/features/weather_info/domain/entities/weather_info_entity.dart';

abstract class WeatherInfoRepository {
  Future<Either<Failure,WeatherInfoEntity>> getWeatherInfo(double lat, double long);
}
