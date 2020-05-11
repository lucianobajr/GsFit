import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gsfit/models/body.dart';
import 'package:gsfit/models/bodyPart.dart';
import 'package:gsfit/models/employee.dart';

class BodyDetailScreen extends StatefulWidget {
  final Employee people;
  final Body finalBody;
  BodyDetailScreen({@required this.people, this.finalBody});

  //widget.people.sex
  @override
  _BodyDetailScreenState createState() => _BodyDetailScreenState();
}

class _BodyDetailScreenState extends State<BodyDetailScreen> {
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  final formKey = new GlobalKey<FormState>();

  String height; //0
  String neck; //1
  String bicepsL; //2
  String chest; //3
  String forearmL; //4
  String waist; //5
  String legL; //6
  String calfL; //7
  String weight; //8
  String shoulders; //9
  String bicepsR; //10
  String abs; //11
  String forearmR; //12
  String glutes; //13
  String legR; //14
  String calfR; //15

  @override
  Widget build(BuildContext context) {
    final body = widget.people.sex == '1' ? bodyPartFemale : bodyPartMale;
    return Material(
      color: Theme.of(context).primaryColor,
      child: Padding(
          padding: EdgeInsets.only(top: 40.0),
          child: Column(children: <Widget>[
            IconButton(
              icon: Icon(
                FontAwesomeIcons.times,
                color: Colors.white,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: Container(
                  child: SingleChildScrollView(
                    child: Column(children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 22.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            IconButton(
                              onPressed: () => {},
                              icon: Image.asset(
                                'assets/Stylus/csv.png',
                                color: Colors.black,
                              ),
                              iconSize: 65,
                            ),
                            IconButton(
                              onPressed: () => {},
                              icon: Image.asset(
                                'assets/Stylus/pdf.png',
                                color: Colors.black,
                              ),
                              iconSize: 65,
                            ),
                            IconButton(
                              onPressed: () => print(widget.people.firstName),
                              icon: Image.asset(
                                'assets/Stylus/edit.png',
                                color: Colors.black,
                              ),
                              iconSize: 65,
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 30),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Center(
                                child: Column(
                                  children: <Widget>[
                                    Card(
                                      child: ListTile(
                                        leading: Image.asset(body[0].imagePath,
                                            width: 50, height: 50),
                                        title: Align(
                                            child: Text(
                                          body[0].name,
                                          style: TextStyle(
                                              fontFamily: 'Lobster',
                                              fontSize: 25),
                                        )),
                                        dense: true,
                                        subtitle: Align(
                                            child: Text(
                                          widget.people.height,
                                          style: TextStyle(fontSize: 20),
                                        )),
                                      ),
                                    ),
                                    Card(
                                      child: ListTile(
                                        leading: Image.asset(body[1].imagePath,
                                            width: 50, height: 50),
                                        title: Align(
                                            child: Text(
                                          body[1].name,
                                          style: TextStyle(
                                              fontFamily: 'Lobster',
                                              fontSize: 25),
                                        )),
                                        dense: true,
                                        subtitle: Align(
                                            child: Text(
                                          widget.people.neck,
                                          style: TextStyle(fontSize: 20),
                                        )),
                                      ),
                                    ),
                                    Card(
                                      child: ListTile(
                                        leading: Image.asset(body[2].imagePath,
                                            width: 50, height: 50),
                                        title: Align(
                                            child: Text(
                                          body[2].name,
                                          style: TextStyle(
                                              fontFamily: 'Lobster',
                                              fontSize: 25),
                                        )),
                                        dense: true,
                                        subtitle: Align(
                                            child: Text(
                                          widget.people.bicepsL,
                                          style: TextStyle(fontSize: 20),
                                        )),
                                      ),
                                    ),
                                    Card(
                                      child: ListTile(
                                        leading: Image.asset(body[3].imagePath,
                                            width: 50, height: 50),
                                        title: Align(
                                            child: Text(
                                          body[3].name,
                                          style: TextStyle(
                                              fontFamily: 'Lobster',
                                              fontSize: 25),
                                        )),
                                        dense: true,
                                        subtitle: Align(
                                            child: Text(
                                          widget.people.chest,
                                          style: TextStyle(fontSize: 20),
                                        )),
                                      ),
                                    ),
                                    Card(
                                      child: ListTile(
                                        leading: Image.asset(body[4].imagePath,
                                            width: 50, height: 50),
                                        title: Align(
                                            child: Text(
                                          body[4].name,
                                          style: TextStyle(
                                              fontFamily: 'Lobster',
                                              fontSize: 25),
                                        )),
                                        dense: true,
                                        subtitle: Align(
                                            child: Text(
                                          widget.people.forearmL,
                                          style: TextStyle(fontSize: 20),
                                        )),
                                      ),
                                    ),
                                    Card(
                                      child: ListTile(
                                        leading: Image.asset(body[5].imagePath,
                                            width: 50, height: 50),
                                        title: Align(
                                            child: Text(
                                          body[5].name,
                                          style: TextStyle(
                                              fontFamily: 'Lobster',
                                              fontSize: 25),
                                        )),
                                        dense: true,
                                        subtitle: Align(
                                            child: Text(
                                          widget.people.waist,
                                          style: TextStyle(fontSize: 20),
                                        )),
                                      ),
                                    ),
                                    Card(
                                      child: ListTile(
                                        leading: Image.asset(body[6].imagePath,
                                            width: 50, height: 50),
                                        title: Align(
                                            child: Text(
                                          body[6].name,
                                          style: TextStyle(
                                              fontFamily: 'Lobster',
                                              fontSize: 25),
                                        )),
                                        dense: true,
                                        subtitle: Align(
                                            child: Text(
                                          widget.people.legL,
                                          style: TextStyle(fontSize: 20),
                                        )),
                                      ),
                                    ),
                                    Card(
                                      child: ListTile(
                                        leading: Image.asset(body[7].imagePath,
                                            width: 50, height: 50),
                                        title: Align(
                                            child: Text(
                                          body[7].name,
                                          style: TextStyle(
                                              fontFamily: 'Lobster',
                                              fontSize: 25),
                                        )),
                                        dense: true,
                                        subtitle: Align(
                                            child: Text(
                                          widget.people.calfL,
                                          style: TextStyle(fontSize: 20),
                                        )),
                                      ),
                                    ),
                                    Card(
                                      child: ListTile(
                                        leading: Image.asset(body[8].imagePath,
                                            width: 50, height: 50),
                                        title: Align(
                                            child: Text(
                                          body[8].name,
                                          style: TextStyle(
                                              fontFamily: 'Lobster',
                                              fontSize: 25),
                                        )),
                                        dense: true,
                                        subtitle: Align(
                                            child: Text(
                                          widget.people.weight,
                                          style: TextStyle(fontSize: 20),
                                        )),
                                      ),
                                    ),
                                    Card(
                                      child: ListTile(
                                        leading: Image.asset(body[9].imagePath,
                                            width: 50, height: 50),
                                        title: Align(
                                            child: Text(
                                          body[9].name,
                                          style: TextStyle(
                                              fontFamily: 'Lobster',
                                              fontSize: 25),
                                        )),
                                        dense: true,
                                        subtitle: Align(
                                            child: Text(
                                          widget.people.shoulders,
                                          style: TextStyle(fontSize: 20),
                                        )),
                                      ),
                                    ),
                                    Card(
                                      child: ListTile(
                                        leading: Image.asset(body[10].imagePath,
                                            width: 50, height: 50),
                                        title: Align(
                                            child: Text(
                                          body[10].name,
                                          style: TextStyle(
                                              fontFamily: 'Lobster',
                                              fontSize: 25),
                                        )),
                                        dense: true,
                                        subtitle: Align(
                                            child: Text(
                                          widget.people.bicepsR,
                                          style: TextStyle(fontSize: 20),
                                        )),
                                      ),
                                    ),
                                    Card(
                                      child: ListTile(
                                        leading: Image.asset(body[11].imagePath,
                                            width: 50, height: 50),
                                        title: Align(
                                            child: Text(
                                          body[11].name,
                                          style: TextStyle(
                                              fontFamily: 'Lobster',
                                              fontSize: 25),
                                        )),
                                        dense: true,
                                        subtitle: Align(
                                            child: Text(
                                          widget.people.abs,
                                          style: TextStyle(fontSize: 20),
                                        )),
                                      ),
                                    ),
                                    Card(
                                      child: ListTile(
                                        leading: Image.asset(body[12].imagePath,
                                            width: 50, height: 50),
                                        title: Align(
                                            child: Text(
                                          body[12].name,
                                          style: TextStyle(
                                              fontFamily: 'Lobster',
                                              fontSize: 25),
                                        )),
                                        dense: true,
                                        subtitle: Align(
                                            child: Text(
                                          widget.people.forearmR,
                                          style: TextStyle(fontSize: 20),
                                        )),
                                      ),
                                    ),
                                    Card(
                                      child: ListTile(
                                        leading: Image.asset(body[13].imagePath,
                                            width: 50, height: 50),
                                        title: Align(
                                            child: Text(
                                          body[13].name,
                                          style: TextStyle(
                                              fontFamily: 'Lobster',
                                              fontSize: 25),
                                        )),
                                        dense: true,
                                        subtitle: Align(
                                            child: Text(
                                          widget.people.glutes,
                                          style: TextStyle(fontSize: 20),
                                        )),
                                      ),
                                    ),
                                    Card(
                                      child: ListTile(
                                        leading: Image.asset(body[14].imagePath,
                                            width: 50, height: 50),
                                        title: Align(
                                            child: Text(
                                          body[14].name,
                                          style: TextStyle(
                                              fontFamily: 'Lobster',
                                              fontSize: 25),
                                        )),
                                        dense: true,
                                        subtitle: Align(
                                            child: Text(
                                          widget.people.legR,
                                          style: TextStyle(fontSize: 20),
                                        )),
                                      ),
                                    ),
                                    Card(
                                      child: ListTile(
                                        leading: Image.asset(body[15].imagePath,
                                            width: 50, height: 50),
                                        title: Align(
                                            child: Text(
                                          body[15].name,
                                          style: TextStyle(
                                              fontFamily: 'Lobster',
                                              fontSize: 25),
                                        )),
                                        dense: true,
                                        subtitle: Align(
                                            child: Text(
                                          widget.people.calfR,
                                          style: TextStyle(fontSize: 20),
                                        )),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ))
                    ]),
                  ),
                ),
              ),
            )
          ])),
    );
  }
}
