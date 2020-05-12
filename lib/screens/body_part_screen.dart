import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gsfit/models/body.dart';
import 'package:gsfit/models/bodyPart.dart';
import 'package:gsfit/models/employee.dart';

class BodyScreen extends StatefulWidget {
  final Employee people;
  BodyScreen({@required this.people});

  //widget.people.sex
  @override
  _BodyScreenState createState() => _BodyScreenState();
}

class _BodyScreenState extends State<BodyScreen> {
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

  @override
  Widget build(BuildContext context) {
    final body = widget.people.sex == '1' ? bodyPartFemale : bodyPartMale;
    return Material(
      color: Theme.of(context).primaryColor,
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
                                  keyboardType: TextInputType.number,
                                  cursorColor: Colors.black,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'RobotoMonoLight',
                                    fontWeight: FontWeight.bold,
                                  ),
                                  decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black),
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black),
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                    labelText: body[0].name,
                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                    ),
                                    icon: Image.asset(
                                      body[0].imagePath,
                                      color: Colors.white,
                                      height: 55,
                                      width: 55,
                                    ),
                                  ),
                                  validator: (val) => val.length == 0
                                      ? 'Digite a Altura'
                                      : null,
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
                                        borderSide:
                                            BorderSide(color: Colors.black),
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black),
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                    labelText: body[1].name,
                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                    ),
                                    icon: Image.asset(
                                      body[1].imagePath,
                                      color: Colors.white,
                                      height: 55,
                                      width: 55,
                                    ),
                                  ),
                                  validator: (val) => val.length == 0
                                      ? 'Digite a Medida do Pescoço'
                                      : null,
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
                                        borderSide:
                                            BorderSide(color: Colors.black),
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black),
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                    labelText: body[2].name,
                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                    ),
                                    icon: Image.asset(
                                      body[2].imagePath,
                                      color: Colors.white,
                                      height: 55,
                                      width: 55,
                                    ),
                                  ),
                                  validator: (val) => val.length == 0
                                      ? 'Digite a Medida do Braço Esq'
                                      : null,
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
                                        borderSide:
                                            BorderSide(color: Colors.black),
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black),
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                    labelText: body[3].name,
                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                    ),
                                    icon: Image.asset(
                                      body[3].imagePath,
                                      color: Colors.white,
                                      height: 55,
                                      width: 55,
                                    ),
                                  ),
                                  validator: (val) => val.length == 0
                                      ? 'Digite a Medida do Peito'
                                      : null,
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
                                        borderSide:
                                            BorderSide(color: Colors.black),
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black),
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                    labelText: body[4].name,
                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                    ),
                                    icon: Image.asset(
                                      body[4].imagePath,
                                      color: Colors.white,
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
                                        borderSide:
                                            BorderSide(color: Colors.black),
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black),
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                    labelText: body[5].name,
                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                    ),
                                    icon: Image.asset(
                                      body[5].imagePath,
                                      color: Colors.white,
                                      height: 55,
                                      width: 55,
                                    ),
                                  ),
                                  validator: (val) => val.length == 0
                                      ? 'Digite a Medida da Cintura'
                                      : null,
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
                                        borderSide:
                                            BorderSide(color: Colors.black),
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black),
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                    labelText: body[6].name,
                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                    ),
                                    icon: Image.asset(
                                      body[6].imagePath,
                                      color: Colors.white,
                                      height: 55,
                                      width: 55,
                                    ),
                                  ),
                                  validator: (val) => val.length == 0
                                      ? 'Digite a Medida da Coxa Esq.'
                                      : null,
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
                                        borderSide:
                                            BorderSide(color: Colors.black),
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black),
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                    labelText: body[7].name,
                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                    ),
                                    icon: Image.asset(
                                      body[7].imagePath,
                                      color: Colors.white,
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
                                        borderSide:
                                            BorderSide(color: Colors.black),
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black),
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                    labelText: body[8].name,
                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                    ),
                                    icon: Image.asset(
                                      body[8].imagePath,
                                      color: Colors.white,
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
                                        borderSide:
                                            BorderSide(color: Colors.black),
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black),
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                    labelText: body[9].name,
                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                    ),
                                    icon: Image.asset(
                                      body[9].imagePath,
                                      color: Colors.white,
                                      height: 55,
                                      width: 55,
                                    ),
                                  ),
                                  validator: (val) => val.length == 0
                                      ? 'Digite a Medida dos Ombros'
                                      : null,
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
                                        borderSide:
                                            BorderSide(color: Colors.black),
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black),
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                    labelText: body[10].name,
                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                    ),
                                    icon: Image.asset(
                                      body[10].imagePath,
                                      color: Colors.white,
                                      height: 55,
                                      width: 55,
                                    ),
                                  ),
                                  validator: (val) => val.length == 0
                                      ? 'Digite a Medida do Braço Dir'
                                      : null,
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
                                        borderSide:
                                            BorderSide(color: Colors.black),
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black),
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                    labelText: body[11].name,
                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                    ),
                                    icon: Image.asset(
                                      body[11].imagePath,
                                      color: Colors.white,
                                      height: 55,
                                      width: 55,
                                    ),
                                  ),
                                  validator: (val) => val.length == 0
                                      ? 'Digite a Medida do Abdômen'
                                      : null,
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
                                        borderSide:
                                            BorderSide(color: Colors.black),
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black),
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                    labelText: body[12].name,
                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                    ),
                                    icon: Image.asset(
                                      body[12].imagePath,
                                      color: Colors.white,
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
                                        borderSide:
                                            BorderSide(color: Colors.black),
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black),
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                    labelText: body[13].name,
                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                    ),
                                    icon: Image.asset(
                                      body[13].imagePath,
                                      color: Colors.white,
                                      height: 55,
                                      width: 55,
                                    ),
                                  ),
                                  validator: (val) => val.length == 0
                                      ? 'Digite a Medida dos Glúteos'
                                      : null,
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
                                        borderSide:
                                            BorderSide(color: Colors.black),
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black),
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                    labelText: body[14].name,
                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                    ),
                                    icon: Image.asset(
                                      body[14].imagePath,
                                      color: Colors.white,
                                      height: 55,
                                      width: 55,
                                    ),
                                  ),
                                  validator: (val) => val.length == 0
                                      ? 'Digite a Medida da Coxa Dir'
                                      : null,
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
                                        borderSide:
                                            BorderSide(color: Colors.black),
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black),
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                    labelText: body[15].name,
                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                    ),
                                    icon: Image.asset(
                                      body[15].imagePath,
                                      color: Colors.white,
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
                                  height:130,
                                ),
                                Material(
                                  borderRadius: BorderRadius.circular(20.0),
                                  elevation: 4.0,
                                  color: Colors.black,
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: InkWell(
                                      child: Text(
                                        'Confirmar Medidas',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18.0,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      onTap: () => _submit(),
                                    ),
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
              ),
            )
          ])),
    );
  }

  void _submit() {
    if (this.formKey.currentState.validate()) {
      formKey.currentState.save();
    } else {
      return null;
    }
    var body = Body(
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
      calfR,
    );

    Navigator.pop(context,body);
  }
}
