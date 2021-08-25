import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DesignByWidget extends StatelessWidget {
  const DesignByWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Design by Egor Shiryaev'),
        SizedBox(height: 6),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(FontAwesomeIcons.instagram),
            SizedBox(width: 10),
            Text('@unplugged_file'),
          ],
        ),
        SizedBox(height: 6),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(FontAwesomeIcons.telegramPlane),
             SizedBox(width: 11),
            Text('@ShiryaevEg0r'),
            SizedBox(width: 11),
          ],
        )
      ],
    );
  }
}
