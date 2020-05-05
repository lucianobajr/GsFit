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
    String path = join(documentsDirectory.path, "final.db");
    var theDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return theDb;
  }

  void _onCreate(Database db, int version) async {
    // When creating the db, create the table
    await db.execute(
        "CREATE TABLE Employee(id INTEGER PRIMARY KEY, firstname TEXT, age TEXT, adress TEXT,sex TEXT)");
    print("Created tables");
  }

  void saveEmployee(Employee employee) async {
    var dbClient = await db;
    await dbClient.transaction((txn) async {
      return await txn.rawInsert(
          'INSERT INTO Employee(firstname, age, adress, sex) VALUES(' +
              '\'' +
              employee.firstName +
              '\'' +
              ',' +
              '\'' +
              employee.age +
              '\'' +
              ',' +
              '\'' +
              employee.adress +
              '\'' +
              ',' +
              '\'' +
              employee.sex +
              '\'' +
              ')');
    });
  }

  Future<List<Employee>> getEmployees() async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM Employee');
    List<Employee> employees = new List();
    for (int i = 0; i < list.length; i++) {
      employees.add(new Employee(list[i]["firstname"], list[i]["age"],
          list[i]["adress"], list[i]["sex"]));
    }
    return employees;
  }

  Future<List<Employee>> getMale() async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM Employee');
    List<Employee> employees = new List();
    for (int i = 0; i < list.length; i++) {
      if (int.parse(list[i]["sex"]) == 0) {
        employees.add(new Employee(list[i]["firstname"], list[i]["age"],
            list[i]["adress"], list[i]["sex"]));
      }
    }
    return employees;
  }

  Future<List<Employee>> getFemale() async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM Employee');
    List<Employee> employees = new List();
    for (int i = 0; i < list.length; i++) {
      if (int.parse(list[i]["sex"]) == 1) {
        employees.add(new Employee(list[i]["firstname"], list[i]["age"],
            list[i]["adress"], list[i]["sex"]));
      }
    }
    return employees;
  }
}
