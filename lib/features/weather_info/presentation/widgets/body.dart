import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_mobile_app/core/size/size.dart';
import 'package:weather_mobile_app/features/weather_info/presentation/cubit/weather_info_cubit.dart';
import 'package:weather_mobile_app/features/weather_info/presentation/cubit/weather_info_state.dart';
import 'package:weather_mobile_app/features/weather_info/presentation/widgets/body_state/empty_state.dart';
import 'package:weather_mobile_app/features/weather_info/presentation/widgets/body_state/error_state.dart';
import 'package:weather_mobile_app/features/weather_info/presentation/widgets/body_state/loaded_state.dart';
import 'package:weather_mobile_app/features/weather_info/presentation/widgets/body_state/loading_state.dart';

import 'background.dart';

class Body extends StatelessWidget {
  final scrollController = ScrollController();

  void setupScrollController(BuildContext context) {
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels == 0) {
          context
              .read<WeatherInfoCubit>()
              .loadWeatherInfo(55.751244, 37.618423);
        }
      }
    });
  }

  Widget _checkState(WeatherInfoState state) {
    if (state is WeatherEmptyState) {
      return EmptyState();
    } else if (state is WeatherLoadingState) {
      return LoadingState();
    } else if (state is WeatherErrorState) {
      return ErrorState(error: state.message);
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
  }

  @override
  Widget build(BuildContext context) {
    setupScrollController(context);

    return ListView(
      controller: scrollController,
      padding: EdgeInsets.only(top: 0),
      children: [
        Stack(
          children: [
            Background(),
            BlocBuilder<WeatherInfoCubit, WeatherInfoState>(
              builder: (context, state) {
                if (state is WeatherLoadedState) {
                  return LoadedState(
                    weatherInfo: state.weatherInfo,
                    paddingTop: MediaQuery.of(context).padding.top,
                  );
                }
                return Container(
                  height: SIZE.getSize(context).height,
                  child: Center(
                    child: _checkState(state),
                  ),
                );
              },
            ),
            
          ],
        ),
      ],
    );
  }
}
