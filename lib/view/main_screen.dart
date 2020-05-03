import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gsfit/view/person_detail_screen.dart';

class Peoples {
  String name;
  int age;
  String adress;
  bool isFemale;
  String imageUrl;
  Color backgroungColor;

  Peoples(
      {this.name,
      this.age,
      this.adress,
      this.isFemale,
      this.imageUrl,
      this.backgroungColor});
}

class MainScreen extends StatefulWidget {
  final Function menuCallback;
  MainScreen({@required this.menuCallback});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectPeoplesIconIndex = 0;

  final List<Peoples> man = [
    Peoples(
      name: 'Guilherme',
      age: 19,
      adress: '7.8 km',
      isFemale: false,
      imageUrl:'assets/images/adolescence-male.png',
      backgroungColor: Color(0xffa54657),
    ),
    Peoples(
      name: 'Bordoni',
      age: 20,
      adress: '20 km',
      isFemale: false,
      imageUrl: 'assets/images/adult-male.png',
      backgroungColor: Color.fromRGBO(237, 213, 216, 1.0),
    ),
  ];

  final List<Peoples> woman = [
    Peoples(
      name: 'Sola',
      age: 20,
      adress: '3.6 km',
      isFemale: true,
      imageUrl: 'assets/images/adolescence-female.png',
      backgroungColor: Color.fromRGBO(203, 213, 216, 1.0),
    ),
    Peoples(
      name: 'Sola',
      age: 20,
      adress: '3.6 km',
      isFemale: true,
      imageUrl: 'assets/images/adult-female.png',
      backgroungColor: Color.fromRGBO(203, 213, 216, 1.0),
    ),
  ];

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
                  //InkWell(
                  /*child:*/ Icon(
                    FontAwesomeIcons.bars,
                  ),
                  //onTap: widget.menuCallback,
                  //),
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
                              Icon(FontAwesomeIcons.search, color: Colors.grey),
                              Expanded(
                                child: TextField(
                                  style: TextStyle(fontSize: 18.0),
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide.none),
                                      hintText: 'Digite o nome de um Aluno'),
                                ),
                              ),
                              Icon(FontAwesomeIcons.filter, color: Colors.grey),
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
                        child: ListView.builder(
                            padding: EdgeInsets.only(top: 10.0),
                            itemCount: selectPeoplesIconIndex == 1
                                ? woman.length
                                : man.length,
                            itemBuilder: (context, index) {
                              final people = selectPeoplesIconIndex == 1
                                  ? woman[index]
                                  : man[index];

                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return PeopleDetailScreen(
                                        people: people); //mudar
                                  }));
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      bottom: 10.0, right: 20.0, left: 20.0),
                                  child: Stack(
                                    alignment: Alignment.centerLeft,
                                    children: <Widget>[
                                      Material(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        elevation: 4.0,
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20.0, vertical: 20.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              SizedBox(
                                                width: deviceWidth * 0.4,
                                              ),
                                              Flexible(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: <Widget>[
                                                        Text(people.name,
                                                            style: TextStyle(
                                                                fontSize: 26.0,
                                                                color: Theme.of(
                                                                        context)
                                                                    .primaryColor,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold)),
                                                        Icon(
                                                          people.isFemale
                                                              ? FontAwesomeIcons
                                                                  .venus
                                                              : FontAwesomeIcons
                                                                  .mars,
                                                          color: Colors.grey,
                                                        )
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      width: 10.0,
                                                    ),
                                                    SizedBox(
                                                      width: 10.0,
                                                    ),
                                                    Text(
                                                        '${people.age} anos',
                                                        style: TextStyle(
                                                            color: Colors.grey,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600)),
                                                    SizedBox(
                                                      width: 10.0,
                                                    ),
                                                    Row(
                                                      children: <Widget>[
                                                        Icon(
                                                          FontAwesomeIcons
                                                              .mapMarkerAlt,
                                                          color:
                                                              Theme.of(context)
                                                                  .primaryColor,
                                                          size: 16.0,
                                                        ),
                                                        SizedBox(
                                                          width: 6.0,
                                                        ),
                                                        Text(
                                                            'Endereço: ${people.adress}',
                                                            style: TextStyle(
                                                                fontSize: 16.0,
                                                                color: Theme.of(
                                                                        context)
                                                                    .primaryColor,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400)),
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
                                                color:  Color(0xffa54657),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        20.0)),
                                            height: 180.0,
                                            width: deviceWidth * 0.4,
                                          ),
                                          Image(
                                            image: AssetImage(people.imageUrl),
                                            height: 220.0,
                                            width: deviceWidth * 0.4,
                                          )
                                        ],
                                        alignment: Alignment.center,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
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
