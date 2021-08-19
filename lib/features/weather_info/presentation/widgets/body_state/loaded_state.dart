import 'package:flutter/material.dart';
import 'package:weather_mobile_app/features/weather_info/domain/entities/weather_info_entity.dart';
import 'package:weather_mobile_app/features/weather_info/presentation/widgets/weather_info/app_bar_widget.dart';
import 'package:weather_mobile_app/features/weather_info/presentation/widgets/weather_info/current_weather_widget.dart';
import 'package:weather_mobile_app/features/weather_info/presentation/widgets/weather_info/daily_weather_widget.dart';
import 'package:weather_mobile_app/features/weather_info/presentation/widgets/weather_info/hourly_weather.dart';

class LoadedState extends StatelessWidget {
  final WeatherInfoEntity weatherInfo;
  final double paddingTop;

  const LoadedState({
    required this.weatherInfo,
    required this.paddingTop,
  });

  @override
  Widget build(BuildContext context) {
    bool warning = false;
    int minute = 0;
    for (int i = 0; i < 61; i++) {
      if (weatherInfo.minutely[i].precipitation > 0) {
        warning = true;
        minute = i;
        break;
      }
    }

    return ListView(
      children: [
        AppBarWidget(weatherInfo: weatherInfo),
        CurrentWeatherWidget(
          temp: weatherInfo.current.temp.round(),
          icon: weatherInfo.current.weather[0].icon,
          feelsLike: weatherInfo.current.feelsLike.round(),
          description: weatherInfo.current.weather[0].description,
        ),
        Column(
          children: [
            SizedBox(height: 15),
            warning
                ? Text(
                    'Через $minute минут возможно выпадение осадков',
                    style: TextStyle(color: Colors.white, fontSize: 11),
                  )
                : Text(
                    'В ближайший час выпадение осадков не ожидается',
                    style: TextStyle(color: Colors.white, fontSize: 11),
                  ),
            SizedBox(height: 14),
          ],
        ),
        
        HourlyWeather(
          hourlyWeather: weatherInfo.hourly,
          current: weatherInfo.current,
        ),
        DailyWeatherWidget(dailyWeather: weatherInfo.daily),
        
      ],
    );
  }
}
