import 'package:flutter/material.dart';
import 'dart:async';
import 'package:shimmer/shimmer.dart';

void main() {
  runApp(new MaterialApp(
    routes: <String, WidgetBuilder>{
      //'/HomeScreen': (BuildContext context) => MenuFrame()
    },
  ));
}

class SplashScree extends StatefulWidget {
  @override
  _SplashScreeState createState() => _SplashScreeState();
}

class _SplashScreeState extends State<SplashScree> {
  startTime() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('/HomeScreen');
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        color: Colors.white,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Shimmer.fromColors(
              baseColor: Color(0xffb33939),
              highlightColor: Color(0xffff5252),
              child: Container(
                child: Image.asset(
                  'assets/gsfit.png',
                  height: 300,
                  width: 300,
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
