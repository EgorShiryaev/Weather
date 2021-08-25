import 'package:flutter/material.dart';
import 'package:weather_mobile_app/core/size/size.dart';

class LoadingState extends StatelessWidget {
  const LoadingState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator();
  }
}
