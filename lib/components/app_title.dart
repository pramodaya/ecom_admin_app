import 'package:flutter/material.dart';

class AppTitle extends StatelessWidget {
  final String title;
  const AppTitle({ Key? key, required this.title }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(title, style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),),
    );
  }
}