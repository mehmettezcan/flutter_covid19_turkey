import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
          child: Stack(
        children: <Widget>[
          Center(
            child: Container(
                width: 190.0,
                height: 190.0,
                decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage("assets/images/playstore.png")))),
          ),
          Center(child: CircularProgressIndicator()),
        ],
      )),
    );
  }

  startTimer() {
    var _duration = Duration(milliseconds: 1500);
    return Timer(_duration, navigate);
  }

  navigate() async {
    Navigator.of(context).pushReplacementNamed('/home');
  }
}
