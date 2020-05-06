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
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20.0)),
                          padding: EdgeInsets.symmetric(horizontal: 12.0),
                          child: Row(
                            children: <Widget>[
                              Icon(FontAwesomeIcons.search,
                                  color: Colors.black.withOpacity(0.7)),
                              Expanded(
                                child: TextField(
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.black,
                                    fontFamily: 'RobotoMonoLight',
                                    fontWeight: FontWeight.bold,
                                  ),
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide.none),
                                      hintText: 'Digite o nome de um Aluno',
                                      hintStyle: TextStyle(
                                          fontFamily: 'RobotoMonoLigh')),
                                ),
                              ),
                              Icon(FontAwesomeIcons.filter,
                                  color: Colors.black.withOpacity(0.7)),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 120.0,
                        child: ListView.builder(
                            padding: EdgeInsets.only(left: 24.0, top: 8.0),
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
                                                                Text(snapshot.data[index].firstName,
                                                                    style: TextStyle(
                                                                        fontSize: snapshot.data[index].firstName.length <
                                                                                12
                                                                            ? 25.0
                                                                            : 18.0,
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
                                                                    'Endereço', //${snapshot.data[index].adress}
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
}
