import 'package:flutter/material.dart';
import 'package:weather_mobile_app/features/weather_info/presentation/widgets/end_drawer_widget.dart';

import 'core/util/location.dart';
import 'features/weather_info/presentation/pages/loading_page.dart';
import 'features/weather_info/presentation/pages/weather_page.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Location().getCurrentLocation(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes:{
        '/': (context) => LoadingPage(),
        '/weatherInfo': (context) => WeatherPage(),
        '/searchPage': (context) => EndDrawer()
      },
    );
  }
}