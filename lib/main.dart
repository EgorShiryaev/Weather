import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weather_mobile_app/locator_service.dart' as di;
import 'package:weather_mobile_app/weather_app.dart';

import 'core/constants/constants.dart';
import 'features/weather_info/presentation/cubit/weather_info_cubit.dart';
import 'locator_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(
    MultiProvider(
      providers: [
        BlocProvider<WeatherInfoCubit>(
          create: (context) => sl<WeatherInfoCubit>()
            ..loadWeatherInfo(
              Constants.lat,
              Constants.long,
            ),
        ),
      ],
      child: WeatherApp(),
    ),
  );
}
