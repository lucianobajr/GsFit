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
  int selectPeopleIconIndex = 0;
  final TextEditingController _name = new TextEditingController();
  final TextEditingController _age = new TextEditingController();
  final TextEditingController _adress = new TextEditingController();
  int index;

  var db = new DbHelper();
  //final List<People> _peopleList = <People>[];

  @override
  void initState() {
    super.initState();
  }

  List<IconData> peopleIcons = [
    FontAwesomeIcons.male,
    FontAwesomeIcons.female,
  ];

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
                        color: Theme.of(context).primaryColor.withOpacity(0.4),
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
          Column(
            children: <Widget>[
              SizedBox(height: 10),
              TextField(
                autofocus: true,
                keyboardType: TextInputType.number,
                controller: _age,
                
                cursorColor: Color.fromARGB(200, 204, 41, 68),
                style: TextStyle(color: Color.fromARGB(200, 204, 41, 68)),
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  filled: true,
                  fillColor: Color.fromARGB(255, 230, 172, 182),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(200, 204, 41, 68),
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  labelText: "Idade",
                  labelStyle:
                      TextStyle(color: Color.fromARGB(200, 204, 41, 68)),
                  hintText: '42',
                  hintStyle: TextStyle(
                      fontStyle: FontStyle.italic, color: Colors.white),
                  icon: Icon(
                    Icons.person_outline,
                    color: Color.fromARGB(200, 204, 41, 68),
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                autofocus: true,
                controller: _adress,
                keyboardType: TextInputType.number,
                cursorColor: Color.fromARGB(200, 204, 41, 68),
                style: TextStyle(color: Color.fromARGB(200, 204, 41, 68)),
                decoration: InputDecoration(
                  helperStyle: TextStyle(color: Colors.white),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  filled: true,
                  fillColor: Color.fromARGB(255, 230, 172, 182),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(200, 204, 41, 68),
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  labelText: "Altura (m)",
                  labelStyle:
                      TextStyle(color: Color.fromARGB(200, 204, 41, 68)),
                  hintText: '1.70',
                  hintStyle: TextStyle(
                      fontStyle: FontStyle.italic, color: Colors.white),
                  icon: Icon(Icons.insert_chart,
                      color: Color.fromARGB(200, 204, 41, 68)),
                ),

              ),
              SizedBox(height: 10),
              TextField(
                controller: _name,
                autofocus: true,
                keyboardType: TextInputType.number,
                cursorColor: Color.fromARGB(200, 204, 41, 68),
                style: TextStyle(color: Color.fromARGB(200, 204, 41, 68)),
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  filled: true,
                  fillColor: Color.fromARGB(255, 230, 172, 182),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(200, 204, 41, 68),
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  labelText: "Peso (kg)",
                  labelStyle:
                      TextStyle(color: Color.fromARGB(200, 204, 41, 68)),
                  hintText: '89.5',
                  hintStyle: TextStyle(
                      fontStyle: FontStyle.italic, color: Colors.white),
                  icon: Icon(
                    Icons.fastfood,
                    color: Color.fromARGB(200, 204, 41, 68),
                  ),
                ),
              ),
              Container(
                          alignment: Alignment.center,
                          child: RaisedButton(
                            onPressed: () =>seeInfos(),
                            color: Color.fromARGB(200, 204, 41, 68),
                            child: Text('Calcular'),
                            textColor: Colors.white,
                          ),
                        ),
            ],
          ),
        ],
      ),
    );
  }

  void seeInfos(){
    print(_age.text);
  }
}
