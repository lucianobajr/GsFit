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
              SizedBox(
                height: 10,
              ),
              ListTile(
                title: Text(
                  "${dataFormatada()}",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Colors.white),
                ),
                subtitle: Text(
                  "Avaliação Física",
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 20,
                      color: Colors.white),
                ),
              ),
              ListView.builder(
                padding: EdgeInsets.only(left: 24.0, top: 8.0),
                scrollDirection: Axis.horizontal,
                itemCount: bodyPart.length,
                itemBuilder: (context, index) {
                  return Column(children: <Widget>[
                    ListTile(
                      leading: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Color.fromRGBO(255, 255, 255, 0.4),
                        ),
                        padding: const EdgeInsets.all(6),
                        child: Image.asset(
                          bodyPart[index].imagePath,
                          width: 40,
                          height: 40,
                          color: Colors.white,
                        ),
                      ),
                      title: Text(
                        bodyPart[index].name,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text('tests'),
                    ),
                    SizedBox(height: 30)
                  ]);
                },
              )
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
