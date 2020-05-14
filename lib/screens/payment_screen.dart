import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gsfit/models/bodyPart.dart';
import 'package:gsfit/models/employee.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class PaymentScreen extends StatefulWidget {
  final Employee people;
  PaymentScreen({@required this.people});

  //widget.people.sex
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  final formKey = new GlobalKey<FormState>();

  String height; //0
  String neck; //1
  String bicepsL; //2
  String chest; //3
  String forearmL; //4
  String waist; //5
  String legL; //6
  String calfL; //7
  String weight; //8
  String shoulders; //9
  String bicepsR; //10
  String abs; //11
  String forearmR; //12
  String glutes; //13
  String legR; //14
  String calfR; //15
  bool toggleValue = false;

  Widget buildButton(Function teste) {
    return Material(
      elevation: 10,
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(30.0),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 1000),
        height: 57.0,
        width: 140.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: toggleValue ? Color(0xff60d394) : Color(0xffee6055),
        ),
        child: Stack(
          children: <Widget>[
            AnimatedPositioned(
              duration: Duration(milliseconds: 1000),
              curve: Curves.easeIn,
              top: 3.0,
              left: toggleValue ? 60.0 : 0.0,
              right: toggleValue ? 0.0 : 60.0,
              child: InkWell(
                onTap: () {
                  toggleButton();
                  teste();
                },
                child: AnimatedSwitcher(
                  duration: Duration(milliseconds: 1000),
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                    return RotationTransition(
                      child: child,
                      turns: animation,
                    );
                  },
                  child: toggleValue
                      ? Image.asset(
                          'assets/Custom/pago.png',
                          height: 40,
                          width: 40,
                        )
                      : Image.asset(
                          'assets/Custom/nao_pago.png',
                          height: 48,
                          width: 48,
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  toggleButton() {
    setState(() {
      toggleValue = !toggleValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color:Color(0xffb85e60),
      child: Padding(
          padding: EdgeInsets.only(top: 40.0),
          child: Column(children: <Widget>[
            IconButton(
              icon: Icon(
                FontAwesomeIcons.times,
                color: Colors.white,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: Container(
                  child: SingleChildScrollView(
                    child: Column(children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 22.0),
                      ),
                      SizedBox(height: 30),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Center(
                                child: Column(
                                  children: <Widget>[
                                    Card(
                                      child: ListTile(
                                        leading:
                                            buildButton(() => print('Colee')),
                                        title: Align(
                                            child: Text(
                                          'Janeiro',
                                          style: TextStyle(
                                              fontFamily: 'Lobster',
                                              fontSize: 25),
                                        )),
                                        dense: true,
                                        subtitle: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Align(
                                              child: Text(
                                                toggleValue
                                                    ? 'Pago - ${dataFormatada()}'
                                                    : 'Pendente',
                                                style: TextStyle(fontSize: 15),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Card(
                                      child: ListTile(
                                        leading:
                                            buildButton(() => print('Colee')),
                                        title: Align(
                                            child: Text(
                                          'Fevereiro',
                                          style: TextStyle(
                                              fontFamily: 'Lobster',
                                              fontSize: 25),
                                        )),
                                        dense: true,
                                        subtitle: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Align(
                                              child: Text(
                                                toggleValue
                                                    ? 'Pago - ${dataFormatada()}'
                                                    : 'Pendente',
                                                style: TextStyle(fontSize: 15),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Card(
                                      child: ListTile(
                                        leading:
                                            buildButton(() => print('Colee')),
                                        title: Align(
                                            child: Text(
                                          'Março',
                                          style: TextStyle(
                                              fontFamily: 'Lobster',
                                              fontSize: 25),
                                        )),
                                        dense: true,
                                        subtitle: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Align(
                                              child: Text(
                                                toggleValue
                                                    ? 'Pago - ${dataFormatada()}'
                                                    : 'Pendente',
                                                style: TextStyle(fontSize: 15),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Card(
                                      child: ListTile(
                                        leading:
                                            buildButton(() => print('Colee')),
                                        title: Align(
                                            child: Text(
                                          'Abril',
                                          style: TextStyle(
                                              fontFamily: 'Lobster',
                                              fontSize: 25),
                                        )),
                                        dense: true,
                                        subtitle: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Align(
                                              child: Text(
                                                toggleValue
                                                    ? 'Pago - ${dataFormatada()}'
                                                    : 'Pendente',
                                                style: TextStyle(fontSize: 15),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Card(
                                      child: ListTile(
                                        leading:
                                            buildButton(() => print('Colee')),
                                        title: Align(
                                            child: Text(
                                          'Maio',
                                          style: TextStyle(
                                              fontFamily: 'Lobster',
                                              fontSize: 25),
                                        )),
                                        dense: true,
                                        subtitle: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Align(
                                              child: Text(
                                                toggleValue
                                                    ? 'Pago - ${dataFormatada()}'
                                                    : 'Pendente',
                                                style: TextStyle(fontSize: 15),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Card(
                                      child: ListTile(
                                        leading:
                                            buildButton(() => print('Colee')),
                                        title: Align(
                                            child: Text(
                                          'Junho',
                                          style: TextStyle(
                                              fontFamily: 'Lobster',
                                              fontSize: 25),
                                        )),
                                        dense: true,
                                        subtitle: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Align(
                                              child: Text(
                                                toggleValue
                                                    ? 'Pago - ${dataFormatada()}'
                                                    : 'Pendente',
                                                style: TextStyle(fontSize: 15),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Card(
                                      child: ListTile(
                                        leading:
                                            buildButton(() => print('Colee')),
                                        title: Align(
                                            child: Text(
                                          'Julho',
                                          style: TextStyle(
                                              fontFamily: 'Lobster',
                                              fontSize: 25),
                                        )),
                                        dense: true,
                                        subtitle: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Align(
                                              child: Text(
                                                toggleValue
                                                    ? toggleValue
                                                        ? 'Pago - ${dataFormatada()}'
                                                        : 'Pendente'
                                                    : 'Pendente',
                                                style: TextStyle(fontSize: 15),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Card(
                                      child: ListTile(
                                        leading:
                                            buildButton(() => print('Colee')),
                                        title: Align(
                                            child: Text(
                                          'Agosto',
                                          style: TextStyle(
                                              fontFamily: 'Lobster',
                                              fontSize: 25),
                                        )),
                                        dense: true,
                                        subtitle: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Align(
                                              child: Text(
                                                toggleValue
                                                    ? 'Pago - ${dataFormatada()}'
                                                    : 'Pendente',
                                                style: TextStyle(fontSize: 15),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Card(
                                      child: ListTile(
                                        leading:
                                            buildButton(() => print('Colee')),
                                        title: Align(
                                            child: Text(
                                          'Setembro',
                                          style: TextStyle(
                                              fontFamily: 'Lobster',
                                              fontSize: 25),
                                        )),
                                        dense: true,
                                        subtitle: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Align(
                                              child: Text(
                                                toggleValue
                                                    ? 'Pago - ${dataFormatada()}'
                                                    : 'Pendente',
                                                style: TextStyle(fontSize: 15),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Card(
                                      child: ListTile(
                                        leading:
                                            buildButton(() => print('Colee')),
                                        title: Align(
                                            child: Text(
                                          'Outubro',
                                          style: TextStyle(
                                              fontFamily: 'Lobster',
                                              fontSize: 25),
                                        )),
                                        dense: true,
                                        subtitle: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Align(
                                              child: Text(
                                                toggleValue
                                                    ? 'Pago - ${dataFormatada()}'
                                                    : 'Pendente',
                                                style: TextStyle(fontSize: 15),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Card(
                                      child: ListTile(
                                        leading:
                                            buildButton(() => print('Colee')),
                                        title: Align(
                                            child: Text(
                                          'Novembro',
                                          style: TextStyle(
                                              fontFamily: 'Lobster',
                                              fontSize: 25),
                                        )),
                                        dense: true,
                                        subtitle: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Align(
                                              child: Text(
                                                toggleValue
                                                    ? 'Pago - ${dataFormatada()}'
                                                    : 'Pendente',
                                                style: TextStyle(fontSize: 15),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Card(
                                      child: ListTile(
                                        leading:
                                            buildButton(() => print('Colee')),
                                        title: Align(
                                            child: Text(
                                          'Dezembro',
                                          style: TextStyle(
                                              fontFamily: 'Lobster',
                                              fontSize: 25),
                                        )),
                                        dense: true,
                                        subtitle: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Align(
                                              child: Text(
                                                toggleValue
                                                    ? 'Pago - ${dataFormatada()}'
                                                    : 'Pendente',
                                                style: TextStyle(fontSize: 15),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ))
                    ]),
                  ),
                ),
              ),
            )
          ])),
    );
  }

  String dataFormatada() {
    var agora = DateTime.now();
    initializeDateFormatting("pt_BR", null);
    var formatador = new DateFormat.MMMMd("pt_BR");

    return formatador.format(agora);
  }
}
