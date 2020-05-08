import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gsfit/main.dart';
import 'package:gsfit/models/employee.dart';
import 'package:gsfit/screens/body_part_screen.dart';

class BodyDetail extends StatefulWidget {
  final Employee people;
  BodyDetail({@required this.people});

  @override
  _BodyDetailState createState() => _BodyDetailState();
}

class _BodyDetailState extends State<BodyDetail> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Column(
            children: <Widget>[
              Stack(
                alignment: Alignment.centerRight,
                children: <Widget>[
                  Container(
                    height: screenHeight * 0.5,
                    color: Color(0xffa54657),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 60.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Icon(
                                  FontAwesomeIcons.arrowLeft,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                  child: Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 22.0,
                    vertical: 50.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[],
                      ),
                      SizedBox(
                        height: 20.0,
                      )
                    ],
                  ),
                ),
                color: Colors.white,
              )),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Body(),
                      ),
                    );
                  },
                  child: Container(
                    margin:
                        const EdgeInsets.only(bottom: 20, left: 16, right: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [mainColor, Color(0xff772e25)]),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          width: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: Align(
                            child: Text(
                              'Medidas',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w800),
                            ),
                          ),
                        ),
                        Expanded(
                            child: Row(
                          children: <Widget>[
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25)),
                                color: Color.fromRGBO(255, 255, 255, 0.4),
                              ),
                              padding: const EdgeInsets.all(10.0),
                              child: Image.asset(
                                'assets/icons/chest.png',
                                color: Colors.white,
                                width: 50,
                                height: 50,
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25)),
                                color: Color.fromRGBO(255, 255, 255, 0.4),
                              ),
                              padding: const EdgeInsets.all(10.0),
                              child: Image.asset(
                                'assets/icons/abs.png',
                                color: Colors.white,
                                width: 50,
                                height: 50,
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25)),
                                color: Color.fromRGBO(255, 255, 255, 0.4),
                              ),
                              padding: const EdgeInsets.all(10.0),
                              child: Image.asset(
                                'assets/icons/calf.png',
                                color: Colors.white,
                                width: 50,
                                height: 50,
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25)),
                                color: Color.fromRGBO(255, 255, 255, 0.4),
                              ),
                              padding: const EdgeInsets.all(10.0),
                              child: Image.asset(
                                'assets/icons/leg.png',
                                color: Colors.white,
                                width: 50,
                                height: 50,
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                          ],
                        ))
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
