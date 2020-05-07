import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gsfit/screens/bodily_screen.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gsfit/models/employee.dart';
import 'package:gsfit/database/dbhelper.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:status_alert/status_alert.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

var parser = EmojiParser();

class NewPersonPage extends KFDrawerContent {
  @override
  _NewPersonPageState createState() => _NewPersonPageState();
}

class _NewPersonPageState extends State<NewPersonPage> {
  Employee employee = new Employee("", "", "", "", "", "");
  int selectPeopleIconIndex = 0;
  String firstname;
  String age;
  String adress;
  String description;

  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();

  List<String> sexList = [
    'Homem',
    'Mulher',
  ];

  List<IconData> peopleIcons = [
    FontAwesomeIcons.mars,
    FontAwesomeIcons.venus,
  ];

  Widget buildPeopleIcon(int index) {
    return Padding(
      padding: const EdgeInsets.only(left: 60.0, right: 30.0),
      child: Column(
        children: <Widget>[
          InkWell(
            onTap: () {
              setState(() {
                selectPeopleIconIndex = index;
              });
            },
            child: Material(
              color: selectPeopleIconIndex == index
                  ? Theme.of(context).primaryColor
                  : Colors.white,
              elevation: 8.0,
              borderRadius: BorderRadius.circular(20.0),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Icon(
                  peopleIcons[index],
                  size: 20.0,
                  color: selectPeopleIconIndex == index
                      ? Colors.white
                      : Theme.of(context).primaryColor,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 12.0,
          ),
          Text(
            sexList[index],
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 16.0,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

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
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Cadastro',
                        style: TextStyle(
                          fontFamily: 'Ultra',
                          fontSize: 25.0,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(FontAwesomeIcons.addressCard,
                    size: 40, color: Theme.of(context).primaryColor),
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
                              borderRadius: BorderRadius.circular(20.0)),
                          padding: EdgeInsets.symmetric(horizontal: 12.0),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Form(
                          key: formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                autofocus: false,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color:
                                                Theme.of(context).primaryColor),
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black),
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                    labelText: 'Primeiro Nome',
                                    labelStyle: TextStyle(
                                        color: Theme.of(context).primaryColor),
                                    icon: Icon(
                                      FontAwesomeIcons.signature,
                                      color: Theme.of(context).primaryColor,
                                    )),
                                validator: (val) =>
                                    val.length == 0 ? "Digite seu nome" : null,
                                onSaved: (val) => this.firstname = val,
                                cursorColor: Theme.of(context).primaryColor,
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
                                cursorColor: Theme.of(context).primaryColor,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'RobotoMonoLight',
                                  fontWeight: FontWeight.bold,
                                ),
                                decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color:
                                                Theme.of(context).primaryColor),
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black),
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                    labelText: 'Idade',
                                    labelStyle: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    icon: Icon(
                                      FontAwesomeIcons.hourglassHalf,
                                      color: Theme.of(context).primaryColor,
                                    )),
                                validator: (val) =>
                                    val.length == 0 ? 'Digite sua idade' : null,
                                onSaved: (val) => this.age = val,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                autofocus: false,
                                keyboardType: TextInputType.text,
                                cursorColor: Theme.of(context).primaryColor,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'RobotoMonoLight',
                                  fontWeight: FontWeight.bold,
                                ),
                                decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color:
                                                Theme.of(context).primaryColor),
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black),
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                    labelText: 'Endereço',
                                    labelStyle: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    icon: Icon(
                                      FontAwesomeIcons.mapMarkedAlt,
                                      color: Theme.of(context).primaryColor,
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
                                minLines: 8,
                                maxLines: 9,
                                keyboardType: TextInputType.text,
                                cursorColor: Theme.of(context).primaryColor,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'RobotoMonoLight',
                                  fontWeight: FontWeight.bold,
                                ),
                                decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color:
                                                Theme.of(context).primaryColor),
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black),
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                    labelText: 'Descrição',
                                    labelStyle: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    icon: Icon(
                                      FontAwesomeIcons.commentAlt,
                                      color: Theme.of(context).primaryColor,
                                    )),
                                validator: (val) => val.length == 0
                                    ? 'Digite uma Descrição'
                                    : null,
                                onSaved: (val) => this.description = val,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                height: 100.0,
                                child: ListView.builder(
                                  padding:
                                      EdgeInsets.only(left: 24.0, top: 8.0),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: sexList.length,
                                  itemBuilder: (context, index) {
                                    return buildPeopleIcon(index);
                                  },
                                ),
                              ),
                              Container(
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 22.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Material(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        elevation: 4.0,
                                        color: Theme.of(context).primaryColor,
                                        child: Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: InkWell(
                                            onTap: () {
                                              return Navigator.push(context,
                                                  MaterialPageRoute(
                                                      builder: (context) {
                                                return BodyDetail(
                                                    people: new Employee(firstname, age, adress, selectPeopleIconIndex.toString(), description, dataFormatada()));
                                              })); //mudar
                                            },
                                            child: Icon(
                                              FontAwesomeIcons.child,
                                              color: Colors.white,
                                              size: 25,
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
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            elevation: 4.0,
                                            color:
                                                Theme.of(context).primaryColor,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(20.0),
                                              child: Text(
                                                'Salvar',
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
                                            _submit();
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                height: 150,
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
          )
        ]));
  }

  void _submit() {
    if (this.formKey.currentState.validate()) {
      formKey.currentState.save();
    } else {
      return null;
    }
    var employee = Employee(
      firstname,
      age,
      adress,
      selectPeopleIconIndex.toString(),
      description,
      dataFormatada(),
    );
    var dbHelper = DBHelper();
    dbHelper.saveEmployee(employee);

    StatusAlert.show(
      context,
      duration: Duration(seconds: 1),
      title: 'Salvo',
      subtitle: 'Aluno Cadastrado Com Sucesso',
      configuration: IconConfiguration(icon: FontAwesomeIcons.check),
    );
  }

  String dataFormatada() {
    var agora = DateTime.now();
    initializeDateFormatting("pt_BR", null);
    var formatador = new DateFormat.yMMMd("pt_BR");

    return formatador.format(agora);
  }
}
