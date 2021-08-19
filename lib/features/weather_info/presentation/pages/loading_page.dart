import 'package:flutter/material.dart';
import 'package:weather_mobile_app/core/size/size.dart';
import 'package:weather_mobile_app/features/weather_info/presentation/widgets/progress_bar.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: SIZE.getSize(context).width,
        color: Colors.blue.shade400,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Weather Mobile App',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Design by Egor Shiryaev',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            ProgressBar(),
          ],
        ),
      ),
    );
  }
}
