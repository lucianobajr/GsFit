import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MenuScreen extends StatefulWidget {
  final Function(int) menuCallback;
  MenuScreen({this.menuCallback});

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  int selectedMenuIndex = 0;

  List<String> menuItems = ['Alunos', 'Novo Aluno', 'Compromissos','Teste'];

  List<IconData> icons = [
    FontAwesomeIcons.walking,
    FontAwesomeIcons.pen,
    FontAwesomeIcons.calendarCheck,
    FontAwesomeIcons.grimace,
  ];

  Widget buildMenuRow(int index) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedMenuIndex = index;
          widget.menuCallback(index);
        });
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 18.0),
        child: Row(
          children: <Widget>[
            Icon(icons[index],
                size: 30,
                color: selectedMenuIndex == index
                    ? Colors.black //mainColor
                    : Colors.black.withOpacity(0.65)), //mainColor.withOpacity(0.65)),
            SizedBox(
              width: 16.0,
            ),
            Text(
              menuItems[index],
              style: TextStyle(
                  color: selectedMenuIndex == index
                      ? Colors.black//mainColor
                      : Colors.black.withOpacity(0.65),//mainColor.withOpacity(0.65),
                  fontSize: 20.0,
                  fontFamily: 'RobotoMono',
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Image.asset(
                      'assets/gsfit_teste.png',
                      height: 155,
                      width: 155,
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: menuItems
                      .asMap()
                      .entries
                      .map((mapEntry) => buildMenuRow(mapEntry.key))
                      .toList(),
                ),
                Row(
                  children: <Widget>[
                    Icon(FontAwesomeIcons.cog,
                        color:Colors.black.withOpacity(0.65)),
                    SizedBox(
                      width: 16.0,
                    ),
                    Text(
                      'Settings   |   Log out',
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.65),
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        decoration: BoxDecoration(
          color:Colors.white
        ),
      ),
    );
  }
}
