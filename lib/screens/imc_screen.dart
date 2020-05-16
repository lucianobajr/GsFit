import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:flutter/material.dart';

class ImcPage extends KFDrawerContent {
  ImcPage({
    Key key,
  });

  @override
  _ImcPageState createState() => _ImcPageState();
}

class _ImcPageState extends State<ImcPage> {
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
                  InkWell(
                    child: Icon(
                      FontAwesomeIcons.bars,
                    ),
                    onTap: widget.onMenuPressed,
                  ),
                ]),
          )
        ]));
  }
}
