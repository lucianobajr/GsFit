import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gsfit/models/body.dart';
import 'package:gsfit/models/employee.dart';

class Body extends StatefulWidget {
  final Employee people;
  //widget.people.sex

  Body({@required this.people});

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  final formKey = new GlobalKey<FormState>();
  
  String height;
  String neck;
  String bicepsL;
  String chest;
  String forearmL;
  String waist;
  String legL;
  String calfL;
  String weight;
  String shoulders;
  String bicepsR;
  String abs;
  String forearmR;
  String glutes;
  String legR;
  String calfR;


  @override
  Widget build(BuildContext context) {
    //final body = widget.people.sex == '1' ? bodyPartFemale : bodyPartMale;
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
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24.0, vertical: 15.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20.0)),
                            padding: EdgeInsets.symmetric(horizontal: 12.0),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Form(
                            key: formKey,
                            child: Column(
                              children: [
                                TextFormField(
                                  autofocus: false,
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Theme.of(context)
                                                  .primaryColor),
                                          borderRadius:
                                              BorderRadius.circular(20.0)),
                                      filled: true,
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black),
                                          borderRadius:
                                              BorderRadius.circular(20.0)),
                                      labelText: 'Primeiro Nome',
                                      labelStyle: TextStyle(
                                          color:
                                              Theme.of(context).primaryColor),
                                      icon: Icon(
                                        FontAwesomeIcons.signature,
                                        color: Theme.of(context).primaryColor,
                                      )),
                                  validator: (val) => val.length == 0
                                      ? "Digite seu nome"
                                      : null,
                                  //onSaved: (val) => this.firstname = val,
                                  cursorColor: Theme.of(context).primaryColor,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'RobotoMonoLight',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 10),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ])),
    );
  }
}
