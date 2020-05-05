import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:gsfit/screens/appointments_page.dart';

import 'package:gsfit/screens/auth_page.dart';
import 'package:gsfit/screens/newPerson_page.dart';
import 'package:gsfit/screens/main_page.dart';
import 'utils/class_builder.dart';

Color mainColor = Color.fromRGBO(162, 62, 72, 1.0);
Color startingColor = Color.fromRGBO(196, 40, 71, 1.0);
void main() {
  ClassBuilder.registerClasses();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: mainColor,
      ),
      home: MainWidget(),
    );
  }
}

class MainWidget extends StatefulWidget {
  MainWidget({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> with TickerProviderStateMixin {
  KFDrawerController _drawerController;

  int selectedMenuIndex = 0;
  @override
  void initState() {
    super.initState();

    _drawerController = KFDrawerController(
      initialPage: ClassBuilder.fromString('MainPage'),
      items: [
        KFDrawerItem.initWithPage(
          text: Text('Alunos',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontFamily: 'RobotoMono',
                  fontWeight: FontWeight.bold)),
          icon: Icon(
            FontAwesomeIcons.walking,
            color: Colors.black,
            size: 40,
          ),
          page: MainPage(),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'Novo Aluno',
            style: TextStyle(
                color: Colors.black.withOpacity(0.7),
                fontSize: 20.0,
                fontFamily: 'RobotoMono',
                fontWeight: FontWeight.bold),
          ),
          icon: Icon(
            FontAwesomeIcons.pen,
            color: Colors.black,
            size: 30,
          ),
          page: NewPersonPage(),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'Compromissos',
            style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontFamily: 'RobotoMono',
                fontWeight: FontWeight.bold),
          ),
          icon: Icon(FontAwesomeIcons.calendarCheck, color: Colors.black,size: 30,),
          page: AppointmentsPage(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: KFDrawer(
        controller: _drawerController,
        header: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            width: MediaQuery.of(context).size.width * 0.6,
            child: Image.asset(
              'assets/gsfit_teste.png',
              height: 155,
              width: 155,
              alignment: Alignment.centerLeft,
            ),
          ),
        ),
        footer: KFDrawerItem(
          text: Text(
            'SIGN IN',
            style: TextStyle(color: Colors.white),
          ),
          icon: Icon(
            Icons.input,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).push(CupertinoPageRoute(
              fullscreenDialog: true,
              builder: (BuildContext context) {
                return AuthPage();
              },
            ));
          },
        ),
        decoration: BoxDecoration(color: mainColor.withOpacity(0.015)),
      ),
    );
  }
}
