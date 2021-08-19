import 'package:flutter/material.dart';
import 'package:weather_mobile_app/core/constants/constants.dart';

class CurrentWeatherWidget extends StatelessWidget {
  final int temp;
  final String icon;
  final String description;
  final int feelsLike;

  const CurrentWeatherWidget({
    required this.temp,
    required this.icon,
    required this.description,
    required this.feelsLike,
  });

  @override
  Widget build(BuildContext context) {
    String feelsLikeDescription =
        feelsLike > 0 ? '+ $feelsLike°' : '$feelsLike°';

    return Stack(
      children: [
        Column(
          children: [ 
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  Constants.openWeatherMapIcon + icon,
                  scale: 0.65,
                ),
                SizedBox(width: 12),
                Text(
                  temp > 0 ? '+ $temp°' : '$temp°',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 60),
              Text(
                '${description.characters.first.toUpperCase() + description.substring(1)}',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              Text(
                'Ощущается как ' + feelsLikeDescription,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
