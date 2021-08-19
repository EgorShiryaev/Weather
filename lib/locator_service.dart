import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/internet_checker/internet_checker.dart';
import 'features/weather_info/data/datasources/local_datasource/weather_info_local_datasource.dart';
import 'features/weather_info/data/datasources/remote_datasource/weather_info_remote_datasource.dart';
import 'features/weather_info/data/repositories/weather_info_repository_impl.dart';
import 'features/weather_info/domain/repositories/weather_info_repository.dart';
import 'features/weather_info/domain/usecases/get_weather_info.dart';
import 'features/weather_info/presentation/cubit/weather_info_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // BLoC / Cubit
  sl.registerFactory(() => WeatherInfoCubit(getWeatherInfo: sl()));

  // UseCases
  sl.registerLazySingleton(() => GetWeatherInfo( weatherInfoRepository: sl()));
 

  // Repository
  sl.registerLazySingleton<WeatherInfoRepository>(
    () => WeatherInfoRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(), 
    ),
  );

  sl.registerLazySingleton<WeatherInfoRemoteDataSource>(
    () => WeatherInfoRemoteDataSourceImpl(),
  );

  sl.registerLazySingleton<WeatherInfoLocalDataSource>(
    () => WeatherInfoLocalDataSourceImpl(sharedPreferences: sl()),
  );

  // Core
  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImp(sl()),
  );

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
