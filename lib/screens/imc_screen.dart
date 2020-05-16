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
  int selectPeoplesIconIndex = 0;

  final scaffoldKey = new GlobalKey<ScaffoldState>();

  final formKey = new GlobalKey<FormState>();

  String height; //0
  String width; //1
  String imc = '';
  double res = 0;
  String ideal = '';

  List<String> peoplesList = [
    'Homem',
    'Mulher',
  ];

  List<IconData> peopleIcons = [
    FontAwesomeIcons.male,
    FontAwesomeIcons.female,
  ];

  Widget buildPeopleIcon(int index) {
    return Padding(
      padding: const EdgeInsets.only(left: 60.0, right: 30.0),
      child: Column(
        children: <Widget>[
          InkWell(
            onTap: () {
              setState(() {
                selectPeoplesIconIndex = index;
              });
            },
            child: Material(
              color: selectPeoplesIconIndex == index
                  ? Colors.black.withOpacity(0.8)
                  : Colors.white,
              elevation: 8.0,
              borderRadius: BorderRadius.circular(20.0),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Icon(peopleIcons[index],
                    size: 30.0,
                    color: selectPeoplesIconIndex == index
                        ? Colors.white
                        : Colors.black.withOpacity(0.8)),
              ),
            ),
          ),
          SizedBox(
            height: 12.0,
          ),
          Text(
            peoplesList[index],
            style: TextStyle(
              color: Colors.black.withOpacity(0.8),
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
    final screenWidth = MediaQuery.of(context).size.width;
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
                        '     IMC',
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
                  'assets/Stylus/imc_page.png',
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
                                keyboardType: TextInputType.number,
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
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                  labelText: 'Altura(m)',
                                  labelStyle: TextStyle(
                                    color: Colors.black.withOpacity(0.8),
                                  ),
                                  icon: Image.asset(
                                    'assets/icons/height.png',
                                    color: Colors.black.withOpacity(0.8),
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
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                  labelText: 'Peso(kg)',
                                  labelStyle: TextStyle(
                                    color: Colors.black.withOpacity(0.8),
                                  ),
                                  icon: Image.asset(
                                    "assets/icons/weight.png",
                                    color: Colors.black.withOpacity(0.8),
                                    height: 55,
                                    width: 55,
                                  ),
                                ),
                                validator: (val) => val.length == 0
                                    ? 'Digite a Medida do Pescoço'
                                    : null,
                                onSaved: (val) => this.width = val,
                              ),
                              SizedBox(height: 30),
                              Container(
                                height: 120.0,
                                child: ListView.builder(
                                    padding:
                                        EdgeInsets.only(left: 24.0, top: 8.0),
                                    scrollDirection: Axis.horizontal,
                                    itemCount: peoplesList.length,
                                    itemBuilder: (context, index) {
                                      return buildPeopleIcon(index);
                                    }),
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
                                      'Calcular',
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
                                  _calcularIMC();
                                },
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Material(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                elevation: 6.0,
                                child: Container(
                                  height: 200,
                                  width: screenWidth,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Column(
                                    children: <Widget>[
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Align(
                                        child: Text(
                                          'IMC = ${res.toStringAsFixed(1)}',
                                          style: TextStyle(
                                            fontFamily: 'Lobster',
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Align(
                                        child: Text(
                                          'Você está $imc',
                                          style: TextStyle(
                                            fontFamily: 'Lobster',
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Align(
                                        child: Text(
                                          'O seu peso ideal é $ideal',
                                          style: TextStyle(
                                            fontFamily: 'Lobster',
                                            fontSize: 20,
                                          ),
                                        ),
                                      )
                                    ],
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
          ),
        ],
      ),
    );
  }

  _calcularIMC() {
    if (this.formKey.currentState.validate()) {
      formKey.currentState.save();
    } else {
      return null;
    }
    setState(() {
      res = double.parse(width) / (double.parse(height) * double.parse(height));
      if (double.parse(res.toStringAsFixed(1)) < 18.5) {
        imc = "Abaixo do Peso";
      } else if (double.parse(res.toStringAsFixed(1)) > 18.5 &&
          double.parse(res.toStringAsFixed(1)) < 24.9) {
        imc = "com Peso Normal";
      } else if (double.parse(res.toStringAsFixed(1)) > 25 &&
          double.parse(res.toStringAsFixed(1)) < 29.9) {
        imc = "com Sobrepeso";
      } else if (double.parse(res.toStringAsFixed(1)) > 30 &&
          double.parse(res.toStringAsFixed(1)) < 34.9) {
        imc = "com Obesidade 1";
      } else if (double.parse(res.toStringAsFixed(1)) > 35 &&
          double.parse(res.toStringAsFixed(1)) < 39.9) {
        imc = "com Obesidade 2";
      } else if (double.parse(res.toStringAsFixed(1)) > 40) {
        imc = "com Obesidade 3";
      }
      double aux = 21.75 * (double.parse(height) * double.parse(height));
      ideal = aux.toStringAsFixed(1);
    });
  }
}
