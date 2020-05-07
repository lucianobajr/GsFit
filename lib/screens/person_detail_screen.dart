import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gsfit/models/employee.dart';
import 'package:gsfit/database/dbhelper.dart';
import 'package:fancy_dialog/fancy_dialog.dart';
import 'package:gsfit/screens/bodily_screen.dart';
import 'package:gsfit/screens/person_bodily_screen.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:status_alert/status_alert.dart';

class PeopleDetailScreen extends StatelessWidget {
  final Employee people;
  Employee employee = new Employee("", "", "", "", "", "");
  bool value5 = false;
  String firstname;
  String age;
  String adress;
  String description;

  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();

  var db = DBHelper();
  PeopleDetailScreen({@required this.people});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
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
                              InkWell(
                                onLongPress: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          FancyDialog(
                                            gifPath:
                                                'assets/communications.png',
                                            okColor:
                                                Theme.of(context).primaryColor,
                                            cancelColor: Colors.black,
                                            title: "Excluir Aluno",
                                            okFun: () {
                                              _submit(people);
                                              StatusAlert.show(
                                                context,
                                                duration: Duration(seconds: 1),
                                                title: 'Exluir',
                                                subtitle:
                                                    'Aluno Excluido Com Sucesso',
                                                configuration:
                                                    IconConfiguration(
                                                        icon: FontAwesomeIcons
                                                            .check),
                                              );
                                            },
                                            descreption:
                                                "O Aluno selecionado será excluido permanentemente!",
                                          ));
                                },
                                child: Icon(
                                  FontAwesomeIcons.trashAlt,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: screenHeight * 0.31,
                    width: screenWidth,
                    child: Hero(
                      tag: people.firstName,
                      child: Image(
                        image: AssetImage(people.url(
                            int.parse(people.age), int.parse(people.sex))),
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
                    vertical: 50.0,
                  ),
                  child: SingleChildScrollView(
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
                                  size: 25,
                                )
                              ],
                            ),
                            SizedBox(
                              width: 16.0,
                              height: 90,
                            ),
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text('Studio GS  Fit ',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                          )),
                                      Text(people.createIn,
                                          style: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.7),
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
                          height: 5.0,
                        ),
                        Text(people.description,
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.8),
                              fontSize: 16.0,
                              fontWeight: FontWeight.w400,
                            )),
                      ],
                    ),
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
                        child: InkWell(
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
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return BodyDetail(people: null);
                            }));
                          },
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
                padding: EdgeInsets.symmetric(vertical: 13.0, horizontal: 20.0),
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
                        InkWell(
                          onTap: () {
                            var alert = AlertDialog(
                              title: Text("Atualizar Aluno"),
                              content: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Form(
                                      key: formKey,
                                      child: SingleChildScrollView(
                                        child: Column(children: [
                                          TextFormField(
                                            autofocus: false,
                                            keyboardType: TextInputType.text,
                                            decoration: InputDecoration(
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Theme.of(
                                                                    context)
                                                                .primaryColor),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    20.0)),
                                                filled: true,
                                                fillColor: Colors.white,
                                                border: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.black),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0)),
                                                labelText: 'Primeiro Nome',
                                                labelStyle: TextStyle(
                                                    color: Theme.of(context)
                                                        .primaryColor),
                                                icon: Icon(
                                                  FontAwesomeIcons.signature,
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                )),
                                            validator: (val) => val.length == 0
                                                ? "Digite seu nome"
                                                : null,
                                            onSaved: (val) =>
                                                this.firstname = val,
                                            cursorColor:
                                                Theme.of(context).primaryColor,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'RobotoMonoLight',
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          TextFormField(
                                            autofocus: false,
                                            keyboardType: TextInputType.number,
                                            cursorColor:
                                                Theme.of(context).primaryColor,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'RobotoMonoLight',
                                              fontWeight: FontWeight.bold,
                                            ),
                                            decoration: InputDecoration(
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Theme.of(
                                                                    context)
                                                                .primaryColor),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    20.0)),
                                                filled: true,
                                                fillColor: Colors.white,
                                                border: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.black),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0)),
                                                labelText: 'Idade',
                                                labelStyle: TextStyle(
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                ),
                                                icon: Icon(
                                                  FontAwesomeIcons
                                                      .hourglassHalf,
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                )),
                                            validator: (val) => val.length == 0
                                                ? 'Digite sua idade'
                                                : null,
                                            onSaved: (val) => this.age = val,
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          TextFormField(
                                            autofocus: false,
                                            keyboardType: TextInputType.text,
                                            cursorColor:
                                                Theme.of(context).primaryColor,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'RobotoMonoLight',
                                              fontWeight: FontWeight.bold,
                                            ),
                                            decoration: InputDecoration(
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Theme.of(
                                                                    context)
                                                                .primaryColor),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    20.0)),
                                                filled: true,
                                                fillColor: Colors.white,
                                                border: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.black),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0)),
                                                labelText: 'Endereço',
                                                labelStyle: TextStyle(
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                ),
                                                icon: Icon(
                                                  FontAwesomeIcons.mapMarkedAlt,
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                )),
                                            validator: (val) => val.length == 0
                                                ? 'Digite seu endereço'
                                                : null,
                                            onSaved: (val) => this.adress = val,
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          TextFormField(
                                            autofocus: false,
                                            minLines: 5,
                                            maxLines: 6,
                                            keyboardType: TextInputType.text,
                                            cursorColor:
                                                Theme.of(context).primaryColor,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'RobotoMonoLight',
                                              fontWeight: FontWeight.bold,
                                            ),
                                            decoration: InputDecoration(
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Theme.of(
                                                                    context)
                                                                .primaryColor),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    20.0)),
                                                filled: true,
                                                fillColor: Colors.white,
                                                border: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.black),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0)),
                                                labelText: 'Descrição',
                                                labelStyle: TextStyle(
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                ),
                                                icon: Icon(
                                                  FontAwesomeIcons.commentAlt,
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                )),
                                            validator: (val) => val.length == 0
                                                ? 'Digite uma Descrição'
                                                : null,
                                            onSaved: (val) =>
                                                this.description = val,
                                          ),
                                        ]),
                                      ))),
                              actions: <Widget>[
                                FlatButton(
                                    onPressed: () async {
                                      _update();
                                      Navigator.pop(context);
                                      StatusAlert.show(
                                        context,
                                        duration: Duration(seconds: 1),
                                        title: 'Atualizado',
                                        subtitle:
                                            'Aluno Atualizado Com Sucesso',
                                        configuration: IconConfiguration(
                                            icon: FontAwesomeIcons.check),
                                      );
                                    },
                                    child: Text(
                                      'Atualizar',
                                      style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    )),
                                FlatButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: Text("Cancelar",
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .primaryColor)))
                              ],
                            );

                            showDialog(
                                context: context,
                                builder: (_) {
                                  return alert;
                                });
                          },
                          child: Icon(FontAwesomeIcons.edit,
                              color: Colors.black.withOpacity(0.7)),
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

  void _submit(Employee employee) {
    var dbHelper = DBHelper();
    dbHelper.deletePerson(employee);
  }

  void _update() {
    if (this.formKey.currentState.validate()) {
      formKey.currentState.save();
    } else {
      return null;
    }
    var employee = Employee(
      firstname,
      age,
      adress,
      people.sex,
      description,
      dataFormatada(),
    );

    var dbHelper = DBHelper();
    dbHelper.updatePerson(people, employee);
  }

  String dataFormatada() {
    var agora = DateTime.now();
    initializeDateFormatting("pt_BR", null);
    var formatador = new DateFormat.yMMMd("pt_BR");

    return formatador.format(agora);
  }
}
