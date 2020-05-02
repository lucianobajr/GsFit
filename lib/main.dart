import 'package:flutter/material.dart';
import 'package:gsfit/view/menu_frame.dart';
import 'package:shimmer/shimmer.dart';
import 'dart:async';

Color mainColor = Color.fromRGBO(162, 62, 72, 1.0);
Color startingColor = Color.fromRGBO(196, 40,71, 1.0);

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
    theme: ThemeData(
      primaryColor: mainColor
    ),
    routes: <String, WidgetBuilder>{
      '/HomeScreen': (BuildContext context) => MenuFrame()
    },
  ));
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    return Timer(Duration(seconds: 2),
        () => Navigator.of(context).pushReplacementNamed('/HomeScreen'));
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
              baseColor: Color(0xffc81d25),
              highlightColor: Color(0xff9a031e),
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