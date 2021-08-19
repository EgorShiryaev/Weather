import 'package:flutter/material.dart';

class ProgressBar extends StatefulWidget {
  const ProgressBar({Key? key}) : super(key: key);

  @override
  _ProgressBarState createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar>
    with TickerProviderStateMixin {
  late AnimationController controller;
  bool stop = false;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..addListener(() {
        setState(() {
          ///
          /// Переход на следующую страницу, после того как загрузка закончиться
          ///
          if (controller.value > 0.98) {
            Navigator.pushReplacementNamed(context, '/weatherInfo');
          }
        });
      });
    controller.repeat(reverse: false);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
        value: controller.value,
        backgroundColor: Colors.blue.shade400,
        color: Colors.white);
  }
}
