import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset("assets/images/background.jpeg"),
        Container(
          height: 110,
          color: Colors.blue[200],
        )
      ],
    );
  }
}
