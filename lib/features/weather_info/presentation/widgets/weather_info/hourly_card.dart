import 'package:flutter/material.dart';
import 'package:weather_mobile_app/core/constants/constants.dart';
import 'package:weather_mobile_app/core/util/util.dart';
import 'package:weather_mobile_app/features/weather_info/domain/entities/hourly_entity.dart';

class HourlyCard extends StatelessWidget {
  final List<HourlyEntity> hourlyWeather;
  final int index;
  const HourlyCard({required this.hourlyWeather, required this.index});

  @override
  Widget build(BuildContext context) {
    String feelsLike = hourlyWeather[index].feelsLike > 0
        ? '+ ${hourlyWeather[index].feelsLike.round()}°'
        : '${hourlyWeather[index].feelsLike.round()}°';
    return Container(
      padding: EdgeInsets.fromLTRB(0, 13, 0, 13),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Row(
              children: [
                SizedBox(width: 12),
                Text(
                  index != 0
                      ? Util.getFormattedTime(
                          DateTime.fromMillisecondsSinceEpoch(
                              (hourlyWeather[index].dt + Constants.timezoneOffset - 10800) * 1000 ),
                        )
                      : 'Сейчас',
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Image.network(
              Constants.openWeatherMapIcon +
                  hourlyWeather[index].weather[0].icon,
              scale: 0.90,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                SizedBox(width: 12),
                Text(
                  feelsLike,
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
