import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_mobile_app/core/error/failure.dart';
import 'package:weather_mobile_app/features/weather_info/domain/usecases/get_weather_info.dart';
import 'package:weather_mobile_app/features/weather_info/presentation/cubit/weather_info_state.dart';


class WeatherInfoCubit extends Cubit<WeatherInfoState> {
  final GetWeatherInfo getWeatherInfo;
  WeatherInfoCubit({required this.getWeatherInfo}) : super(
    //
    WeatherEmptyState(),
    // WeatherErrorState(message: 'Ошибка сервера'),
    // WeatherLoadedState(weatherInfo: ),
    // WeatherLoadingState(),
    );

  void loadWeatherInfo(double lat, double long) async {
    emit(WeatherLoadingState());
    final failureOrPerson =
        await getWeatherInfo(CoordinatParams(lat: lat, long: long));
    failureOrPerson.fold(
        (failure) =>
            emit(WeatherErrorState(message: _mapFailureToMessage(failure))),
        (weatherInfo) => emit(WeatherLoadedState(weatherInfo: weatherInfo)));
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'Ошибка сервер';
      case CacheFailure:
        return 'Ошибка кэша';
      default:
        return 'Неизвестная ошибка';
    }
  }
}
