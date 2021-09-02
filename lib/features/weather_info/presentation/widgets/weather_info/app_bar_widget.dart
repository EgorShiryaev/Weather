import 'package:flutter/material.dart';
import 'package:weather_mobile_app/core/constants/constants.dart';
import 'package:weather_mobile_app/core/util/location.dart';
import 'package:weather_mobile_app/features/weather_info/domain/entities/weather_info_entity.dart';

import 'city_info.dart';

class AppBarWidget extends StatelessWidget {
  final WeatherInfoEntity weatherInfo;
  const AppBarWidget({required this.weatherInfo});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 15,
        right: 15,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              Location().getCurrentLocation(context);
            },
            icon: Icon(
              Icons.my_location,
              color: Colors.white,
            ),
          ),
          CityInfo(namePlace: Constants.placeName),
          IconButton(
            onPressed: () => Scaffold.of(context).openEndDrawer(),
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
