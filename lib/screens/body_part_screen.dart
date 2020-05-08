import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gsfit/models/body.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Align(
                  child: IconButton(
                    icon: Icon(
                      FontAwesomeIcons.times,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "${dataFormatada()}",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                    color: Colors.white),
              ),
              Text(
                "Avaliação Física",
                style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 20,
                    color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String dataFormatada() {
    var agora = DateTime.now();
    initializeDateFormatting("pt_BR", null);
    var formatador = new DateFormat.yMMMd("pt_BR");

    return formatador.format(agora);
  }
}
