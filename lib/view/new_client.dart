import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gsfit/main.dart';

class People {
  String name;
  String scientificName;
  double age;
  String distanceToUser;
  bool isFemale;
  String imageUrl;
  Color backgroungColor;

  People(
      {this.name,
      this.scientificName,
      this.age,
      this.distanceToUser,
      this.isFemale,
      this.imageUrl,
      this.backgroungColor});
}

class NewClient extends StatefulWidget {
  final Function menuCallback;
  NewClient({@required this.menuCallback});

  @override
  _NewClientState createState() => _NewClientState();
}

class _NewClientState extends State<NewClient> {
  int selectPeopleIconIndex = 0;

  final List<People> man = [
      People(
      name: 'Guilherme',
      scientificName: 'Abyssinian cat',
      age: 19,
      distanceToUser: '7.8 km',
      isFemale: false,
      imageUrl: 'assets/gato2.png',
      backgroungColor: mainColor.withOpacity(0.5),
    ),
      People(
      name: 'Bordoni',
      scientificName: 'Abyssinian cat',
      age: 20,
      distanceToUser: '20 km',
      isFemale: false,
      imageUrl: 'assets/gato2.png',
      backgroungColor: Color.fromRGBO(237, 213, 216, 1.0),
    ),
  ];

  final List<People> woman = [
    People(
      name: 'Sola',
      scientificName: 'Abyssinian cat',
      age: 2.0,
      distanceToUser: '3.6 km',
      isFemale: true,
      imageUrl: 'assets/gato1.png',
      backgroungColor: Color.fromRGBO(203, 213, 216, 1.0),
    ),
    People(
      name: 'Sola',
      scientificName: 'Abyssinian cat',
      age: 2.0,
      distanceToUser: '3.6 km',
      isFemale: true,
      imageUrl: 'assets/gato1.png',
      backgroungColor: Color.fromRGBO(203, 213, 216, 1.0),
    ),
  ];

  List<String> peopleList = [
    'Homens',
    'Mulheres',
  ];

  List<IconData> peopleIcons = [
    FontAwesomeIcons.male,
    FontAwesomeIcons.female,
  ];

  Widget buildPeopleIcon(int index) {
    return Padding(
      padding: const EdgeInsets.only(left:60.0,right: 30.0),
      child: Column(
        children: <Widget>[
          InkWell(
            onTap: () {
              setState(() {
                selectPeopleIconIndex = index;
              });
            },
            child: Material(
              color: selectPeopleIconIndex == index
                  ? Theme.of(context).primaryColor
                  : Colors.white,
              elevation: 8.0,
              borderRadius: BorderRadius.circular(20.0),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Icon(
                  peopleIcons[index],
                  size: 30.0,
                  color: selectPeopleIconIndex == index
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
            peopleList[index],
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
                    onTap: widget.menuCallback,
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        'Tela 4',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 18.0,
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.4),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Icon(FontAwesomeIcons.mapMarkerAlt,
                              color: Theme.of(context).primaryColor),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            'Ibirité,',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 22.0,
                            ),
                          ),
                          Text('Brazil',
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 22.0,
                              )),
                        ],
                      )
                    ],
                  ),
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
                                  color: Colors.grey),
                              Expanded(
                                child: TextField(
                                  style: TextStyle(fontSize: 18.0),
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide.none),
                                      hintText: 'Teste tela 4'),
                                ),
                              ),
                              Icon(FontAwesomeIcons.filter,
                                  color: Colors.grey),
                            ],
                          ),
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
