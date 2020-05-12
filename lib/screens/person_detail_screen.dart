import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gsfit/models/body.dart';
import 'package:gsfit/models/employee.dart';
import 'package:gsfit/database/dbhelper.dart';
import 'package:fancy_dialog/fancy_dialog.dart';
import 'package:gsfit/screens/body_detail_screen.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:share_extend/share_extend.dart';
import 'package:status_alert/status_alert.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_html_to_pdf/flutter_html_to_pdf.dart';
import 'dart:io';
import 'dart:async';
import 'package:flutter_full_pdf_viewer/flutter_full_pdf_viewer.dart';
import 'package:gsfit/models/bodyPart.dart';

class PeopleDetailScreen extends StatefulWidget {
  final Employee people;

  PeopleDetailScreen({@required this.people});

  @override
  _PeopleDetailScreenState createState() => _PeopleDetailScreenState();
}

class _PeopleDetailScreenState extends State<PeopleDetailScreen> {
  Employee employee = new Employee(
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
  );

  bool value5 = false;

  String firstname;

  String age;

  String adress;

  String description;

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
  String calfR; //1

  String generatedPdfFilePath;

  final scaffoldKey = new GlobalKey<ScaffoldState>();

  final formKey = new GlobalKey<FormState>();

  var db = DBHelper();

