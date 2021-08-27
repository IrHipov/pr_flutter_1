import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pr_flutter_1/widgets/logo_widget.dart';
import 'package:pr_flutter_1/widgets/title_widget.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    new Timer(const Duration(milliseconds: 3000),
        () => {Navigator.pushReplacementNamed(context, '/login')});

    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Container(
            child: Logo(),
          ),
          SizedBox(height: 64),
          Column(
            children: [
              CustomTitle("Welcome!"),
              Text(
                "Start your healthier lifestyle now",
                style: TextStyle(fontSize: 18, fontFamily: 'KleeOne'),
              ),
              Container(
                margin: EdgeInsets.all(12),
                child: Image.asset("assets/images/logo_welcome.png"),
              ),
            ],
          )
        ],
      ),
    ));
  }
}
