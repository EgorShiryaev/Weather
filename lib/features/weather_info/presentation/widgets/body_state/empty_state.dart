import 'package:flutter/material.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.blue[300],
        ),
        padding: EdgeInsets.all(15),

        child: Text('Проверьте подключение к интернету\nИ повторите запрос'),
      ),
    );
  }
}
