import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_full_pdf_viewer/full_pdf_viewer_scaffold.dart';
import 'package:flutter_html_to_pdf/flutter_html_to_pdf.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gsfit/database/dbhelper.dart';
import 'package:gsfit/models/employee.dart';
import 'package:gsfit/models/payment.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_extend/share_extend.dart';
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
  String generatedPdfFilePath;
  String data = '';
  String vencimento = '';
  String mes = '';
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

  Future<void> generatePaymentDocument(
      String data, String vencimento, String mes) async {
    var htmlContenttwo = """
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="utf-8">
        <title>Invoice</title>
    </head>

    <body>
        <header>
            <h1>Nota Fiscal</h1>
            <address contenteditable>
                <p>Studio GS Fit</p>
                <p>Rua Manoel Lucio da Silva, nº 49</p>
                <p>Bonsucesso - Barreiro</p>
                <p>31 99856-2364</p>
            </address>
        </header>
        <article>
            <h1>Recipient</h1>
            <address contenteditable>
                <img src="https://imgur.com/LodIonr.png" height="150em">
            </address>
            <table class="meta">
                <tr>
                    <th><span contenteditable>Nota #</span></th>
                    <td><span contenteditable>1</span></td>
                </tr>
                <tr>
                    <th><span contenteditable>Data</span></th>
                    <td><span contenteditable>$data</span></td>
                </tr>
                <tr>
                    <th><span contenteditable>Valor</span></th>
                    <td><span id="prefix" contenteditable>R\$</span><span>${widget.people.payment}</span></td>
                </tr>
            </table>
            <table class="inventory">
                <thead>
                    <tr>
                        <th><span contenteditable>Mensalidade</span></th>
                        <th><span contenteditable>Nome</span></th>
                        <th><span contenteditable>Vencimento</span></th>
                        <th><span contenteditable>Valor</span></th>
                        
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>
                            <p align="center">$mes</p>
                        </td>
                        <td>
                            <p align="center">${widget.people.firstName}</p>
                        </td>
                        <td>
                            <p align="center">$vencimento</p>
                        </td>
                        <td>
                            <p align="center">${widget.people.payment}</p>
                        </td>
                    </tr>
                </tbody>
            </table>
            <table class="balance">
                <tr>
                    <th><span contenteditable>Total</span></th>
                    <td><span data-prefix>R\$</span><span>${widget.people.payment}</span></td>
                </tr>
            </table>
        </article>
        <aside>
            <h1><span contenteditable>Emitido Em</span></h1>
            <div contenteditable>
                <p align="center">${dataFormatada()}</p>
                <p align="right">Studio GS Fit</p>
            </div>
        </aside>
        <style>
            /* reset */

            * {
                border: 0;
                box-sizing: content-box;
                color: inherit;
                font-family: inherit;
                font-size: inherit;
                font-style: inherit;
                font-weight: inherit;
                line-height: inherit;
                list-style: none;
                margin: 0;
                padding: 0;
                text-decoration: none;
                vertical-align: top;
            }

            /* content editable */

            *[contenteditable] {
                border-radius: 0.25em;
                min-width: 1em;
                outline: 0;
            }

            *[contenteditable] {
                cursor: pointer;
            }

            *[contenteditable]:hover,
            *[contenteditable]:focus,
            td:hover *[contenteditable],
            td:focus *[contenteditable],
            img.hover {
                background: #DEF;
                box-shadow: 0 0 1em 0.5em #DEF;
            }

            span[contenteditable] {
                display: inline-block;
            }

            /* heading */

            h1 {
                font: bold 100% sans-serif;
                letter-spacing: 0.5em;
                text-align: center;
                text-transform: uppercase;
            }

            /* table */

            table {
                font-size: 75%;
                table-layout: fixed;
                width: 100%;
            }

            table {
                border-collapse: separate;
                border-spacing: 2px;
            }

            th,
            td {
                border-width: 1px;
                padding: 0.5em;
                position: relative;
                text-align: left;
            }

            th,
            td {
                border-radius: 0.25em;
                border-style: solid;
            }

            th {
                background: #EEE;
                border-color: #BBB;
            }

            td {
                border-color: #DDD;
            }

            /* page */

            html {
                font: 16px/1 'Open Sans', sans-serif;
                overflow: auto;
                padding: 0.5in;
            }

            html {
                background: #999;
                cursor: default;
            }

            body {
                box-sizing: border-box;
                height: 11in;
                margin: 0 auto;
                overflow: hidden;
                padding: 0.5in;
                width: 8.5in;
            }

            body {
                background: #FFF;
                border-radius: 1px;
                box-shadow: 0 0 1in -0.25in rgba(0, 0, 0, 0.5);
            }

            /* header */

            header {
                margin: 0 0 3em;
            }

            header:after {
                clear: both;
                content: "";
                display: table;
            }

            header h1 {
                background: #000;
                border-radius: 0.25em;
                color: #FFF;
                margin: 0 0 1em;
                padding: 0.5em 0;
            }

            header address {
                float: left;
                font-size: 75%;
                font-style: normal;
                line-height: 1.25;
                margin: 0 1em 1em 0;
            }

            header address p {
                margin: 0 0 0.25em;
            }

            header span,
            header img {
                display: block;
                float: right;
            }

            header span {
                margin: 0 0 1em 1em;
                max-height: 25%;
                max-width: 60%;
                position: relative;
            }

            header img {
                max-height: 100%;
                max-width: 100%;
            }

            header input {
                cursor: pointer;
                -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=0)";
                height: 100%;
                left: 0;
                opacity: 0;
                position: absolute;
                top: 0;
                width: 100%;
            }

            /* article */

            article,
            article address,
            table.meta,
            table.inventory {
                margin: 0 0 3em;
            }

            article:after {
                clear: both;
                content: "";
                display: table;
            }

            article h1 {
                clip: rect(0 0 0 0);
                position: absolute;
            }

            article address {
                float: left;
                font-size: 125%;
                font-weight: bold;
            }

            /* table meta & balance */

            table.meta,
            table.balance {
                float: right;
                width: 36%;
            }

            table.meta:after,
            table.balance:after {
                clear: both;
                content: "";
                display: table;
            }

            /* table meta */

            table.meta th {
                width: 40%;
            }

            table.meta td {
                width: 60%;
            }

            /* table items */

            table.inventory {
                clear: both;
                width: 100%;
            }

            table.inventory th {
                font-weight: bold;
                text-align: center;
            }

            table.inventory td:nth-child(1) {
                width: 26%;
            }

            table.inventory td:nth-child(2) {
                width: 38%;
            }

            table.inventory td:nth-child(3) {
                text-align: right;
                width: 12%;
            }

            table.inventory td:nth-child(4) {
                text-align: right;
                width: 12%;
            }

            table.inventory td:nth-child(5) {
                text-align: right;
                width: 12%;
            }

            /* table balance */

            table.balance th,
            table.balance td {
                width: 50%;
            }

            table.balance td {
                text-align: right;
            }

            /* aside */

            aside h1 {
                border: none;
                border-width: 0 0 1px;
                margin: 0 0 1em;
            }

            aside h1 {
                border-color: #999;
                border-bottom-style: solid;
            }

            /* javascript */

            .add,
            .cut {
                border-width: 1px;
                display: block;
                font-size: .8rem;
                padding: 0.25em 0.5em;
                float: left;
                text-align: center;
                width: 0.6em;
            }

            .add,
            .cut {
                background: #9AF;
                box-shadow: 0 1px 2px rgba(0, 0, 0, 0.2);
                background-image: -moz-linear-gradient(#00ADEE 5%, #0078A5 100%);
                background-image: -webkit-linear-gradient(#00ADEE 5%, #0078A5 100%);
                border-radius: 0.5em;
                border-color: #0076A3;
                color: #FFF;
                cursor: pointer;
                font-weight: bold;
                text-shadow: 0 -1px 2px rgba(0, 0, 0, 0.333);
            }

            .add {
                margin: -2.5em 0 0;
            }

            .add:hover {
                background: #00ADEE;
            }

            .cut {
                opacity: 0;
                position: absolute;
                top: 0;
                left: -1.5em;
            }

            .cut {
                -webkit-transition: opacity 100ms ease-in;
            }

            tr:hover .cut {
                opacity: 1;
            }

            @media print {
                * {
                    -webkit-print-color-adjust: exact;
                }

                html {
                    background: none;
                    padding: 0;
                }

                body {
                    box-shadow: none;
                    margin: 0;
                }

                span:empty {
                    display: none;
                }

                .add,
                .cut {
                    display: none;
                }
            }

            @page {
                margin: 0;
            }
        </style>
    </body>

    </html>
    """;

    Directory appDocDir = await getApplicationDocumentsDirectory();
    var targetPath = appDocDir.path;
    var targetFileName = "Pagamento - ${widget.people.firstName}";

    var generatedPdfFile = await FlutterHtmlToPdf.convertFromHtmlContent(
        htmlContenttwo, targetPath, targetFileName);
    generatedPdfFilePath = generatedPdfFile.path;
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
                                            keyboardType: TextInputType.number,
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
                                          dataJanuary = '0';
                                        } else {
                                          january = 'true';
                                          dataJanuary = dataFormatada();
                                        }

                                        _alert('Janeiro');
                                        _auxUpdateBody();
                                      },
                                      onLongPress: () {
                                        setState(() {
                                          mes = 'Janeiro';
                                          data = widget.people.dataJanuary;
                                          vencimento = widget.people.dataStart +
                                              ' - ' +
                                              widget.people.dataEnd;
                                          generatePaymentDocument(
                                              data, vencimento, mes);
                                        });
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  PDFViewerScaffold(
                                                      appBar: AppBar(
                                                        title: Text(
                                                            "PDF - Pagamento $mes"),
                                                        actions: <Widget>[
                                                          IconButton(
                                                            icon: Icon(
                                                                FontAwesomeIcons
                                                                    .share),
                                                            onPressed:
                                                                () async {
                                                              final String dir =
                                                                  (await getApplicationDocumentsDirectory())
                                                                      .path;
                                                              final String
                                                                  path =
                                                                  '$dir/Pagamento - ${widget.people.firstName}.pdf';

                                                              ShareExtend.share(
                                                                  path, "file");
                                                            },
                                                          )
                                                        ],
                                                      ),
                                                      path:
                                                          generatedPdfFilePath)),
                                        );
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
                                          dataFebruary = '0';
                                        } else {
                                          february = 'true';
                                          dataFebruary = dataFormatada();
                                        }

                                        _alert('Fevereiro');
                                        _auxUpdateBody();
                                      },
                                      onLongPress: () {
                                        setState(() {
                                          mes = 'Fevereiro';
                                          data = widget.people.dataFebruary;
                                          vencimento = widget.people.dataStart +
                                              ' - ' +
                                              widget.people.dataEnd;
                                          generatePaymentDocument(
                                              data, vencimento, mes);
                                        });
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  PDFViewerScaffold(
                                                      appBar: AppBar(
                                                        title: Text(
                                                            "PDF - Pagamento $mes"),
                                                        actions: <Widget>[
                                                          IconButton(
                                                            icon: Icon(
                                                                FontAwesomeIcons
                                                                    .share),
                                                            onPressed:
                                                                () async {
                                                              final String dir =
                                                                  (await getApplicationDocumentsDirectory())
                                                                      .path;
                                                              final String
                                                                  path =
                                                                  '$dir/Pagamento - ${widget.people.firstName}.pdf';

                                                              ShareExtend.share(
                                                                  path, "file");
                                                            },
                                                          )
                                                        ],
                                                      ),
                                                      path:
                                                          generatedPdfFilePath)),
                                        );
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
                                          dataMarch = '0';
                                        } else {
                                          march = 'true';
                                          dataMarch = dataFormatada();
                                        }

                                        _alert('Março');
                                        _auxUpdateBody();
                                      },
                                      onLongPress: () {
                                        setState(() {
                                          mes = 'Março';
                                          data = widget.people.dataMarch;
                                          vencimento = widget.people.dataStart +
                                              ' - ' +
                                              widget.people.dataEnd;
                                          generatePaymentDocument(
                                              data, vencimento, mes);
                                        });
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  PDFViewerScaffold(
                                                      appBar: AppBar(
                                                        title: Text(
                                                            "PDF - Pagamento $mes"),
                                                        actions: <Widget>[
                                                          IconButton(
                                                            icon: Icon(
                                                                FontAwesomeIcons
                                                                    .share),
                                                            onPressed:
                                                                () async {
                                                              final String dir =
                                                                  (await getApplicationDocumentsDirectory())
                                                                      .path;
                                                              final String
                                                                  path =
                                                                  '$dir/Pagamento - ${widget.people.firstName}.pdf';

                                                              ShareExtend.share(
                                                                  path, "file");
                                                            },
                                                          )
                                                        ],
                                                      ),
                                                      path:
                                                          generatedPdfFilePath)),
                                        );
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
                                          dataApril = '0';
                                        } else {
                                          april = 'true';
                                          dataApril = dataFormatada();
                                        }

                                        _alert('Abril');
                                        _auxUpdateBody();
                                      },
                                      onLongPress: () {
                                        setState(() {
                                          mes = 'Abril';
                                          data = widget.people.dataApril;
                                          vencimento = widget.people.dataStart +
                                              ' - ' +
                                              widget.people.dataEnd;
                                          generatePaymentDocument(
                                              data, vencimento, mes);
                                        });
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  PDFViewerScaffold(
                                                      appBar: AppBar(
                                                        title: Text(
                                                            "PDF - Pagamento $mes"),
                                                        actions: <Widget>[
                                                          IconButton(
                                                            icon: Icon(
                                                                FontAwesomeIcons
                                                                    .share),
                                                            onPressed:
                                                                () async {
                                                              final String dir =
                                                                  (await getApplicationDocumentsDirectory())
                                                                      .path;
                                                              final String
                                                                  path =
                                                                  '$dir/Pagamento - ${widget.people.firstName}.pdf';

                                                              ShareExtend.share(
                                                                  path, "file");
                                                            },
                                                          )
                                                        ],
                                                      ),
                                                      path:
                                                          generatedPdfFilePath)),
                                        );
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
                                          dataMay = '0';
                                        } else {
                                          may = 'true';
                                          dataMay = dataFormatada();
                                        }

                                        _alert('Maio');
                                        _auxUpdateBody();
                                      },
                                      onLongPress: () {
                                        setState(() {
                                          mes = 'Maio';
                                          data = widget.people.dataMay;
                                          vencimento = widget.people.dataStart +
                                              ' - ' +
                                              widget.people.dataEnd;
                                          generatePaymentDocument(
                                              data, vencimento, mes);
                                        });
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  PDFViewerScaffold(
                                                      appBar: AppBar(
                                                        title: Text(
                                                            "PDF - Pagamento $mes"),
                                                        actions: <Widget>[
                                                          IconButton(
                                                            icon: Icon(
                                                                FontAwesomeIcons
                                                                    .share),
                                                            onPressed:
                                                                () async {
                                                              final String dir =
                                                                  (await getApplicationDocumentsDirectory())
                                                                      .path;
                                                              final String
                                                                  path =
                                                                  '$dir/Pagamento - ${widget.people.firstName}.pdf';

                                                              ShareExtend.share(
                                                                  path, "file");
                                                            },
                                                          )
                                                        ],
                                                      ),
                                                      path:
                                                          generatedPdfFilePath)),
                                        );
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
                                        if (june == 'true') {
                                          june = 'false';
                                          dataJune = '0';
                                        } else {
                                          june = 'true';
                                          dataJune = dataFormatada();
                                        }
                                        _alert('Junho');
                                        _auxUpdateBody();
                                      },
                                      onLongPress: () {
                                        setState(() {
                                          mes = 'Junho';
                                          data = widget.people.dataJune;
                                          vencimento = widget.people.dataStart +
                                              ' - ' +
                                              widget.people.dataEnd;
                                          generatePaymentDocument(
                                              data, vencimento, mes);
                                        });
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  PDFViewerScaffold(
                                                      appBar: AppBar(
                                                        title: Text(
                                                            "PDF - Pagamento $mes"),
                                                        actions: <Widget>[
                                                          IconButton(
                                                            icon: Icon(
                                                                FontAwesomeIcons
                                                                    .share),
                                                            onPressed:
                                                                () async {
                                                              final String dir =
                                                                  (await getApplicationDocumentsDirectory())
                                                                      .path;
                                                              final String
                                                                  path =
                                                                  '$dir/Pagamento - ${widget.people.firstName}.pdf';

                                                              ShareExtend.share(
                                                                  path, "file");
                                                            },
                                                          )
                                                        ],
                                                      ),
                                                      path:
                                                          generatedPdfFilePath)),
                                        );
                                      },
                                      child: Card(
                                        child: ListTile(
                                          leading: buildButton(toBool(june)),
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
                                                      ? 'Pago - ${widget.people.dataJune}'
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
                                        if (july == 'true') {
                                          july = 'false';
                                          dataJuly = '0';
                                        } else {
                                          july = 'true';
                                          dataJuly = dataFormatada();
                                        }
                                        _alert('Julho');
                                        _auxUpdateBody();
                                      },
                                      onLongPress: () {
                                        setState(() {
                                          mes = 'Julho';
                                          data = widget.people.dataJuly;
                                          vencimento = widget.people.dataStart +
                                              ' - ' +
                                              widget.people.dataEnd;
                                          generatePaymentDocument(
                                              data, vencimento, mes);
                                        });
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  PDFViewerScaffold(
                                                      appBar: AppBar(
                                                        title: Text(
                                                            "PDF - Pagamento $mes"),
                                                        actions: <Widget>[
                                                          IconButton(
                                                            icon: Icon(
                                                                FontAwesomeIcons
                                                                    .share),
                                                            onPressed:
                                                                () async {
                                                              final String dir =
                                                                  (await getApplicationDocumentsDirectory())
                                                                      .path;
                                                              final String
                                                                  path =
                                                                  '$dir/Pagamento - ${widget.people.firstName}.pdf';

                                                              ShareExtend.share(
                                                                  path, "file");
                                                            },
                                                          )
                                                        ],
                                                      ),
                                                      path:
                                                          generatedPdfFilePath)),
                                        );
                                      },
                                      child: Card(
                                        child: ListTile(
                                          leading: buildButton(toBool(july)),
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
                                                      ? 'Pago - ${widget.people.dataJuly}'
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
                                        if (august == 'true') {
                                          august = 'false';
                                          dataAugust = '0';
                                        } else {
                                          august = 'true';
                                          dataAugust = dataFormatada();
                                        }
                                        _alert('Agosto');
                                        _auxUpdateBody();
                                      },
                                      onLongPress: () {
                                        setState(() {
                                          mes = 'Agosto';
                                          data = widget.people.dataAugust;
                                          vencimento = widget.people.dataStart +
                                              ' - ' +
                                              widget.people.dataEnd;
                                          generatePaymentDocument(
                                              data, vencimento, mes);
                                        });
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                PDFViewerScaffold(
                                                    appBar: AppBar(
                                                      title: Text(
                                                          "PDF - Pagamento $mes"),
                                                      actions: <Widget>[
                                                        IconButton(
                                                          icon: Icon(
                                                              FontAwesomeIcons
                                                                  .share),
                                                          onPressed: () async {
                                                            final String dir =
                                                                (await getApplicationDocumentsDirectory())
                                                                    .path;
                                                            final String path =
                                                                '$dir/Pagamento - ${widget.people.firstName}.pdf';

                                                            ShareExtend.share(
                                                                path, "file");
                                                          },
                                                        )
                                                      ],
                                                    ),
                                                    path: generatedPdfFilePath),
                                          ),
                                        );
                                      },
                                      child: Card(
                                        child: ListTile(
                                          leading: buildButton(toBool(august)),
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
                                                      ? 'Pago - ${widget.people.dataAugust}'
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
                                        if (september == 'true') {
                                          september = 'false';
                                          dataSeptember = '0';
                                        } else {
                                          september = 'true';
                                          dataSeptember = dataFormatada();
                                        }
                                        _alert('Setembro');
                                        _auxUpdateBody();
                                      },
                                      onLongPress: () {
                                        setState(() {
                                          mes = 'Setembro';
                                          data = widget.people.dataApril;
                                          vencimento =
                                              widget.people.dataSeptember +
                                                  ' - ' +
                                                  widget.people.dataEnd;
                                          generatePaymentDocument(
                                              data, vencimento, mes);
                                        });
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  PDFViewerScaffold(
                                                      appBar: AppBar(
                                                        title: Text(
                                                            "PDF - Pagamento $mes"),
                                                        actions: <Widget>[
                                                          IconButton(
                                                            icon: Icon(
                                                                FontAwesomeIcons
                                                                    .share),
                                                            onPressed:
                                                                () async {
                                                              final String dir =
                                                                  (await getApplicationDocumentsDirectory())
                                                                      .path;
                                                              final String
                                                                  path =
                                                                  '$dir/Pagamento - ${widget.people.firstName}.pdf';

                                                              ShareExtend.share(
                                                                  path, "file");
                                                            },
                                                          )
                                                        ],
                                                      ),
                                                      path:
                                                          generatedPdfFilePath)),
                                        );
                                      },
                                      child: Card(
                                        child: ListTile(
                                          leading:
                                              buildButton(toBool(september)),
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
                                                      ? 'Pago - ${widget.people.dataSeptember}'
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
                                        if (october == 'true') {
                                          october = 'false';
                                          dataOctober = '0';
                                        } else {
                                          october = 'true';
                                          dataOctober = dataFormatada();
                                        }
                                        _alert('Outubro');
                                        _auxUpdateBody();
                                      },
                                      onLongPress: () {
                                        setState(() {
                                          mes = 'Outubro';
                                          data = widget.people.dataOctober;
                                          vencimento = widget.people.dataStart +
                                              ' - ' +
                                              widget.people.dataEnd;
                                          generatePaymentDocument(
                                              data, vencimento, mes);
                                        });
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  PDFViewerScaffold(
                                                      appBar: AppBar(
                                                        title: Text(
                                                            "PDF - Pagamento $mes"),
                                                        actions: <Widget>[
                                                          IconButton(
                                                            icon: Icon(
                                                                FontAwesomeIcons
                                                                    .share),
                                                            onPressed:
                                                                () async {
                                                              final String dir =
                                                                  (await getApplicationDocumentsDirectory())
                                                                      .path;
                                                              final String
                                                                  path =
                                                                  '$dir/Pagamento - ${widget.people.firstName}.pdf';

                                                              ShareExtend.share(
                                                                  path, "file");
                                                            },
                                                          )
                                                        ],
                                                      ),
                                                      path:
                                                          generatedPdfFilePath)),
                                        );
                                      },
                                      child: Card(
                                        child: ListTile(
                                          leading: buildButton(toBool(october)),
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
                                                      ? 'Pago - ${widget.people.dataOctober}'
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
                                        if (november == 'true') {
                                          november = 'false';
                                          dataNovember = '0';
                                        } else {
                                          november = 'true';
                                          dataNovember = dataFormatada();
                                        }

                                        _alert('Novembro');
                                        _auxUpdateBody();
                                      },
                                      onLongPress: () {
                                        setState(() {
                                          mes = 'Novembro';
                                          data = widget.people.dataNovember;
                                          vencimento = widget.people.dataStart +
                                              ' - ' +
                                              widget.people.dataEnd;
                                          generatePaymentDocument(
                                              data, vencimento, mes);
                                        });
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                PDFViewerScaffold(
                                                    appBar: AppBar(
                                                      title: Text(
                                                          "PDF - Pagamento $mes"),
                                                      actions: <Widget>[
                                                        IconButton(
                                                          icon: Icon(
                                                              FontAwesomeIcons
                                                                  .share),
                                                          onPressed: () async {
                                                            final String dir =
                                                                (await getApplicationDocumentsDirectory())
                                                                    .path;
                                                            final String path =
                                                                '$dir/Pagamento - ${widget.people.firstName}.pdf';

                                                            ShareExtend.share(
                                                                path, "file");
                                                          },
                                                        )
                                                      ],
                                                    ),
                                                    path: generatedPdfFilePath),
                                          ),
                                        );
                                      },
                                      child: Card(
                                        child: ListTile(
                                          leading:
                                              buildButton(toBool(november)),
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
                                                      ? 'Pago - ${widget.people.dataNovember}'
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
                                        if (december == 'true') {
                                          december = 'false';
                                          dataDecember = '0';
                                        } else {
                                          december = 'true';
                                          dataDecember = dataFormatada();
                                        }

                                        _alert('Dezembro');
                                        _auxUpdateBody();
                                      },
                                      onLongPress: () {
                                        setState(() {
                                          mes = 'Dezembro';
                                          data = widget.people.dataDecember;
                                          vencimento = widget.people.dataStart +
                                              ' - ' +
                                              widget.people.dataEnd;
                                          generatePaymentDocument(
                                              data, vencimento, mes);
                                        });
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                PDFViewerScaffold(
                                                    appBar: AppBar(
                                                      title: Text(
                                                          "PDF - Pagamento $mes"),
                                                      actions: <Widget>[
                                                        IconButton(
                                                          icon: Icon(
                                                              FontAwesomeIcons
                                                                  .share),
                                                          onPressed: () async {
                                                            final String dir =
                                                                (await getApplicationDocumentsDirectory())
                                                                    .path;
                                                            final String path =
                                                                '$dir/Pagamento - ${widget.people.firstName}.pdf';

                                                            ShareExtend.share(
                                                                path, "file");
                                                          },
                                                        )
                                                      ],
                                                    ),
                                                    path: generatedPdfFilePath),
                                          ),
                                        );
                                      },
                                      child: Card(
                                        child: ListTile(
                                          leading:
                                              buildButton(toBool(december)),
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
                                                  toBool(december)
                                                      ? 'Pago - ${widget.people.dataDecember}'
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
        widget.people.payment,
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
        widget.people.payment,
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

  _alert(String mounth) {
    StatusAlert.show(
      context,
      duration: Duration(seconds: 1),
      title: 'Pago',
      subtitle: 'Mensalidade de $mounth paga com sucesso',
      configuration: IconConfiguration(icon: FontAwesomeIcons.check),
    );
  }
}
