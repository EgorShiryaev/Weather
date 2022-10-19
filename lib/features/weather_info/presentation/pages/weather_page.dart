import 'package:flutter/material.dart';
import 'package:weather_mobile_app/features/weather_info/presentation/widgets/end_drawer_widget.dart';
import 'package:weather_mobile_app/features/weather_info/presentation/widgets/body.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: EndDrawer(),
      body: Body(),
    );
  }
}
