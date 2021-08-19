import 'package:flutter/material.dart';
import 'package:weather_mobile_app/locator_service.dart' as di;
import 'package:weather_mobile_app/weather_app.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(WeatherApp());
}
