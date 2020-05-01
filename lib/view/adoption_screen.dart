import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gsfit/main.dart';
import 'package:gsfit/view/animal_detail_screen.dart';

class Animal {
  String name;
  String scientificName;
  double age;
  String distanceToUser;
  bool isFemale;
  String imageUrl;
  Color backgroungColor;

  Animal(
      {this.name,
      this.scientificName,
      this.age,
      this.distanceToUser,
      this.isFemale,
      this.imageUrl,
      this.backgroungColor});
}

class AdoptionScreen extends StatefulWidget {
  final Function menuCallback;
  AdoptionScreen({@required this.menuCallback});

  @override
  _AdoptionScreenState createState() => _AdoptionScreenState();
}

class _AdoptionScreenState extends State<AdoptionScreen> {
  int selectAnimalIconIndex = 0;

  final List<Animal> man = [
      Animal(
      name: 'Guilherme',
      scientificName: 'Abyssinian cat',
      age: 19,
      distanceToUser: '7.8 km',
      isFemale: false,
      imageUrl: 'assets/gato2.png',
      backgroungColor: mainColor.withOpacity(0.5),
    ),
        Animal(
      name: 'Bordoni',
      scientificName: 'Abyssinian cat',
      age: 20,
      distanceToUser: '20 km',
      isFemale: false,
      imageUrl: 'assets/gato2.png',
      backgroungColor: Color.fromRGBO(237, 213, 216, 1.0),
    ),
  ];

  final List<Animal> animals = [
    Animal(
      name: 'Sola',
      scientificName: 'Abyssinian cat',
      age: 2.0,
      distanceToUser: '3.6 km',
      isFemale: true,
      imageUrl: 'assets/gato1.png',
      backgroungColor: Color.fromRGBO(203, 213, 216, 1.0),
    ),
    Animal(
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
                selectAnimalIconIndex = index;
              });
            },
            child: Material(
              color: selectAnimalIconIndex == index
                  ? Theme.of(context).primaryColor
                  : Colors.white,
              elevation: 8.0,
              borderRadius: BorderRadius.circular(20.0),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Icon(
                  peopleIcons[index],
                  size: 30.0,
                  color: selectAnimalIconIndex == index
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
                    padding: const EdgeInsets.symmetric(vertical:15.0),
                    child: Column(
                      children: <Widget>[
                         Text(
                          'Studio GS Fit',
                          style: TextStyle(
                            fontFamily: 'Ultra',
                            fontSize: 25.0,
                            color:Colors.black,
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
                  Icon(
                    FontAwesomeIcons.dumbbell,
                    size: 40,
                    color: Theme.of(context).primaryColor
                  )
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
                                      hintText: 'Digite o nome de um Aluno'),
                                ),
                              ),
                              Icon(FontAwesomeIcons.filter,
                                  color: Colors.grey),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 120.0,
                        child: ListView.builder(
                            padding: EdgeInsets.only(left: 24.0, top: 8.0),
                            scrollDirection: Axis.horizontal,
                            itemCount: peopleList.length,
                            itemBuilder: (context, index) {
                              return buildPeopleIcon(index);
                            }),
                      ),
                      Expanded(
                        child: ListView.builder(
                            padding: EdgeInsets.only(top: 10.0),
                            itemCount: selectAnimalIconIndex == 1 ? animals.length : man.length,
                            itemBuilder: (context, index) {
                              final animal = selectAnimalIconIndex == 1 ? animals[index] : man[index];

                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return AnimalDetailScreen(animal: animal);
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
                                              horizontal: 20.0,
                                              vertical: 20.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceBetween,
                                            children: <Widget>[
                                              SizedBox(
                                                width: deviceWidth * 0.4,
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
                                                          MainAxisSize.max,
                                                      children: <Widget>[
                                                        Text(animal.name,
                                                            style: TextStyle(
                                                                fontSize:
                                                                    26.0,
                                                                color: Theme.of(
                                                                        context)
                                                                    .primaryColor,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold)),
                                                        Icon(
                                                          animal.isFemale
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
                                                        '${animal.age} years old',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.grey,
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
                                                          color: Theme.of(
                                                                  context)
                                                              .primaryColor,
                                                          size: 16.0,
                                                        ),
                                                        SizedBox(
                                                          width: 6.0,
                                                        ),
                                                        Text(
                                                            'Distance: ${animal.distanceToUser}',
                                                            style: TextStyle(
                                                                fontSize:
                                                                    16.0,
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
                                                color: animal.backgroungColor,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        20.0)),
                                            height: 180.0,
                                            width: deviceWidth * 0.4,
                                          ),
                                          Image(
                                            image:
                                                AssetImage(animal.imageUrl),
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
