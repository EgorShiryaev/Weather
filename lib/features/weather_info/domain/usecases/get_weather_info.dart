import 'package:dartz/dartz.dart';
import 'package:weather_mobile_app/core/error/failure.dart';
import 'package:weather_mobile_app/core/usecases/usecase.dart';
import 'package:weather_mobile_app/features/weather_info/domain/entities/weather_info_entity.dart';
import 'package:weather_mobile_app/features/weather_info/domain/repositories/weather_info_repository.dart';

class GetWeatherInfo extends UseCase<WeatherInfoEntity, CoordinatParams> {
  final WeatherInfoRepository weatherInfoRepository;

  GetWeatherInfo({required this.weatherInfoRepository});

  @override
  Future<Either<Failure, WeatherInfoEntity>> call(CoordinatParams params) async {
    return await weatherInfoRepository.getWeatherInfo(params.lat, params.long);
  }
}

class CoordinatParams {
  final double lat;
  final double long;

  CoordinatParams({
    required this.lat,
    required this.long,
  });
}
