import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  String text = '';
  CustomTitle(String text){
    this.text = text;
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          fontFamily: 'KleeOne'),
    );
  }
}
