import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'dart:async';
import 'package:gsfit/models/employee.dart';
import 'package:gsfit/database/dbhelper.dart';
import 'package:gsfit/screens/person_detail_screen.dart';

Future<List<Employee>> fetchEmployeesMaleFromDatabase() async {
  var dbHelper = DBHelper();
  Future<List<Employee>> man = dbHelper.getMale();
  return man;
}

Future<List<Employee>> fetchEmployeesFemaleFromDatabase() async {
  var dbHelper = DBHelper();
  Future<List<Employee>> female = dbHelper.getFemale();
  return female;
}

class MainPage extends KFDrawerContent {
  MainPage({
    Key key,
  });

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectPeoplesIconIndex = 0;
  Future<List<Employee>> man = fetchEmployeesMaleFromDatabase();
  Future<List<Employee>> woman = fetchEmployeesFemaleFromDatabase();

  List<String> peoplesList = [
    'Homens',
    'Mulheres',
  ];

  List<IconData> peopleIcons = [
    FontAwesomeIcons.male,
    FontAwesomeIcons.female,
  ];

  Widget buildPeopleIcon(int index) {
    return Padding(
      padding: const EdgeInsets.only(left: 60.0, right: 30.0),
      child: Column(
        children: <Widget>[
          InkWell(
            onTap: () {
              setState(() {
                selectPeoplesIconIndex = index;
              });
            },
            child: Material(
              color: selectPeoplesIconIndex == index
                  ? Theme.of(context).primaryColor
                  : Colors.white,
              elevation: 8.0,
              borderRadius: BorderRadius.circular(20.0),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Icon(
                  peopleIcons[index],
                  size: 30.0,
                  color: selectPeoplesIconIndex == index
                      ? Colors.white
                      : Theme.of(context).primaryColor,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 12.0,
          ),
          Text(
            peoplesList[index],
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 16.0,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  String formated(int count, int sex) {
    String text;
    if (count == 1 && sex == 0) {
      text = "$count  Aluno Cadastrado";
    } else if (count == 1 && sex == 1) {
      text = "$count  Aluna Cadastrada";
    } else if (count == 0 && sex == 0 || count > 1 && sex == 0) {
      text = "$count  Alunos Cadastrados";
    } else {
      text = "$count  Alunas Cadastradas";
    }

    return text;
  }

  Widget buildCount(int count) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(25.0),
      elevation: 4.5,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(25.0)),
        padding: EdgeInsets.symmetric(horizontal: 12.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                height: 63,
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 10,
                    ),
                    Image.asset(
                      'assets/Custom/pupils.png',
                      width: 48,
                      height: 48,
                      color: Colors.black.withOpacity(0.8),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      formated(count, selectPeoplesIconIndex),
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Lobster',
                        color: Colors.black.withOpacity(0.8),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;

    return Padding(
        padding: EdgeInsets.only(top: 40.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  InkWell(
                    child: Icon(
                      FontAwesomeIcons.bars,
                    ),
                    onTap: widget.onMenuPressed,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Studio GS Fit',
                          style: TextStyle(
                            fontFamily: 'Ultra',
                            fontSize: 25.0,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: <Widget>[
                            Icon(
                              FontAwesomeIcons.mapMarkerAlt,
                              color: Theme.of(context).primaryColor,
                              size: 15,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              'Belo Horizonte,',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 15.0,
                              ),
                            ),
                            Text('Brasil',
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 15.0,
                                )),
                          ],
                        )
                      ],
                    ),
                  ),
                  Icon(FontAwesomeIcons.dumbbell,
                      size: 40, color: Theme.of(context).primaryColor)
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: Theme.of(context).primaryColor.withOpacity(0.06),
                  ),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24.0, vertical: 20.0),
                        // O trem do text
                        child: Container(
                          height: 60.0,
                          child: FutureBuilder<List<Employee>>(
                            future: selectPeoplesIconIndex == 1 ? woman : man,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return buildCount(snapshot.data.length);
                              } else if (snapshot.hasError) {
                                return new Text("${snapshot.error}");
                              }
                              return new Container(
                                alignment: AlignmentDirectional.center,
                                child: new CircularProgressIndicator(),
                              );
                            },
                          ),
                        ),
                      ),
                      Container(
                        height: 120.0,
                        child: ListView.builder(
                            padding: EdgeInsets.only(left: deviceWidth/20 ,top: 8.0),
                            scrollDirection: Axis.horizontal,
                            itemCount: peoplesList.length,
                            itemBuilder: (context, index) {
                              return buildPeopleIcon(index);
                            }),
                      ),
                      Expanded(
                        child: FutureBuilder<List<Employee>>(
                          future: selectPeoplesIconIndex == 1 ? woman : man,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return ListView.builder(
                                  itemCount: snapshot.data.length,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                        onTap: () {
                                          Navigator.push(context,
                                              MaterialPageRoute(
                                                  builder: (context) {
                                            return PeopleDetailScreen(
                                              people: snapshot.data[index],
                                            ); //mudar
                                          }));
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              bottom: 10.0,
                                              right: 20.0,
                                              left: 20.0),
                                          child: Stack(
                                            alignment: Alignment.centerLeft,
                                            children: <Widget>[
                                              Material(
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                                elevation: 4.0,
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 20.0,
                                                      vertical: 20.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: <Widget>[
                                                      SizedBox(
                                                        width:
                                                            deviceWidth * 0.4,
                                                      ),
                                                      Flexible(
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: <Widget>[
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: <
                                                                  Widget>[
                                                                Text(namePeople(snapshot.data[index].firstName),
                                                                    style: TextStyle(
                                                                        fontSize: 18,
                                                                        // snapshot.data[index].firstName.length <
                                                                        //         12
                                                                        //     ? 25.0
                                                                        //     : 18.0
                                                                        color: Theme.of(context)
                                                                            .primaryColor,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        fontFamily:
                                                                            'Lobster')),
                                                                Icon(
                                                                  int.parse(snapshot
                                                                              .data[
                                                                                  index]
                                                                              .sex) ==
                                                                          1
                                                                      ? FontAwesomeIcons
                                                                          .venus
                                                                      : FontAwesomeIcons
                                                                          .mars,
                                                                  color: Colors
                                                                      .black
                                                                      .withOpacity(
                                                                          0.7),
                                                                )
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              width: 20.0,
                                                              height: 10,
                                                            ),
                                                            Text(
                                                                '${snapshot.data[index].age} anos',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400)),
                                                            SizedBox(
                                                              width: 10.0,
                                                              height: 10,
                                                            ),
                                                            Row(
                                                              children: <
                                                                  Widget>[
                                                                Icon(
                                                                  FontAwesomeIcons
                                                                      .mapMarkerAlt,
                                                                  color: Theme.of(
                                                                          context)
                                                                      .primaryColor,
                                                                  size: 16.0,
                                                                ),
                                                                SizedBox(
                                                                  width: 6.0,
                                                                ),
                                                                Text(
                                                                    adressPeople(snapshot
                                                                        .data[
                                                                            index]
                                                                        .adress), //${snapshot.data[index].adress}
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            15,
                                                                        color: Colors
                                                                            .black,
                                                                        fontWeight:
                                                                            FontWeight.w400)),
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Stack(
                                                children: <Widget>[
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        color:
                                                            Color(0xffa54657),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    20.0)),
                                                    height: 180.0,
                                                    width: deviceWidth * 0.4,
                                                  ),
                                                  Image(
                                                    image: AssetImage(snapshot
                                                        .data[index]
                                                        .url(
                                                            int.parse(snapshot
                                                                .data[index]
                                                                .age),
                                                            int.parse(snapshot
                                                                .data[index]
                                                                .sex))),
                                                    height: 220.0,
                                                    width: deviceWidth * 0.4,
                                                  )
                                                ],
                                                alignment: Alignment.center,
                                              ),
                                            ],
                                          ),
                                        ));
                                  });
                            } else if (snapshot.hasError) {
                              return new Text("${snapshot.error}");
                            }
                            return new Container(
                              alignment: AlignmentDirectional.center,
                              child: new CircularProgressIndicator(),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  String adressPeople(String adress) {
    String finalAdress = '';
    final tam = (MediaQuery.of(context).size.width) / 23;
    if (adress.length <= tam) {
      finalAdress = adress;
    } else {
      for (var i = 0; i < tam - 3; i++) {
        finalAdress = finalAdress + adress[i];
      }
      finalAdress = finalAdress + '...';
    }
    return finalAdress;
  }

  String namePeople(String name) {
    String finalName = '';
    final tam = (MediaQuery.of(context).size.width) / 23;
    if (name.length <= tam) {
      finalName = name;
    } else {
      for (var i = 0; i < tam - 3; i++) {
        finalName = finalName + name[i];
      }
      finalName = finalName + '...';
    }
    return finalName;
  }
}
