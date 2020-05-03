import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gsfit/models/afazer.dart';
import 'package:gsfit/database/db_ajudante.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class AfazeresTela extends StatefulWidget {
  @override
  _AfazeresTelaState createState() => _AfazeresTelaState();
}

class _AfazeresTelaState extends State<AfazeresTela> {
  final TextEditingController _control = new TextEditingController();
  var db = new DbAjudante();
  final List<Afazer> _afazerLista = <Afazer>[];

  @override
  void initState() {
    super.initState();
    _pegarAfazers();
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
                //InkWell(
                /*child:*/ Icon(
                  FontAwesomeIcons.bars,
                ),
                //onTap: widget.menuCallback,
                //),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Compromissos',
                        style: TextStyle(
                          fontFamily: 'Ultra',
                          fontSize: 25.0,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(FontAwesomeIcons.calendarAlt,
                    size: 40, color: Theme.of(context).primaryColor)
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Theme.of(context).primaryColor.withOpacity(0.06),
                ),
                child: Column(
                  children: <Widget>[
                    Flexible(
                      child: ListView.builder(
                        itemCount: _afazerLista.length,
                        padding: const EdgeInsets.all(8.0),
                        itemBuilder: (_, int posicao) {
                          return Card(
                            color: Colors.white,
                            child: ListTile(
                              title: _afazerLista[posicao],
                              onLongPress: () => _atualizarAfazer(
                                  _afazerLista[posicao], posicao),
                              trailing: Listener(
                                key: Key(_afazerLista[posicao].afazerNome),
                                child: Icon(
                                  Icons.remove_circle,
                                  color: Theme.of(context).primaryColor,
                                ),
                                onPointerDown: (pointerEvento) => _apagarAfazer(
                                    _afazerLista[posicao].id, posicao),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 50, left: 290),
                      child: FloatingActionButton(
                        backgroundColor: Theme.of(context).primaryColor,
                        child: ListTile(
                          title: Icon(Icons.add),
                        ),
                        onPressed: _mostrarFormulario,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]));
  }

  void _pegarAfazers() async {
    List afazeres = await db.recuperarTodosAfazeres();
    afazeres.forEach((item) {
      setState(() {
        _afazerLista.add(Afazer.map(item));
      });
    });
  }

  void _mostrarFormulario() {
    var alert = AlertDialog(
      content: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: _control,
              autofocus: true,
              cursorColor: Theme.of(context).primaryColor,
              style: TextStyle(
                  fontFamily: 'RobotoMonoLight', fontWeight: FontWeight.w500),
              decoration: InputDecoration(
                  labelText: 'Compromisso',
                  labelStyle: TextStyle(fontSize: 20),
                  hintText: 'Adicionar novo aluno',
                  icon: Icon(
                    FontAwesomeIcons.solidCheckSquare,
                    size: 20,
                  )),
            ),
          )
        ],
      ),
      actions: <Widget>[
        FlatButton(
            onPressed: () {
              _lidarComTexto(_control.text);
              _control.clear();
              Navigator.pop(context);
            },
            child: Text(
              'Salvar',
              style: TextStyle(color: Theme.of(context).primaryColor),
            ))
      ],
    );
    showDialog(
        context: context,
        builder: (_) {
          return alert;
        });
  }

  void _lidarComTexto(String text) async {
    _control.clear();
    Afazer afazer = new Afazer(text, dataFormatada());

    int salvoId = await db.salvarAfazer(afazer);

    Afazer itemSalvo = await db.recuperarAfazer(salvoId);

    setState(() {
      _afazerLista.insert(0, itemSalvo);
    });
  }

  String dataFormatada() {
    var agora = DateTime.now();
    initializeDateFormatting("pt_BR", null);
    var formatador = new DateFormat.yMMMd("pt_BR");

    return formatador.format(agora);
  }

  _atualizarAfazer(Afazer afazer, int posicao) {
    var alert = AlertDialog(
      title: Text("Atualizar Compromisso"),
      content: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: _control,
              autofocus: true,
              cursorColor: Theme.of(context).primaryColor,
              style: TextStyle(
                  fontFamily: 'RobotoMonoLight', fontWeight: FontWeight.w500),
              decoration: InputDecoration(
                  labelText: "Compromisso",
                  icon: Icon(
                    FontAwesomeIcons.wrench,
                    size: 35,
                  )),
            ),
          )
        ],
      ),
      actions: <Widget>[
        FlatButton(
            onPressed: () async {
              Afazer atualizarItem = Afazer.fromMap({
                "nome": _control.text,
                "data": dataFormatada(),
                "id": afazer.id
              });

              _lidarComAtualizacao(posicao, afazer);

              await db.atualizarAfazer(atualizarItem);
              setState(() {
                _pegarAfazers();
                Navigator.pop(context);
              });
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

  void _lidarComAtualizacao(int posicao, Afazer afazer) {
    setState(() {
      _afazerLista.removeWhere((elemento) {
        _afazerLista[posicao].afazerNome == afazer.afazerNome;
      });
    });
  }

  _apagarAfazer(int id, int posicao) async {
    await db.apagarAfazer(id);

    setState(() {
      _afazerLista.removeAt(posicao);
    });
  }
}
