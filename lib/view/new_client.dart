import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:gsfit/models/people.dart';
import 'package:gsfit/database/config.dart';

class NewClient extends StatefulWidget {
  final Function menuCallback;
  NewClient({@required this.menuCallback});

  @override
  _NewClientState createState() => _NewClientState();
}

class _NewClientState extends State<NewClient> {
  int selectPeopleIconIndex = null;
  final TextEditingController _name = new TextEditingController();
  final TextEditingController _age = new TextEditingController();
  final TextEditingController _adress = new TextEditingController();
  int index = 0;
  String teste;

  var db = new DbHelper();
  //final List<People> _peopleList = <People>[];

  @override
  void initState() {
    super.initState();
  }

  List<String> peopleList = [
    'Homem',
    'Mulher',
  ];

  List<IconData> peopleIcons = [
    FontAwesomeIcons.mars,
    FontAwesomeIcons.venus,
  ];

  Widget buildPeopleIcon(int index) {
    return Padding(
      padding: const EdgeInsets.only(left: 60.0, right: 30.0),
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
                  size: 20.0,
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
        child: Column(children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                // InkWell(
                /* child:*/ Icon(
                  FontAwesomeIcons.bars,
                ),
                // onTap: widget.menuCallback,
                //),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Cadastro',
                        style: TextStyle(
                          fontFamily: 'Ultra',
                          fontSize: 25.0,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(FontAwesomeIcons.addressCard,
                    size: 40, color: Theme.of(context).primaryColor),
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
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: <Widget>[
                              SizedBox(height: 10),
                              TextField(
                                autofocus: false,
                                keyboardType: TextInputType.text,
                                controller: _name,
                                cursorColor: Theme.of(context).primaryColor,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'RobotoMonoLight',
                                  fontWeight: FontWeight.bold,
                                ),
                                decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color:
                                                Theme.of(context).primaryColor),
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black),
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                    labelText: 'Nome',
                                    labelStyle: TextStyle(
                                        color: Theme.of(context).primaryColor),
                                    icon: Icon(
                                      FontAwesomeIcons.signature,
                                      color: Theme.of(context).primaryColor,
                                    )),
                              ),
                              SizedBox(height: 10),
                              TextField(
                                autofocus: false,
                                keyboardType: TextInputType.number,
                                controller: _age,
                                cursorColor: Theme.of(context).primaryColor,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'RobotoMonoLight',
                                  fontWeight: FontWeight.bold,
                                ),
                                decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color:
                                                Theme.of(context).primaryColor),
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black),
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                    labelText: 'Idade',
                                    labelStyle: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    icon: Icon(
                                      FontAwesomeIcons.hourglassHalf,
                                      color: Theme.of(context).primaryColor,
                                    )),
                              ),
                              SizedBox(height: 10),
                              TextField(
                                autofocus: false,
                                keyboardType: TextInputType.text,
                                controller: _adress,
                                cursorColor: Theme.of(context).primaryColor,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'RobotoMonoLight',
                                  fontWeight: FontWeight.bold,
                                ),
                                decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color:
                                                Theme.of(context).primaryColor),
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black),
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                    labelText: 'Endereço',
                                    labelStyle: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    icon: Icon(
                                      FontAwesomeIcons.mapMarkedAlt,
                                      color: Theme.of(context).primaryColor,
                                    )),
                              ),
                              SizedBox(
                                height: 35,
                              ),
                              Container(
                                height: 120.0,
                                child: ListView.builder(
                                    padding:
                                        EdgeInsets.only(left: 24.0, top: 8.0),
                                    scrollDirection: Axis.horizontal,
                                    itemCount: peopleList.length,
                                    itemBuilder: (context, index) {
                                      return buildPeopleIcon(index);
                                    }),
                              ),
                              Container(
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 22.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Material(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        elevation: 4.0,
                                        color: Theme.of(context).primaryColor,
                                        child: Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: Icon(
                                            FontAwesomeIcons.heart,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 24.0,
                                      ),
                                      Expanded(
                                        child: InkWell(
                                          child: Material(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            elevation: 4.0,
                                            color:
                                                Theme.of(context).primaryColor,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(20.0),
                                              child: Text(
                                                'Salvar',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18.0,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                          onTap: () => seeInfos(),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                height: 150,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )))
        ]));
  }

  void seeInfos() {
    teste = url(int.parse(this._age.text), selectPeopleIconIndex);
    print(_age.text);
    print(teste);
  }

  String url(int _age, int index) {
    String base = 'assets/images/';

    if (int.parse(this._age.text) < 12) {
      //child
      base = base + 'child-';
    } else if (int.parse(this._age.text) >= 12 &&
        int.parse(this._age.text) < 20) {
      //adolescence
      base = base + 'adolescence-';
    } else if (int.parse(this._age.text) >= 20 &&
        int.parse(this._age.text) < 35) {
      //adult
      base = base + 'adult-';
    } else if (int.parse(this._age.text) >= 35 &&
        int.parse(this._age.text) < 50) {
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
