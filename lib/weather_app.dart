import 'package:flutter/material.dart';

import 'features/weather_info/presentation/pages/loading_page.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoadingPage(),
    );
  }
}