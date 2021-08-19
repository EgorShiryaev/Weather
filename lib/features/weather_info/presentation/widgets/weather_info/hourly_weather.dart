import 'package:flutter/material.dart';

import 'package:weather_mobile_app/features/weather_info/domain/entities/current_entity.dart';
import 'package:weather_mobile_app/features/weather_info/domain/entities/hourly_entity.dart';

import 'hourly_card.dart';
import 'wind_hum_pop_widget.dart';

class HourlyWeather extends StatelessWidget {
  final CurrentEntity current;
  final List<HourlyEntity> hourlyWeather;
  const HourlyWeather({
    required this.hourlyWeather,
    required this.current,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          WindHumPopWidget(
            humidity: current.humidity,
            pressure: current.pressure,
            windDeg: current.windDeg,
            windSpeed: current.windSpeed,
          ),
          Row(
            children: List<Widget>.generate(24, (index) {
              return Row(
                children: [
                  SizedBox(width: 15),
                  HourlyCard(
                    hourlyWeather: hourlyWeather,
                    index: index,
                  ),
                  index == 23 ? SizedBox(width: 15) : Container()
                ],
              );
            }),
          )
        ],
      ),
    );
  }
}
