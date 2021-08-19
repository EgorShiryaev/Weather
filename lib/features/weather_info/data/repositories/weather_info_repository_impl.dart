import 'package:weather_mobile_app/core/internet_checker/internet_checker.dart';
import 'package:weather_mobile_app/features/weather_info/data/datasources/local_datasource/weather_info_local_datasource.dart';
import 'package:weather_mobile_app/features/weather_info/data/datasources/remote_datasource/weather_info_remote_datasource.dart';
import 'package:weather_mobile_app/features/weather_info/domain/entities/weather_info_entity.dart';
import 'package:weather_mobile_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:weather_mobile_app/features/weather_info/domain/repositories/weather_info_repository.dart';

class WeatherInfoRepositoryImpl implements WeatherInfoRepository {
  final WeatherInfoRemoteDataSource remoteDataSource;
  final WeatherInfoLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  WeatherInfoRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo, 
  });

  @override
  Future<Either<Failure, WeatherInfoEntity>> getWeatherInfo(
      double lat, double long) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteWeatherInfo =
            await remoteDataSource.getWeatherInfo(lat, long);
        localDataSource.weatherInfoToCache(remoteWeatherInfo);
        return Right(remoteWeatherInfo);
      } catch (_) {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localWeatherInfo =
            await localDataSource.getLastWeatherFromCache();
        return Right(localWeatherInfo);
      } catch (_) {
        return Left(CacheFailure());
      }
    }
  }
}