  void initState() {
    super.initState();
    generateExampleDocument();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Column(
            children: <Widget>[
              Stack(
                alignment: Alignment.centerRight,
                children: <Widget>[
                  Container(
                    height: screenHeight * 0.5,
                    color: Color(0xffa54657),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 60.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Icon(
                                  FontAwesomeIcons.arrowLeft,
                                  color: Colors.white,
                                ),
                              ),
                              InkWell(
                                onLongPress: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          FancyDialog(
                                            gifPath:
                                                'assets/communications.png',
                                            okColor:
                                                Theme.of(context).primaryColor,
                                            cancelColor: Colors.black,
                                            title: "Excluir Aluno",
                                            okFun: () {
                                              _submit(widget.people);
                                              StatusAlert.show(
                                                context,
                                                duration: Duration(seconds: 1),
                                                title: 'Exluir',
                                                subtitle:
                                                    'Aluno Excluido Com Sucesso',
                                                configuration:
                                                    IconConfiguration(
                                                        icon: FontAwesomeIcons
                                                            .check),
                                              );
                                            },
                                            descreption:
                                                "O Aluno selecionado será excluido permanentemente!",
                                          ));
                                },
                                child: Icon(
                                  FontAwesomeIcons.trashAlt,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: screenHeight * 0.31,
                    width: screenWidth,
                    child: Hero(
                      tag: widget.people.firstName,
                      child: Image(
                        image: AssetImage(widget.people.url(
                            int.parse(widget.people.age),
                            int.parse(widget.people.sex))),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                  child: Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 22.0,
                    vertical: 50.0,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Align(
                                  child: Image.asset(
                                    'assets/Stylus/description.png',
                                    width: 55,
                                    height: 55,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              width: 16.0,
                              height: screenHeight / 10,
                            ),
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text('Studio GS  Fit ',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                          )),
                                      Text(widget.people.createIn,
                                          style: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.7),
                                            fontWeight: FontWeight.w600,
                                          )),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8.0,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(widget.people.description,
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.8),
                              fontSize: 16.0,
                              fontWeight: FontWeight.w400,
                            )),
                      ],
                    ),
                  ),
                ),
                color: Colors.white,
              )),
              Container(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 22.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Material(
                        borderRadius: BorderRadius.circular(20.0),
                        elevation: 4.0,
                        color: Theme.of(context).primaryColor,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: InkWell(
                            onTap: () {
                              var alert = AlertDialog(
                                title: Text("Funcionalidades para  Aluno"),
                                content: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: <Widget>[
                                        IconButton(
                                          icon: Image.asset(
                                            'assets/Stylus/pdf.png',
                                          ),
                                          iconSize: 60,
                                          onPressed: () => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    PDFViewerScaffold(
                                                        appBar: AppBar(
                                                          title: Text(
                                                              "PDF - Avaliação Física"),
                                                          actions: <Widget>[
                                                            IconButton(
                                                              icon: Icon(
                                                                  FontAwesomeIcons
                                                                      .share),
                                                              onPressed:
                                                                  () async {
                                                                final String
                                                                    dir =
                                                                    (await getApplicationDocumentsDirectory())
                                                                        .path;
                                                                final String
                                                                    path =
                                                                    '$dir/${widget.people.firstName}-${dataFormatada()}.pdf';

                                                                ShareExtend
                                                                    .share(path,
                                                                        "file");
                                                              },
                                                            )
                                                          ],
                                                        ),
                                                        path:
                                                            generatedPdfFilePath)),
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () => print('Pagamentos'),
                                          icon: Image.asset(
                                              'assets/Stylus/payment.png'),
                                          iconSize: 60,
                                        ),
                                        IconButton(
                                          onPressed: () => print('Fotos'),
                                          icon: Image.asset(
                                              'assets/Stylus/album.png'),
                                          iconSize: 70,
                                        ),
                                      ],
                                    )),
                              );
                              showDialog(
                                  context: context,
                                  builder: (_) {
                                    return alert;
                                  });
                            },
                            child: Icon(
                              FontAwesomeIcons.infoCircle,
                              color: Colors.white,
                              size: 32,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 24.0,
                      ),
                      Expanded(
                          child: InkWell(
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          elevation: 4.0,
                          color: Theme.of(context).primaryColor,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: OpenContainer(
                              closedElevation: 0,
                              transitionType:
                                  ContainerTransitionType.fadeThrough,
                              transitionDuration:
                                  const Duration(milliseconds: 800),
                              closedColor:
                                  Theme.of(context).primaryColor.withAlpha(100),
                              openBuilder: (context, _) {
                                return BodyDetailScreen(
                                    people: new Employee(
                                        firstname,
                                        age,
                                        adress,
                                        widget.people.sex,
                                        description,
                                        dataFormatada(),
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
                                        widget.people.calfR),
                                    finalBody: Body(
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
                                        widget.people.calfR));
                              },
                              closedBuilder:
                                  (context, VoidCallback openContainer) {
                                return InkWell(
                                    onTap: openContainer,
                                    onLongPress: () => _updateBody(),
                                    child: Text(
                                      'Avaliação Física',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.0,
                                      ),
                                      textAlign: TextAlign.center,
                                    ));
                              },
                            ),
                          ),
                        ),
                      ))
                    ],
                  ),
                ),
                height: 150,
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(0.06),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30.0),
                        topLeft: Radius.circular(30.0))),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Material(
              borderRadius: BorderRadius.circular(20.0),
              elevation: 6.0,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 13.0, horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Text(widget.people.firstName,
                            style: TextStyle(
                                fontSize: 24.0,
                                fontFamily: 'Lobster',
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold)),
                        InkWell(
                          onTap: () {
                            var alert = AlertDialog(
                              title: Text("Atualizar Aluno"),
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
                                                labelText: 'Primeiro Nome',
                                                labelStyle: TextStyle(
                                                    color: Theme.of(context)
                                                        .primaryColor),
                                                icon: Icon(
                                                  FontAwesomeIcons.signature,
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                )),
                                            validator: (val) => val.length == 0
                                                ? "Digite seu nome"
                                                : null,
                                            onSaved: (val) =>
                                                this.firstname = val,
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
                                                labelText: 'Idade',
                                                labelStyle: TextStyle(
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                ),
                                                icon: Icon(
                                                  FontAwesomeIcons
                                                      .hourglassHalf,
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                )),
                                            validator: (val) => val.length == 0
                                                ? 'Digite sua idade'
                                                : null,
                                            onSaved: (val) => this.age = val,
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          TextFormField(
                                            autofocus: false,
                                            keyboardType: TextInputType.text,
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
                                                labelText: 'Endereço',
                                                labelStyle: TextStyle(
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                ),
                                                icon: Icon(
                                                  FontAwesomeIcons.mapMarkedAlt,
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                )),
                                            validator: (val) => val.length == 0
                                                ? 'Digite seu endereço'
                                                : null,
                                            onSaved: (val) => this.adress = val,
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          TextFormField(
                                            autofocus: false,
                                            minLines: 5,
                                            maxLines: 6,
                                            keyboardType: TextInputType.text,
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
                                                labelText: 'Descrição',
                                                labelStyle: TextStyle(
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                ),
                                                icon: Icon(
                                                  FontAwesomeIcons.commentAlt,
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                )),
                                            validator: (val) => val.length == 0
                                                ? 'Digite uma Descrição'
                                                : null,
                                            onSaved: (val) =>
                                                this.description = val,
                                          ),
                                        ]),
                                      ))),
                              actions: <Widget>[
                                FlatButton(
                                    onPressed: () async {
                                      _update();
                                      Navigator.pop(context);
                                      StatusAlert.show(
                                        context,
                                        duration: Duration(seconds: 1),
                                        title: 'Atualizado',
                                        subtitle:
                                            'Aluno Atualizado Com Sucesso',
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
                          child: Icon(FontAwesomeIcons.edit,
                              color: Colors.black.withOpacity(0.7)),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 10.0,
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('${widget.people.age} anos',
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.8),
                                fontWeight: FontWeight.w600)),
                      ],
                    ),
                    SizedBox(
                      width: 10.0,
                      height: 10.0,
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          FontAwesomeIcons.mapMarkerAlt,
                          color: Theme.of(context).primaryColor,
                          size: 16.0,
                        ),
                        SizedBox(
                          width: 16.0,
                        ),
                        Text('${widget.people.adress}',
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.black,
                                fontWeight: FontWeight.w400)),
                      ],
                    )
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                height: 120.0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _submit(Employee employee) {
    var dbHelper = DBHelper();
    dbHelper.deletePerson(employee);
  }

  void _update() {
    if (this.formKey.currentState.validate()) {
      formKey.currentState.save();
    } else {
      return null;
    }
    var employee = Employee(
        firstname,
        age,
        adress,
        widget.people.sex,
        description,
        dataFormatada(),
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
        widget.people.calfR);

    var dbHelper = DBHelper();
    dbHelper.updatePerson(widget.people, employee);
  }

  String dataFormatada() {
    var agora = DateTime.now();
    initializeDateFormatting("pt_BR", null);
    var formatador = new DateFormat.yMMMd("pt_BR");

    return formatador.format(agora);
  }

  Future<void> generateExampleDocument() async {
    var htmlContent = """
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="utf-8" />
        <title>Table Style</title>
        <meta name="viewport" content="initial-scale=1.0; maximum-scale=1.0; width=device-width;">
    </head>

    <body>
        <div class="table-title">
            <h3>Studio GS Fit</h3>
        </div>
        <table class="table-fill">
            <thead>
                <tr>
                    <th class="text-left">Avaliação Física</th>
                    <th class="text-left">Dados</th>
                </tr>
            </thead>
            <tbody class="table-hover">
                <tr>
                    <td class="text-left">Nome</td>
                    <td class="text-left">${widget.people.firstName}</td>
                </tr>
                <tr>
                    <td class="text-left">Altura</td>
                    <td class="text-left">${widget.people.height}</td>
                </tr>
                <tr>
                    <td class="text-left">Peso</td>
                    <td class="text-left">${widget.people.weight}</td>
                </tr>
            </tbody>
            <tfoot>
                <tr>
                    <th></th>
                    <th></th>
                </tr>
            </tfoot>
        </table>
        <br/><br/><br/><br/>
        <table class="table-fill">
            <thead>
                <tr>
                    <th class="text-left">Avaliação Física - Superiores</th>
                    <th class="text-left">Medidas</th>
                </tr>
            </thead>
            <tbody class="table-hover">
                <tr>
                    <td class="text-left">Pescoço</td>
                    <td class="text-left">${widget.people.neck}</td>
                </tr>
                <tr>
                    <td class="text-left">Ombros</td>
                    <td class="text-left">${widget.people.shoulders}</td>
                </tr>
                <tr>
                    <td class="text-left">Braços</td>
                    <td class="text-left">Esq = ${widget.people.bicepsL} - Dir = ${widget.people.bicepsR}</td>
                </tr>
                <tr>
                    <td class="text-left">Antebraço</td>
                    <td class="text-left">Esq = ${widget.people.forearmL} - Dir = ${widget.people.forearmR}</td>
                </tr>
                <tr>
                    <td class="text-left">Peito</td>
                    <td class="text-left">${widget.people.chest}</td>
                </tr>
                <tr>
                    <td class="text-left">Abdômen e Cintura </td>
                    <td class="text-left">Abs = ${widget.people.abs} - Cint = ${widget.people.waist}</td>
                </tr>
            </tbody>
            <tfoot>
                <tr>
                    <th>Avaliado Em</th>
                    <th>${dataFormatada()}</th>
                </tr>
            </tfoot>
        </table>
        <br/><br/><br/><br/>
        <table class="table-fill">
            <thead>
                <tr>
                    <th class="text-left">Avaliação Física - Inferiores</th>
                    <th class="text-left">Medidas</th>
                </tr>
            </thead>
            <tbody class="table-hover">
                <tr>
                    <td class="text-left">Glúteos</td>
                    <td class="text-left">${widget.people.glutes}</td>
                </tr>
                <tr>
                    <td class="text-left">Coxa Esq.</td>
                    <td class="text-left">${widget.people.legL}</td>
                </tr>
                <tr>
                    <td class="text-left">Coxa Dir.</td>
                    <td class="text-left">${widget.people.legR}</td>
                </tr>
                 <tr>
                    <td class="text-left">Panturrilha Esq.</td>
                    <td class="text-left">${widget.people.calfL}</td>
                </tr>
                <tr>
                    <td class="text-left">Panturrilha Dir.</td>
                    <td class="text-left">${widget.people.calfR}</td>
                </tr>
            </tbody>
            <tfoot>
                <tr>
                    <th>Avaliado Em</th>
                    <th>${dataFormatada()}</th>
                </tr>
            </tfoot>
        </table>
        <style>
            body {

                font-family: "Roboto", helvetica, arial, sans-serif;
                font-size: 16px;
                font-weight: 400;
            }

            div.table-title {
                display: block;
                margin: auto;
                max-width: 600px;
                padding: 5px;
                width: 100%;
            }

            .table-title h3 {
                color: #1b1e24;
                font-size: 30px;
                font-weight: 400;
                font-style: normal;
                font-family: "Roboto", helvetica, arial, sans-serif;
                text-shadow: -1px -1px 1px rgba(0, 0, 0, 0.1);
                text-transform: uppercase;
            }


            /*** Table Styles **/

            .table-fill {
                background: white;
                border-radius: 3px;
                border-collapse: collapse;
                height: 320px;
                margin: auto;
                max-width: 600px;
                padding: 5px;
                width: 100%;
                box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
            }

            th {
                color: #D5DDE5;
                ;
                background: #1b1e24;
                border-bottom: 4px solid #9ea7af;
                border-right: 1px solid #343a45;
                font-size: 23px;
                font-weight: 100;
                padding: 24px;
                text-align: left;
                text-shadow: 0 1px 1px rgba(0, 0, 0, 0.1);
                vertical-align: middle;
            }

            th:first-child {
                border-top-left-radius: 3px;
            }

            th:last-child {
                border-top-right-radius: 3px;
                border-right: none;
            }

            tr {
                border-top: 1px solid #C1C3D1;
                border-bottom: 1px solid #C1C3D1;
                color: #666B85;
                font-size: 16px;
                font-weight: normal;
                text-shadow: 0 1px 1px rgba(256, 256, 256, 0.1);
            }

            tr:first-child {
                border-top: none;
            }

            tr:last-child {
                border-bottom: none;
            }

            tr:nth-child(odd) td {
                background: #EBEBEB;
            }

            tr:last-child td:first-child {
                border-bottom-left-radius: 3px;
            }

            tr:last-child td:last-child {
                border-bottom-right-radius: 3px;
            }

            td {
                background: #FFFFFF;
                padding: 20px;
                text-align: left;
                vertical-align: middle;
                font-weight: 300;
                font-size: 18px;
                text-shadow: -1px -1px 1px rgba(0, 0, 0, 0.1);
                border-right: 1px solid #C1C3D1;
            }

            td:last-child {
                border-right: 0px;
            }

            th.text-left {
                text-align: left;
            }

            th.text-center {
                text-align: center;
            }

            th.text-right {
                text-align: right;
            }

            td.text-left {
                text-align: left;
            }

            td.text-center {
                text-align: center;
            }

            td.text-right {
                text-align: right;
            }
        </style>

    </body>


    </html>
    """;

    Directory appDocDir = await getApplicationDocumentsDirectory();
    var targetPath = appDocDir.path;
    var targetFileName = "${widget.people.firstName}-${dataFormatada()}";

    var generatedPdfFile = await FlutterHtmlToPdf.convertFromHtmlContent(
        htmlContent, targetPath, targetFileName);
    generatedPdfFilePath = generatedPdfFile.path;
  }

  _updateBody() {
    final body = widget.people.sex == '1' ? bodyPartFemale : bodyPartMale;
    var alert = AlertDialog(
      title: Text("Atualizar Avaliação Física"),
      content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(children: [
                  TextFormField(
                    autofocus: false,
                    keyboardType: TextInputType.number,
                    cursorColor: Colors.black,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'RobotoMonoLight',
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(20.0)),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(20.0)),
                      labelText: body[0].name,
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                      icon: Image.asset(
                        body[0].imagePath,
                        color: Colors.black,
                        height: 55,
                        width: 55,
                      ),
                    ),
                    validator: (val) =>
                        val.length == 0 ? 'Digite a Altura' : null,
                    onSaved: (val) => this.height = val,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    autofocus: false,
                    keyboardType: TextInputType.number,
                    cursorColor: Colors.black,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'RobotoMonoLight',
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(20.0)),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(20.0)),
                      labelText: body[1].name,
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                      icon: Image.asset(
                        body[1].imagePath,
                        color: Colors.black,
                        height: 55,
                        width: 55,
                      ),
                    ),
                    validator: (val) =>
                        val.length == 0 ? 'Digite a Medida do Pescoço' : null,
                    onSaved: (val) => this.neck = val,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    autofocus: false,
                    keyboardType: TextInputType.number,
                    cursorColor: Colors.black,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'RobotoMonoLight',
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(20.0)),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(20.0)),
                      labelText: body[2].name,
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                      icon: Image.asset(
                        body[2].imagePath,
                        color: Colors.black,
                        height: 55,
                        width: 55,
                      ),
                    ),
                    validator: (val) =>
                        val.length == 0 ? 'Digite a Medida do Braço Esq' : null,
                    onSaved: (val) => this.bicepsL = val,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    autofocus: false,
                    keyboardType: TextInputType.number,
                    cursorColor: Colors.black,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'RobotoMonoLight',
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(20.0)),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(20.0)),
                      labelText: body[3].name,
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                      icon: Image.asset(
                        body[3].imagePath,
                        color: Colors.black,
                        height: 55,
                        width: 55,
                      ),
                    ),
                    validator: (val) =>
                        val.length == 0 ? 'Digite a Medida do Peito' : null,
                    onSaved: (val) => this.chest = val,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    autofocus: false,
                    keyboardType: TextInputType.number,
                    cursorColor: Colors.black,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'RobotoMonoLight',
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(20.0)),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(20.0)),
                      labelText: 'Antb Esq',
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                      icon: Image.asset(
                        body[4].imagePath,
                        color: Colors.black,
                        height: 55,
                        width: 55,
                      ),
                    ),
                    validator: (val) => val.length == 0
                        ? 'Digite a Medida do Antebraço Esq'
                        : null,
                    onSaved: (val) => this.forearmL = val,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    autofocus: false,
                    keyboardType: TextInputType.number,
                    cursorColor: Colors.black,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'RobotoMonoLight',
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(20.0)),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(20.0)),
                      labelText: body[5].name,
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                      icon: Image.asset(
                        body[5].imagePath,
                        color: Colors.black,
                        height: 55,
                        width: 55,
                      ),
                    ),
                    validator: (val) =>
                        val.length == 0 ? 'Digite a Medida da Cintura' : null,
                    onSaved: (val) => this.waist = val,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    autofocus: false,
                    keyboardType: TextInputType.number,
                    cursorColor: Colors.black,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'RobotoMonoLight',
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(20.0)),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(20.0)),
                      labelText: body[6].name,
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                      icon: Image.asset(
                        body[6].imagePath,
                        color: Colors.black,
                        height: 55,
                        width: 55,
                      ),
                    ),
                    validator: (val) =>
                        val.length == 0 ? 'Digite a Medida da Coxa Esq.' : null,
                    onSaved: (val) => this.legL = val,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    autofocus: false,
                    keyboardType: TextInputType.number,
                    cursorColor: Colors.black,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'RobotoMonoLight',
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(20.0)),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(20.0)),
                      labelText: 'Pant Esq',
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                      icon: Image.asset(
                        body[7].imagePath,
                        color: Colors.black,
                        height: 55,
                        width: 55,
                      ),
                    ),
                    validator: (val) => val.length == 0
                        ? 'Digite a Medida da Panturrilha Esq.'
                        : null,
                    onSaved: (val) => this.calfL = val,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    autofocus: false,
                    keyboardType: TextInputType.number,
                    cursorColor: Colors.black,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'RobotoMonoLight',
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(20.0)),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(20.0)),
                      labelText: body[8].name,
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                      icon: Image.asset(
                        body[8].imagePath,
                        color: Colors.black,
                        height: 55,
                        width: 55,
                      ),
                    ),
                    validator: (val) =>
                        val.length == 0 ? 'Digite o Peso' : null,
                    onSaved: (val) => this.weight = val,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    autofocus: false,
                    keyboardType: TextInputType.number,
                    cursorColor: Colors.black,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'RobotoMonoLight',
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(20.0)),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(20.0)),
                      labelText: body[9].name,
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                      icon: Image.asset(
                        body[9].imagePath,
                        color: Colors.black,
                        height: 55,
                        width: 55,
                      ),
                    ),
                    validator: (val) =>
                        val.length == 0 ? 'Digite a Medida dos Ombros' : null,
                    onSaved: (val) => this.shoulders = val,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    autofocus: false,
                    keyboardType: TextInputType.number,
                    cursorColor: Colors.black,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'RobotoMonoLight',
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(20.0)),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(20.0)),
                      labelText: body[10].name,
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                      icon: Image.asset(
                        body[10].imagePath,
                        color: Colors.black,
                        height: 55,
                        width: 55,
                      ),
                    ),
                    validator: (val) =>
                        val.length == 0 ? 'Digite a Medida do Braço Dir' : null,
                    onSaved: (val) => this.bicepsR = val,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    autofocus: false,
                    keyboardType: TextInputType.number,
                    cursorColor: Colors.black,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'RobotoMonoLight',
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(20.0)),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(20.0)),
                      labelText: body[11].name,
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                      icon: Image.asset(
                        body[11].imagePath,
                        color: Colors.black,
                        height: 55,
                        width: 55,
                      ),
                    ),
                    validator: (val) =>
                        val.length == 0 ? 'Digite a Medida do Abdômen' : null,
                    onSaved: (val) => this.abs = val,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    autofocus: false,
                    keyboardType: TextInputType.number,
                    cursorColor: Colors.black,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'RobotoMonoLight',
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(20.0)),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(20.0)),
                      labelText: 'Ant Dir',
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                      icon: Image.asset(
                        body[12].imagePath,
                        color: Colors.black,
                        height: 55,
                        width: 55,
                      ),
                    ),
                    validator: (val) => val.length == 0
                        ? 'Digite a Medida do Antebraço Dir'
                        : null,
                    onSaved: (val) => this.forearmR = val,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    autofocus: false,
                    keyboardType: TextInputType.number,
                    cursorColor: Colors.black,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'RobotoMonoLight',
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(20.0)),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(20.0)),
                      labelText: body[13].name,
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                      icon: Image.asset(
                        body[13].imagePath,
                        color: Colors.black,
                        height: 55,
                        width: 55,
                      ),
                    ),
                    validator: (val) =>
                        val.length == 0 ? 'Digite a Medida dos Glúteos' : null,
                    onSaved: (val) => this.glutes = val,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    autofocus: false,
                    keyboardType: TextInputType.number,
                    cursorColor: Colors.black,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'RobotoMonoLight',
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(20.0)),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(20.0)),
                      labelText: body[14].name,
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                      icon: Image.asset(
                        body[14].imagePath,
                        color:Colors.black,
                        height: 55,
                        width: 55,
                      ),
                    ),
                    validator: (val) =>
                        val.length == 0 ? 'Digite a Medida da Coxa Dir' : null,
                    onSaved: (val) => this.legR = val,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    autofocus: false,
                    keyboardType: TextInputType.number,
                    cursorColor: Colors.black,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'RobotoMonoLight',
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(20.0)),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(20.0)),
                      labelText: 'Pant Dir',
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                      icon: Image.asset(
                        body[15].imagePath,
                        color: Colors.black,
                        height: 55,
                        width: 55,
                      ),
                    ),
                    validator: (val) => val.length == 0
                        ? 'Digite a Medida da Panturrilha Dir'
                        : null,
                    onSaved: (val) => this.calfR = val,
                  ),
                  SizedBox(
                    height: 100,
                  ),
                ]),
              ))),
      actions: <Widget>[
        FlatButton(
            onPressed: () async {
              _auxUpdateBody();
              Navigator.pop(context);
              StatusAlert.show(
                context,
                duration: Duration(seconds: 1),
                title: 'Atualizado',
                subtitle: 'Aluno Atualizado Com Sucesso',
                configuration: IconConfiguration(icon: FontAwesomeIcons.check),
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
                style: TextStyle(color: Theme.of(context).primaryColor)))
      ],
    );

    showDialog(
        context: context,
        builder: (_) {
          return alert;
        });
  }

  _auxUpdateBody() {
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
        dataFormatada(),
        height,
        neck,
        bicepsL,
        chest,
        forearmL,
        waist,
        legL,
        calfL,
        weight,
        shoulders,
        bicepsR,
        abs,
        forearmR,
        glutes,
        legR,
        calfR);

    var dbHelper = DBHelper();
    dbHelper.updateBodyPerson(widget.people, employee);
  }
}
