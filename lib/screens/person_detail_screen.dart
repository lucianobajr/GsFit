import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gsfit/models/employee.dart';

class PeopleDetailScreen extends StatelessWidget {
  final Employee people;

  PeopleDetailScreen({@required this.people});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
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
                              Icon(
                                FontAwesomeIcons.share,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: screenHeight * 0.35,
                    width: screenWidth - 50,
                    child: Hero(
                      tag: people.firstName,
                      child: Image(
                        image: AssetImage(
                            url(int.parse(people.age), int.parse(people.sex))),
                        fit: BoxFit.fitHeight,
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
                    vertical: 30.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Icon(
                                FontAwesomeIcons.marker,
                                size: 40,
                              )
                            ],
                          ),
                          SizedBox(
                            width: 16.0,
                          ),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text('Studio GS  Fit ',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                        )),
                                    Text('May 25, 2019',
                                        style: TextStyle(
                                          color: Colors.black.withOpacity(0.7),
                                          fontWeight: FontWeight.w600,
                                        )),
                                  ],
                                ),
                                SizedBox(
                                  height: 8.0,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                          "My job requires moving to another contry. I don't have the opportunity to take the cat with me.I am looking for good people who will shetter Sola.",
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.8),
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400,
                          )),
                    ],
                  ),
                ),
                color: Colors.white,
              )),
              Container(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 22.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Material(
                        borderRadius: BorderRadius.circular(20.0),
                        elevation: 4.0,
                        color: Theme.of(context).primaryColor,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Icon(
                            FontAwesomeIcons.userClock,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 24.0,
                      ),
                      Expanded(
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          elevation: 4.0,
                          color: Theme.of(context).primaryColor,
                          child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Text(
                                'Avaliação Física',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                ),
                                textAlign: TextAlign.center,
                              )),
                        ),
                      )
                    ],
                  ),
                ),
                height: 150,
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(0.06),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30.0),
                        topLeft: Radius.circular(30.0))),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Material(
              borderRadius: BorderRadius.circular(20.0),
              elevation: 6.0,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Text(people.firstName,
                            style: TextStyle(
                                fontSize: 24.0,
                                fontFamily: 'Lobster',
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold)),
                        Icon(
                          int.parse(people.sex) == 1
                              ? FontAwesomeIcons.venus
                              : FontAwesomeIcons.mars,
                          color: Colors.black.withOpacity(0.7),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 10.0,
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('${people.age} anos',
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.8),
                                fontWeight: FontWeight.w600)),
                      ],
                    ),
                    SizedBox(
                      width: 10.0,
                      height: 10.0,
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          FontAwesomeIcons.mapMarkerAlt,
                          color: Theme.of(context).primaryColor,
                          size: 16.0,
                        ),
                        SizedBox(
                          width: 16.0,
                        ),
                        Text('${people.adress}',
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.black,
                                fontWeight: FontWeight.w400)),
                      ],
                    )
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                height: 120.0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  String url(int age, int index) {
    String base = 'assets/images/';

    if (age < 12) {
      //child
      base = base + 'child-';
    } else if (age >= 12 && age < 20) {
      //adolescence
      base = base + 'adolescence-';
    } else if (age >= 20 && age < 35) {
      //adult
      base = base + 'adult-';
    } else if (age >= 35 && age < 50) {
      //mildlife
      base = base + 'mildlife-';
    } else {
      //mature
      base = base + 'mature-';
    }

    if (index == 1) {
      base = base + 'female.png';
    } else {
      base = base + 'male.png';
    }
    return base;
  }
}
