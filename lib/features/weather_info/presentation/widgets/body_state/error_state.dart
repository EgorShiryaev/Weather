import 'package:flutter/material.dart';

class ErrorState extends StatelessWidget {
  final String error;
  const ErrorState({required this.error});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.red,
        ),
        padding: EdgeInsets.all(15),

        child: Text(
          error,
          style: TextStyle(color: Colors.black, fontSize: 14),
        ),
      ),
    );
  }
}
