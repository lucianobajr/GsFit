import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gsfit/database/dbhelper.dart';
import 'package:gsfit/models/employee.dart';
import 'package:gsfit/models/payment.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:status_alert/status_alert.dart';

class PaymentScreen extends StatefulWidget {
  final Employee people;
  PaymentScreen({@required this.people});

  //widget.people.sex
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class Event {
  final String time;
  final String task;
  final String desc;
  final bool isFinish;

  const Event(this.time, this.task, this.desc, this.isFinish);
}

class _PaymentScreenState extends State<PaymentScreen> {
  Payment peoplePay;
  String getStart;
  String getEnd;
  String january;
  String february;
  String march;
  String april;
  String may;
  String june;
  String july;
  String august;
  String september;
  String october;
  String november;
  String december;
  String dataJanuary;
  String dataFebruary;
  String dataMarch;
  String dataApril;
  String dataMay;
  String dataJune;
  String dataJuly;
  String dataAugust;
  String dataSeptember;
  String dataOctober;
  String dataNovember;
  String dataDecember;

  final scaffoldKey = new GlobalKey<ScaffoldState>();

  final formKey = new GlobalKey<FormState>();

  Widget buildButton(bool toggle) {
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
          color: toggle ? Color(0xff60d394) : Color(0xffee6055),
        ),
        child: Stack(
          children: <Widget>[
            AnimatedPositioned(
              duration: Duration(milliseconds: 1000),
              curve: Curves.easeIn,
              top: 3.0,
              left: toggle ? 60.0 : 0.0,
              right: toggle ? 0.0 : 60.0,
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 1000),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return RotationTransition(
                    child: child,
                    turns: animation,
                  );
                },
                child: toggle
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
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    getStart = widget.people.dataStart;
    getEnd = widget.people.dataEnd;
    january = widget.people.january;
    february = widget.people.february;
    march = widget.people.march;
    april = widget.people.april;
    may = widget.people.may;
    june = widget.people.june;
    july = widget.people.july;
    august = widget.people.august;
    september = widget.people.september;
    october = widget.people.october;
    november = widget.people.november;
    december = widget.people.december;
    dataJanuary = widget.people.dataJanuary;
    dataFebruary = widget.people.dataFebruary;
    dataMarch = widget.people.dataMarch;
    dataApril = widget.people.dataApril;
    dataMay = widget.people.dataMay;
    dataJune = widget.people.dataJune;
    dataJuly = widget.people.dataJuly;
    dataAugust = widget.people.dataAugust;
    dataSeptember = widget.people.dataSeptember;
    dataOctober = widget.people.dataOctober;
    dataNovember = widget.people.dataNovember;
    dataDecember = widget.people.dataDecember;
    return Material(
      color: Color(0xffb85e60),
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
            SizedBox(
              height: 30,
            ),
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Material(
                    elevation: 6.0,
                    borderRadius: BorderRadius.circular(20.0),
                    child: Container(
                      height: 50,
                      width: 330,
                      child: Align(
                        child: InkWell(
                          onTap: () {
                            var alert = AlertDialog(
                              title: Text("Atualizar Data"),
                              content: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Form(
                                      key: formKey,
                                      child: SingleChildScrollView(
                                        child: Column(children: [
                                          TextFormField(
                                            autofocus: false,
                                            keyboardType: TextInputType.text,
                                            decoration: InputDecoration(
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Theme.of(
                                                                    context)
                                                                .primaryColor),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    20.0)),
                                                filled: true,
                                                fillColor: Colors.white,
                                                border: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.black),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0)),
                                                labelText: 'Início',
                                                labelStyle: TextStyle(
                                                    color: Theme.of(context)
                                                        .primaryColor),
                                                icon: Image.asset(
                                                  'assets/Custom/init.png',
                                                  width: 50,
                                                  height: 50,
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                )),
                                            validator: (val) => val.length == 0
                                                ? "Digite a Data de Início"
                                                : null,
                                            onSaved: (val) => getStart = val,
                                            cursorColor:
                                                Theme.of(context).primaryColor,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'RobotoMonoLight',
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          TextFormField(
                                            autofocus: false,
                                            keyboardType: TextInputType.number,
                                            cursorColor:
                                                Theme.of(context).primaryColor,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'RobotoMonoLight',
                                              fontWeight: FontWeight.bold,
                                            ),
                                            decoration: InputDecoration(
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Theme.of(
                                                                    context)
                                                                .primaryColor),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    20.0)),
                                                filled: true,
                                                fillColor: Colors.white,
                                                border: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.black),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0)),
                                                labelText: 'Fim',
                                                labelStyle: TextStyle(
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                ),
                                                icon: Image.asset(
                                                  'assets/Custom/end.png',
                                                  width: 50,
                                                  height: 50,
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                )),
                                            validator: (val) => val.length == 0
                                                ? 'Digite a Data de Fim de Pagamento'
                                                : null,
                                            onSaved: (val) => getEnd = val,
                                          ),
                                        ]),
                                      ))),
                              actions: <Widget>[
                                FlatButton(
                                    onPressed: () async {
                                      _updateData();
                                      Navigator.pop(context);
                                      StatusAlert.show(
                                        context,
                                        duration: Duration(seconds: 1),
                                        title: 'Atualizado',
                                        subtitle: 'Data Atualizado Com Sucesso',
                                        configuration: IconConfiguration(
                                            icon: FontAwesomeIcons.check),
                                      );
                                    },
                                    child: Text(
                                      'Atualizar',
                                      style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    )),
                                FlatButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: Text("Cancelar",
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .primaryColor)))
                              ],
                            );

                            showDialog(
                                context: context,
                                builder: (_) {
                                  return alert;
                                });
                          },
                          child: Text(
                            'Data de Pagamento - De ${widget.people.dataStart} a ${widget.people.dataEnd}',
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
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
                                    InkWell(
                                      onTap: () {
                                        if (january == 'true') {
                                          january = 'false';
                                        } else {
                                          january = 'true';
                                        }

                                        dataJanuary = dataFormatada();

                                        _auxUpdateBody();
                                      },
                                      child: Card(
                                        child: ListTile(
                                          leading: buildButton(toBool(january)),
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
                                                  toBool(january)
                                                      ? 'Pago - ${widget.people.dataJanuary}'
                                                      : 'Pendente',
                                                  style:
                                                      TextStyle(fontSize: 15),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        if (february == 'true') {
                                          february = 'false';
                                        } else {
                                          february = 'true';
                                        }

                                        dataFebruary = dataFormatada();

                                        _auxUpdateBody();
                                      },
                                      child: Card(
                                        child: ListTile(
                                          leading:
                                              buildButton(toBool(february)),
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
                                                  toBool(february)
                                                      ? 'Pago - ${widget.people.dataFebruary}'
                                                      : 'Pendente',
                                                  style:
                                                      TextStyle(fontSize: 15),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        if (march == 'true') {
                                          march = 'false';
                                        } else {
                                          march = 'true';
                                        }

                                        dataMarch = dataFormatada();

                                        _auxUpdateBody();
                                      },
                                      child: Card(
                                        child: ListTile(
                                          leading: buildButton(toBool(march)),
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
                                                  toBool(march)
                                                      ? 'Pago - ${widget.people.dataMarch}'
                                                      : 'Pendente',
                                                  style:
                                                      TextStyle(fontSize: 15),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        if (april == 'true') {
                                          april = 'false';
                                        } else {
                                          april = 'true';
                                        }

                                        dataApril = dataFormatada();

                                        _auxUpdateBody();
                                      },
                                      child: Card(
                                        child: ListTile(
                                          leading: buildButton(toBool(april)),
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
                                                  toBool(april)
                                                      ? 'Pago - ${widget.people.dataApril}'
                                                      : 'Pendente',
                                                  style:
                                                      TextStyle(fontSize: 15),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        if (may == 'true') {
                                          may = 'false';
                                        } else {
                                          may = 'true';
                                        }

                                        dataMay = dataFormatada();

                                        _auxUpdateBody();
                                      },
                                      child: Card(
                                        child: ListTile(
                                          leading: buildButton(toBool(may)),
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
                                                  toBool(may)
                                                      ? 'Pago - ${widget.people.dataMay}'
                                                      : 'Pendente',
                                                  style:
                                                      TextStyle(fontSize: 15),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        if (january == 'true') {
                                          january = 'false';
                                        } else {
                                          january = 'true';
                                        }

                                        dataJanuary = dataFormatada();

                                        _auxUpdateBody();
                                      },
                                      child: Card(
                                        child: ListTile(
                                          leading: buildButton(
                                              toBool(june), dataJune),
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
                                                  toBool(june)
                                                      ? 'Pago - ${dataFormatada()}'
                                                      : 'Pendente',
                                                  style:
                                                      TextStyle(fontSize: 15),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      child: Card(
                                        child: ListTile(
                                          leading: buildButton(
                                              toBool(july), dataJuly),
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
                                                  toBool(july)
                                                      ? 'Pago - ${dataFormatada()}'
                                                      : 'Pendente',
                                                  style:
                                                      TextStyle(fontSize: 15),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      child: Card(
                                        child: ListTile(
                                          leading: buildButton(
                                              toBool(august), dataAugust),
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
                                                  toBool(august)
                                                      ? 'Pago - ${dataFormatada()}'
                                                      : 'Pendente',
                                                  style:
                                                      TextStyle(fontSize: 15),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      child: Card(
                                        child: ListTile(
                                          leading: buildButton(
                                              toBool(september), dataSeptember),
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
                                                  toBool(september)
                                                      ? 'Pago - ${dataFormatada()}'
                                                      : 'Pendente',
                                                  style:
                                                      TextStyle(fontSize: 15),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      child: Card(
                                        child: ListTile(
                                          leading: buildButton(
                                              toBool(october), dataOctober),
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
                                                  toBool(october)
                                                      ? 'Pago - ${dataFormatada()}'
                                                      : 'Pendente',
                                                  style:
                                                      TextStyle(fontSize: 15),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      child: Card(
                                        child: ListTile(
                                          leading: buildButton(
                                              toBool(november), dataNovember),
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
                                                  toBool(november)
                                                      ? 'Pago - ${dataFormatada()}'
                                                      : 'Pendente',
                                                  style:
                                                      TextStyle(fontSize: 15),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      child: Card(
                                        child: ListTile(
                                          leading: buildButton(
                                              toBool(december), dataDecember),
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
                                                  toBool(widget.people.december)
                                                      ? 'Pago - ${dataFormatada()}'
                                                      : 'Pendente',
                                                  style:
                                                      TextStyle(fontSize: 15),
                                                ),
                                              ),
                                            ],
                                          ),
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

  bool toBool(String transform) {
    bool transformed;
    if (transform == 'true') {
      transformed = true;
    } else {
      transformed = false;
    }

    return transformed;
  }

  _updateData() {
    if (this.formKey.currentState.validate()) {
      formKey.currentState.save();
    } else {
      return null;
    }
    var employee = Employee(
        widget.people.firstName,
        widget.people.age,
        widget.people.adress,
        widget.people.sex,
        widget.people.description,
        widget.people.createIn,
        widget.people.height,
        widget.people.neck,
        widget.people.bicepsL,
        widget.people.chest,
        widget.people.forearmL,
        widget.people.waist,
        widget.people.legL,
        widget.people.calfL,
        widget.people.weight,
        widget.people.shoulders,
        widget.people.bicepsR,
        widget.people.abs,
        widget.people.forearmR,
        widget.people.glutes,
        widget.people.legR,
        widget.people.calfR,
        getStart,
        getEnd,
        january,
        february,
        march,
        april,
        may,
        june,
        july,
        august,
        september,
        october,
        november,
        december,
        dataJanuary.toString(),
        dataFebruary.toString(),
        dataMarch.toString(),
        dataApril.toString(),
        dataMay.toString(),
        dataJune.toString(),
        dataJuly.toString(),
        dataAugust.toString(),
        dataSeptember.toString(),
        dataOctober.toString(),
        dataNovember.toString(),
        dataDecember.toString());

    var dbHelper = DBHelper();
    dbHelper.updateBodyPerson(widget.people, employee);
  }

  _auxUpdateBody() {
    var employee = Employee(
        widget.people.firstName,
        widget.people.age,
        widget.people.adress,
        widget.people.sex,
        widget.people.description,
        widget.people.createIn,
        widget.people.height,
        widget.people.neck,
        widget.people.bicepsL,
        widget.people.chest,
        widget.people.forearmL,
        widget.people.waist,
        widget.people.legL,
        widget.people.calfL,
        widget.people.weight,
        widget.people.shoulders,
        widget.people.bicepsR,
        widget.people.abs,
        widget.people.forearmR,
        widget.people.glutes,
        widget.people.legR,
        widget.people.calfR,
        getStart,
        getEnd,
        january,
        february,
        march,
        april,
        may,
        june,
        july,
        august,
        september,
        october,
        november,
        december,
        dataJanuary.toString(),
        dataFebruary.toString(),
        dataMarch.toString(),
        dataApril.toString(),
        dataMay.toString(),
        dataJune.toString(),
        dataJuly.toString(),
        dataAugust.toString(),
        dataSeptember.toString(),
        dataOctober.toString(),
        dataNovember.toString(),
        dataDecember.toString());

    var dbHelper = DBHelper();
    dbHelper.updateBodyPerson(widget.people, employee);
  }
}
