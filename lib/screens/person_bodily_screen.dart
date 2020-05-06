import 'package:flutter/material.dart';
import 'package:gsfit/models/employee.dart';

class PeopleBodilyScreen extends StatelessWidget {
  final Employee people;
  PeopleBodilyScreen({@required this.people});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Stack(alignment: Alignment.center, children: <Widget>[Column(
          children: <Widget>[
            Text('tsete')
          ],
        )]));
  }
}
