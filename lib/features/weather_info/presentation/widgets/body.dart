import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_mobile_app/features/weather_info/presentation/cubit/weather_info_cubit.dart';
import 'package:weather_mobile_app/features/weather_info/presentation/cubit/weather_info_state.dart';

import 'package:weather_mobile_app/features/weather_info/presentation/widgets/body_state/empty_state.dart';
import 'package:weather_mobile_app/features/weather_info/presentation/widgets/body_state/error_state.dart';
import 'package:weather_mobile_app/features/weather_info/presentation/widgets/body_state/loaded_state.dart';
import 'package:weather_mobile_app/features/weather_info/presentation/widgets/body_state/loading_state.dart';

import 'background.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Background(),
        BlocBuilder<WeatherInfoCubit, WeatherInfoState>(
          builder: (context, state) {
            if (state is WeatherEmptyState) {
              return EmptyState();
            } else if (state is WeatherLoadingState) {
              return LoadingState();
            } else if (state is WeatherErrorState) {
              return ErrorState(error: state.message);
            } else if (state is WeatherLoadedState) {
              return LoadedState(
                weatherInfo: state.weatherInfo,
                paddingTop: MediaQuery.of(context).padding.top,
                
              );
            }
            return Container(
              color: Colors.red,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.red[300],
              ),
              padding: EdgeInsets.all(15),
              child: Text('Неизвестный state'),
            );
          },
        )
      ],
    );
  }
}
