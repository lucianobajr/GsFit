import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:gsfit/models/people.dart';

class DbHelper {
  static DbHelper _instance = new DbHelper.internal();

  factory DbHelper() => _instance;

  final String tableName = "pupils";
  final String colunaId = "id";
  final String name = "Nome";
  final int age = null;
  final String adress = "Endereço";
  final bool isFemale = null;
  final String imageUrl = "Url";

  static Database _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  DbHelper.internal();

  initDb() async {
    Directory directoryDocument = await getApplicationDocumentsDirectory();
    String path = join(directoryDocument.path, "pupils_db.db");
    var ourDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return ourDb;
  }

  void _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE $tableName(id INTEGER PRIMARY KEY, $name TEXT,$age INTEGER,$adress TEXT,$isFemale NUMERIC,$imageUrl TEXT)");
  }

  //----------------------------- CRUD ------------------------------------------------

  //Insertion
  Future<int> savePeople(People newPerson) async {
    var clientDb = await db;
    int res = await clientDb.insert("$tableName", newPerson.toMap());
    return res;
  }

  //Get
  Future<List> recoverAllPeople() async {
    var clientDb = await db;

    var res =
        await clientDb.rawQuery("SELECT * FROM $tableName ORDER BY $name ASC ");

    return res.toList();
  }

  //number of pupils is registeresd
  Future<int> score() async {
    var clientDb = await db;

    return Sqflite.firstIntValue(
        await clientDb.rawQuery("SELECT COUNT(*) FROM $tableName"));
  }

  Future<People> recoverPerson(int id) async {
    var clientDb = await db;
    var res = await clientDb.rawQuery("SELECT * FROM $tableName WHERE i = $id");
    if(res.length == 0) return null;
    return new People.fromMap(res.first);
  }

  Future<int> deletePerson(int id) async {
    var clientDb = await db;
    return await clientDb.delete(tableName,where: "$colunaId = ?",whereArgs: [id]);
  }

  Future<int> updatePerson(People updatePerson) async{
    var clientDb  = await db;

    return await clientDb.update("$tableName", updatePerson.toMap(),where: "$colunaId = ?",whereArgs: [updatePerson.id]);
  }

  Future<List> man() async {
    var clientDb = await db;

    var res =
        await clientDb.rawQuery("SELECT * FROM $tableName  WHERE $isFemale = 0 ORDER BY $name ASC ");

    return res.toList();
  }

    Future<List> female() async {
    var clientDb = await db;

    var res =
        await clientDb.rawQuery("SELECT * FROM $tableName  WHERE $isFemale = 1 ORDER BY $name ASC ");

    return res.toList();
  }

  Future close() async{
    var clientDb = await db;
    return clientDb.close();
  }

}
