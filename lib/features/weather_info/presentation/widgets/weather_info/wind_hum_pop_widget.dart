import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WindHumPopWidget extends StatelessWidget {
  final double windSpeed;
  final int windDeg;
  final int pressure;
  final int humidity;

  WindHumPopWidget({
    required this.windSpeed,
    required this.windDeg,
    required this.pressure,
    required this.humidity,
  });

  @override
  Widget build(BuildContext context) {
    String windDirection = 'C';
    if (windDeg > 22 && windDeg < 68)
      windDirection = 'C/В';
    else if (windDeg > 67 && windDeg < 113)
      windDirection = 'В';
    else if (windDeg > 112 && windDeg < 158)
      windDirection = 'Ю/В';
    else if (windDeg > 157 && windDeg < 203)
      windDirection = 'Ю';
    else if (windDeg > 202 && windDeg < 248)
      windDirection = 'Ю/З';
    else if (windDeg > 247 && windDeg < 293)
      windDirection = 'З';
    else if (windDeg > 292 && windDeg < 338) windDirection = 'С/З';

    int newPressure = (pressure * 3 / 4).round();
    return Container(
      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                CupertinoIcons.wind,
                color: Colors.black,
              ),
              Icon(
                CupertinoIcons.thermometer,
                color: Colors.black,
              ),
              Icon(
                CupertinoIcons.drop,
                color: Colors.black,
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                '$windSpeed м/c $windDirection',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              Text(
                '$newPressure мм/рт. ст.',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              Text(
                '$humidity %',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
