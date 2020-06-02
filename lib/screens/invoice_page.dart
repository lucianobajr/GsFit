import 'dart:io';

import 'package:flutter_full_pdf_viewer/full_pdf_viewer_scaffold.dart';
import 'package:flutter_html_to_pdf/flutter_html_to_pdf.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_extend/share_extend.dart';

class InvoicePage extends KFDrawerContent {
  InvoicePage({
    Key key,
  });

  @override
  _InvoicePageState createState() => _InvoicePageState();
}

class _InvoicePageState extends State<InvoicePage> {
  int selectPeoplesIconIndex = 0;

  final scaffoldKey = new GlobalKey<ScaffoldState>();

  final formKey = new GlobalKey<FormState>();

  String nota;
  String description;
  String name;
  String val; //0
  String generatedPdfFilePath;

  Future<void> generateExampleDocument() async {
    var htmlContent = """
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
                    <td><span contenteditable>${dataFormatada()}</span></td>
                </tr>
                <tr>
                    <th><span contenteditable>Valor</span></th>
                    <td><span id="prefix" contenteditable>R\$</span><span>$val</span></td>
                </tr>
            </table>
            <table class="inventory">
                <thead>
                    <tr>
                        <th><span contenteditable>$nota</span></th>
                        <th><span contenteditable>Nome</span></th>
                        <th><span contenteditable>Valor</span></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>
                            <p align="center">$description</p>
                        </td>
                        <td>
                            <p align="center">$name</p>
                        </td>
                        <td>
                            <p align="center">$val</p>
                        </td>
                    </tr>
                </tbody>
            </table>
            <table class="balance">
                <tr>
                    <th><span contenteditable>Total</span></th>
                    <td><span data-prefix>R\$</span><span>$val</span></td>
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
    </html>
    """;

    Directory appDocDir = await getApplicationDocumentsDirectory();
    var targetPath = appDocDir.path;
    var targetFileName = "Nota - $name";

    var generatedPdfFile = await FlutterHtmlToPdf.convertFromHtmlContent(
        htmlContent, targetPath, targetFileName);
    generatedPdfFilePath = generatedPdfFile.path;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 40.0),
      child: Column(
        children: <Widget>[
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
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 18.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        '     Notas',
                        style: TextStyle(
                          fontFamily: 'Ultra',
                          fontSize: 25.0,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                Image.asset(
                  'assets/Stylus/invoice.png',
                  height: 60,
                  width: 60,
                  color: Theme.of(context).primaryColor,
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: Theme.of(context).primaryColor.withOpacity(0.06),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24.0, vertical: 15.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.0,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Form(
                          key: formKey,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 40,
                              ),
                              TextFormField(
                                autofocus: false,
                                keyboardType: TextInputType.text,
                                cursorColor: Colors.black.withOpacity(0.8),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'RobotoMonoLight',
                                  fontWeight: FontWeight.bold,
                                ),
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black.withOpacity(0.8)),
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black.withOpacity(0.8)),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  labelText: 'Nome da Nota',
                                  labelStyle: TextStyle(
                                    color: Colors.black.withOpacity(0.8),
                                  ),
                                  icon: Image.asset(
                                    'assets/Stylus/invoice_name.png',
                                    color: Colors.black.withOpacity(0.8),
                                    height: 55,
                                    width: 55,
                                  ),
                                ),
                                validator: (val) => val.length == 0
                                    ? 'Digite a Nome da Nota'
                                    : null,
                                onSaved: (val) => this.nota = val,
                              ),
                              SizedBox(height: 10),
                              TextFormField(
                                autofocus: false,
                                keyboardType: TextInputType.text,
                                cursorColor: Colors.black.withOpacity(0.8),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'RobotoMonoLight',
                                  fontWeight: FontWeight.bold,
                                ),
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black.withOpacity(0.8),
                                    ),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.black.withOpacity(0.8),
                                      ),
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                  labelText: 'Descrição',
                                  labelStyle: TextStyle(
                                    color: Colors.black.withOpacity(0.8),
                                  ),
                                  icon: Image.asset(
                                    "assets/Stylus/invoice_description.png",
                                    color: Colors.black.withOpacity(0.8),
                                    height: 55,
                                    width: 55,
                                  ),
                                ),
                                validator: (val) => val.length == 0
                                    ? 'Digite a Descrição da Nota'
                                    : null,
                                onSaved: (val) => this.description = val,
                              ),
                              SizedBox(height: 10),
                              TextFormField(
                                autofocus: false,
                                keyboardType: TextInputType.text,
                                cursorColor: Colors.black.withOpacity(0.8),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'RobotoMonoLight',
                                  fontWeight: FontWeight.bold,
                                ),
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black.withOpacity(0.8),
                                    ),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.black.withOpacity(0.8),
                                      ),
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                  labelText: 'Nome do Destinatário',
                                  labelStyle: TextStyle(
                                    color: Colors.black.withOpacity(0.8),
                                  ),
                                  icon: Image.asset(
                                    "assets/Stylus/invoice_val.png",
                                    color: Colors.black.withOpacity(0.8),
                                    height: 55,
                                    width: 55,
                                  ),
                                ),
                                validator: (val) => val.length == 0
                                    ? 'Digite a Medida do Pescoço'
                                    : null,
                                onSaved: (val) => this.name = val,
                              ),
                              SizedBox(height: 10),
                              TextFormField(
                                autofocus: false,
                                keyboardType: TextInputType.text,
                                cursorColor: Colors.black.withOpacity(0.8),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'RobotoMonoLight',
                                  fontWeight: FontWeight.bold,
                                ),
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black.withOpacity(0.8),
                                    ),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.black.withOpacity(0.8),
                                      ),
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                  labelText: 'Valor da Nota',
                                  labelStyle: TextStyle(
                                    color: Colors.black.withOpacity(0.8),
                                  ),
                                  icon: Image.asset(
                                    "assets/Stylus/invoice_valor.png",
                                    color: Colors.black.withOpacity(0.8),
                                    height: 55,
                                    width: 55,
                                  ),
                                ),
                                validator: (val) => val.length == 0
                                    ? 'Digite o Valor da Nota'
                                    : null,
                                onSaved: (val) => this.val = val,
                              ),
                              SizedBox(
                                height: 35,
                              ),
                              InkWell(
                                child: Material(
                                  borderRadius: BorderRadius.circular(20.0),
                                  elevation: 4.0,
                                  color: Colors.black.withOpacity(0.8),
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Text(
                                      'Gerar Nota',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.0,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  if (this.formKey.currentState.validate()) {
                                    formKey.currentState.save();
                                  } else {
                                    return null;
                                  }
                                  generateExampleDocument();
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => PDFViewerScaffold(
                                          appBar: AppBar(
                                            title: Text("PDF - Nota"),
                                            actions: <Widget>[
                                              IconButton(
                                                icon: Icon(
                                                    FontAwesomeIcons.share),
                                                onPressed: () async {
                                                  final String dir =
                                                      (await getApplicationDocumentsDirectory())
                                                          .path;
                                                  final String path =
                                                      '$dir/Nota - $name.pdf';

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
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
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
