import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:gsfit/models/afazer.dart';

class DbAjudante {
  static final DbAjudante _instance = new DbAjudante.internal();

  factory DbAjudante() => _instance;

  final String nomeTabela = "afazeresTabela";
  final String colunaId = "id";
  final String afazeresNome = "nome";
  final String afazeresDataCriado = "data";

  static Database _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  DbAjudante.internal();

  initDb() async {
    Directory documentoDirectorio = await getApplicationDocumentsDirectory();
    String path = join(documentoDirectorio.path, "afazeres_db.db");
    var nossaDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return nossaDb;
  }

  void _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE $nomeTabela(id INTEGER PRIMARY KEY, $afazeresNome TEXT,$afazeresDataCriado TEXT)");
  }

  //insertion
  Future<int> salvarAfazer(Afazer item) async {
    var dbCliente = await db;
    int res = await dbCliente.insert("$nomeTabela", item.toMap());
    print(res.toString());
    return res;
  }

  //Get
  Future<List> recuperarTodosAfazeres() async {
    var dbCliente = await db;
    var res = await dbCliente
        .rawQuery("SELECT * FROM $nomeTabela ORDER BY $afazeresNome ASC");

    return res.toList();
  }

  Future<int> contagem() async {
    var dbCliente = await db;
    return Sqflite.firstIntValue(
        await dbCliente.rawQuery("SELECT COUNT(*) FROM $nomeTabela"));
  }

  Future<Afazer> recuperarAfazer(int id) async {
    var dbCliente = await db;
    var res =
        await dbCliente.rawQuery("SELECT * FROM $nomeTabela WHERE id = $id");
    if (res.length == 0) return null;
    return new Afazer.fromMap(res.first);
  }

  Future<int> apagarAfazer(int id) async {
    var dbClient = await db;
    return await dbClient
        .delete(nomeTabela, where: "$colunaId = ?", whereArgs: [id]);
  }

  Future<int> atualizarAfazer(Afazer item) async {
    var dbCliente = await db;
    return await dbCliente.update("$nomeTabela", item.toMap(),
        where: "$colunaId = ?", whereArgs: [item.id]);
  }

  Future fechar () async{
    var dbCliente = await db;
    return dbCliente.close();
  }
}
