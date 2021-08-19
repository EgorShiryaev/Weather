import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weather_mobile_app/core/size/size.dart';
import 'package:weather_mobile_app/features/weather_info/presentation/cubit/weather_info_cubit.dart';
import 'package:weather_mobile_app/features/weather_info/presentation/cubit/weather_info_state.dart';
import 'package:weather_mobile_app/features/weather_info/presentation/widgets/background.dart';
import 'package:weather_mobile_app/features/weather_info/presentation/widgets/body.dart';
import 'package:weather_mobile_app/locator_service.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: MultiProvider(providers: [
        BlocProvider<WeatherInfoCubit>(
          create: (context) =>
              sl<WeatherInfoCubit>()..loadWeatherInfo(55.751244, 37.618423),
        )
      ], child: Body()),
    );
  }
}
