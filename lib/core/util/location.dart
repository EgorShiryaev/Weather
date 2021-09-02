import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_mobile_app/core/constants/constants.dart';
import 'package:weather_mobile_app/features/weather_info/presentation/cubit/weather_info_cubit.dart';

class Location {
  late double lat;
  late double long;

  Future<void> getCurrentLocation(context) async {
    try {
      Position position = await Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.medium)
          .timeout(Duration(seconds: 15));
      this.lat = position.latitude;
      this.long = position.longitude;
      Constants.lat = position.latitude;
      Constants.long = position.longitude;
      Constants.useGeolocator = true;
      BlocProvider.of<WeatherInfoCubit>(context)
          .loadWeatherInfo(Constants.lat, Constants.long);
    } catch (e) {
      throw 'Произошла ошибка $e';
    }
  }
}
