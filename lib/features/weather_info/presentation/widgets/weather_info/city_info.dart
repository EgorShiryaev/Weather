import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class CityInfo extends StatelessWidget {
  final String namePlace;
  const CityInfo({required this.namePlace});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 15 - 15 - 48 - 48,
      child: AutoSizeText(
        "$namePlace",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        maxFontSize: 16,
        maxLines: 3,
        textAlign: TextAlign.center,
      ),
    );
  }
}
