import 'dart:async';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:gsfit/models/employee.dart';

class DBHelper {
  static Database _db;

  Future<Database> get db async {
    if (_db != null) return _db;
    _db = await initDb();
    return _db;
  }

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "studio_Gs_Fit_db.db");
    var theDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return theDb;
  }

  void _onCreate(Database db, int version) async {
    // When creating the db, create the table
    await db.execute(
        "CREATE TABLE Employee(id INTEGER PRIMARY KEY, firstname TEXT, age TEXT, adress TEXT,sex TEXT,description TEXT,createIn TEXT,payment TEXT,height TEXT,neck TEXT,bicepsL TEXT,chest TEXT,forearmL TEXT,waist TEXT,legL TEXT,calfL TEXT,weight TEXT,shoulders TEXT,bicepsR TEXT,abs TEXT,forearmR TEXT,glutes TEXT,legR TEXT,calfR TEXT,dataStart TEXT,dataEnd TEXT,january TEXT,february TEXT,march TEXT,april TEXT,may TEXT,june TEXT,july TEXT,august TEXT,september TEXT,october TEXT,november TEXT,december TEXT,dataJanuary TEXT,dataFebruary TEXT,dataMarch TEXT,dataApril TEXT,dataMay TEXT,dataJune TEXT,dataJuly TEXT,dataAugust TEXT,dataSeptember TEXT,dataOctober TEXT,dataNovember TEXT,dataDecember TEXT)");
    print("Created tables");
  }

  Future<int> saveEmployee(Employee employee) async {
    var dbClient = await db;
    int res = await dbClient.insert('Employee', employee.toMap());
    return res;
  }

  Future<List<Employee>> getEmployees() async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM Employee');
    List<Employee> employees = new List();
    for (int i = 0; i < list.length; i++) {
      employees.add(new Employee(
          list[i]["firstname"],
          list[i]["age"],
          list[i]["adress"],
          list[i]["sex"],
          list[i]["description"],
          list[i]["createIn"],
          list[i]["payment"],
          list[i]["height"],
          list[i]["neck"],
          list[i]["bicepsL"],
          list[i]["chest"],
          list[i]["forearmL"],
          list[i]["waist"],
          list[i]["legL"],
          list[i]["calfL"],
          list[i]["weight"],
          list[i]["shoulders"],
          list[i]["bicepsR"],
          list[i]["abs"],
          list[i]["forearmR"],
          list[i]["glutes"],
          list[i]["legR"],
          list[i]["calfR"],
          list[i]["dataStart"],
          list[i]["dataEnd"],
          list[i]["january"],
          list[i]["february"],
          list[i]["march"],
          list[i]["april"],
          list[i]["may"],
          list[i]["june"],
          list[i]["july"],
          list[i]["august"],
          list[i]["september"],
          list[i]["october"],
          list[i]["november"],
          list[i]["december"],
          list[i]["dataJanuary"],
          list[i]["dataFebruary"],
          list[i]["dataMarch"],
          list[i]["dataApril"],
          list[i]["dataMay"],
          list[i]["dataJune"],
          list[i]["dataJuly"],
          list[i]["dataAugust"],
          list[i]["dataSeptember"],
          list[i]["dataOctober"],
          list[i]["dataNovember"],
          list[i]["dataDecember"]));
    }
    return employees;
  }

  Future<List<Employee>> getMale() async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery(
        'SELECT * FROM Employee WHERE sex = 0 ORDER BY firstname ASC');
    List<Employee> employees = new List();
    for (int i = 0; i < list.length; i++) {
      employees.add(new Employee(
        list[i]["firstname"],
        list[i]["age"],
        list[i]["adress"],
        list[i]["sex"],
        list[i]["description"],
        list[i]["createIn"],
        list[i]["payment"],
        list[i]["height"],
        list[i]["neck"],
        list[i]["bicepsL"],
        list[i]["chest"],
        list[i]["forearmL"],
        list[i]["waist"],
        list[i]["legL"],
        list[i]["calfL"],
        list[i]["weight"],
        list[i]["shoulders"],
        list[i]["bicepsR"],
        list[i]["abs"],
        list[i]["forearmR"],
        list[i]["glutes"],
        list[i]["legR"],
        list[i]["calfR"],
        list[i]["dataStart"],
        list[i]["dataEnd"],
        list[i]["january"],
        list[i]["february"],
        list[i]["march"],
        list[i]["april"],
        list[i]["may"],
        list[i]["june"],
        list[i]["july"],
        list[i]["august"],
        list[i]["september"],
        list[i]["october"],
        list[i]["november"],
        list[i]["december"],
        list[i]["dataJanuary"],
        list[i]["dataFebruary"],
        list[i]["dataMarch"],
        list[i]["dataApril"],
        list[i]["dataMay"],
        list[i]["dataJune"],
        list[i]["dataJuly"],
        list[i]["dataAugust"],
        list[i]["dataSeptember"],
        list[i]["dataOctober"],
        list[i]["dataNovember"],
        list[i]["dataDecember"],
      ));
    }
    return employees;
  }

  Future<List<Employee>> getFemale() async {
    var dbClient = await db;
    var list = await dbClient.rawQuery(
        'SELECT * FROM Employee WHERE sex = 1 ORDER BY firstname ASC');
    List<Employee> employees = new List();
    for (int i = 0; i < list.length; i++) {
      employees.add(new Employee(
        list[i]["firstname"],
        list[i]["age"],
        list[i]["adress"],
        list[i]["sex"],
        list[i]["description"],
        list[i]["createIn"],
        list[i]["payment"],
        list[i]["height"],
        list[i]["neck"],
        list[i]["bicepsL"],
        list[i]["chest"],
        list[i]["forearmL"],
        list[i]["waist"],
        list[i]["legL"],
        list[i]["calfL"],
        list[i]["weight"],
        list[i]["shoulders"],
        list[i]["bicepsR"],
        list[i]["abs"],
        list[i]["forearmR"],
        list[i]["glutes"],
        list[i]["legR"],
        list[i]["calfR"],
        list[i]["dataStart"],
        list[i]["dataEnd"],
        list[i]["january"],
        list[i]["february"],
        list[i]["march"],
        list[i]["april"],
        list[i]["may"],
        list[i]["june"],
        list[i]["july"],
        list[i]["august"],
        list[i]["september"],
        list[i]["october"],
        list[i]["november"],
        list[i]["december"],
        list[i]["dataJanuary"],
        list[i]["dataFebruary"],
        list[i]["dataMarch"],
        list[i]["dataApril"],
        list[i]["dataMay"],
        list[i]["dataJune"],
        list[i]["dataJuly"],
        list[i]["dataAugust"],
        list[i]["dataSeptember"],
        list[i]["dataOctober"],
        list[i]["dataNovember"],
        list[i]["dataDecember"],
      ));
    }
    return employees;
  }

  Future<int> contagem() async {
    var dbCliente = await db;
    return Sqflite.firstIntValue(
        await dbCliente.rawQuery("SELECT COUNT(*) FROM Employee"));
  }

  Future deletePerson(Employee delete) async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM Employee');
    for (int i = 0; i < list.length; i++) {
      if (list[i]["firstname"] == delete.firstName &&
          list[i]["age"] == delete.age &&
          list[i]["adress"] == delete.adress &&
          list[i]["sex"] == delete.sex) {
        await dbClient.delete('Employee',
            where:
                "firstname = ? AND age = ? AND adress = ? AND sex = ? AND description = ? AND createIn = ?",
            whereArgs: [
              list[i]["firstname"],
              list[i]["age"],
              list[i]["adress"],
              list[i]["sex"],
              list[i]["description"],
              list[i]["createIn"]
            ]);
      }
    }
  }

  Future updatePerson(Employee old, Employee actual) async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM Employee');
    for (int i = 0; i < list.length; i++) {
      if (list[i]["firstname"] == old.firstName &&
          list[i]["age"] == old.age &&
          list[i]["adress"] == old.adress &&
          list[i]["sex"] == old.sex) {
        await dbClient.update('Employee', actual.toMap(),
            where:
                "firstname = ? AND age = ? AND adress = ? AND sex = ? AND description = ? AND createIn = ?",
            whereArgs: [
              list[i]["firstname"],
              list[i]["age"],
              list[i]["adress"],
              list[i]["sex"],
              list[i]["description"],
              list[i]["createIn"]
            ]);
      }
    }
  }

  Future updateBodyPerson(Employee old, Employee actual) async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM Employee');
    for (int i = 0; i < list.length; i++) {
      if (list[i]["firstname"] == old.firstName &&
          list[i]["age"] == old.age &&
          list[i]["adress"] == old.adress &&
          list[i]["sex"] == old.sex) {
        await dbClient.update('Employee', actual.toMap(),
            where:
                "firstname = ? AND age = ? AND adress = ? AND sex = ? AND description = ? AND createIn = ?",
            whereArgs: [
              list[i]["firstname"],
              list[i]["age"],
              list[i]["adress"],
              list[i]["sex"],
              list[i]["description"],
              list[i]["createIn"]
            ]);
      }
    }
  }
}
