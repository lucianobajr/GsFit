import 'package:gsfit/models/employee.dart';
import 'package:gsfit/models/payment.dart';
import 'dart:async';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBPayment {
  static Database _db;

  Future<Database> get db async {
    if (_db != null) return _db;
    _db = await initDb();
    return _db;
  }

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "payment.db");
    var theDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return theDb;
  }

  void _onCreate(Database db, int version) async {
    // When creating the db, create the table
    await db.execute(
        "CREATE TABLE Payment(id INTEGER PRIMARY KEY, firstname TEXT, age TEXT, adress TEXT,sex TEXT,description TEXT,createIn TEXT, data TEXT,january TEXT,february TEXT,march TEXT,april TEXT,may TEXT,june TEXT,july TEXT,august TEXT,september TEXT,october TEXT,november TEXT,december TEXT,dataJanuary TEXT,dataFebruary TEXT,dataMarch TEXT,dataApril TEXT,dataMay TEXT,dataJune TEXT,dataJuly TEXT,dataAugust TEXT,dataSeptember TEXT,dataOctober TEXT,dataNovember TEXT,dataDecember TEXT)");
    print("Created tables");
  }

  Future<int> saveEmployee(Payment paymnet) async {
    var dbClient = await db;
    int res = await dbClient.insert('Paymnet', paymnet.toMap());
    return res;
  }

  Future<Payment> getPaymnet(Employee want) async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM Payment');
    Payment payment;
    for (int i = 0; i < list.length; i++) {
      if (list[i]["firstname"] == want.firstName &&
          list[i]["age"] == want.age &&
          list[i]["adress"] == want.adress &&
          list[i]["sex"] == want.sex &&
          list[i]["description"] == want.description &&
          list[i]["createIn"] == want.createIn) {
        payment.firstName = list[i]["firstName"];
        payment.age = list[i]["age"];
        payment.adress = list[i]["adress"];
        payment.sex = list[i]["sex"];
        payment.description = list[i]["description"];
        payment.createIn = list[i]["createIn"];
        payment.data = list[i]["data"];
        payment.january = list[i]["january"];
        payment.february = list[i]["february"];
        payment.march = list[i]["march"];
        payment.april = list[i]["april"];
        payment.may = list[i]["may"];
        payment.june = list[i]["june"];
        payment.july = list[i]["july"];
        payment.august = list[i]["august"];
        payment.september = list[i]["september"];
        payment.october = list[i]["october"];
        payment.november = list[i]["november"];
        payment.december = list[i]["december"];
        payment.dataJanuary = list[i]["dataJanuary"];
        payment.dataFebruary = list[i]["dataFebruary"];
        payment.dataMarch = list[i]["dataMarch"];
        payment.dataApril = list[i]["dataApril"];
        payment.dataMay = list[i]["dataMay"];
        payment.dataJune = list[i]["dataJune"];
        payment.dataJuly = list[i]["dataJuly"];
        payment.dataAugust = list[i]["dataAugust"];
        payment.dataSeptember = list[i]["dataSeptember"];
        payment.dataOctober = list[i]["dataOctober"];
        payment.dataNovember = list[i]["dataNovember"];
        payment.dataDecember = list[i]["dataDecember"];
      }
    }
    return payment;
  }

  Future deletePerson(Employee delete) async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM Payment');
    for (int i = 0; i < list.length; i++) {
      if (list[i]["firstname"] == delete.firstName &&
          list[i]["age"] == delete.age &&
          list[i]["adress"] == delete.adress &&
          list[i]["sex"] == delete.sex) {
        await dbClient.delete('Payment',
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

  Future updatePerson(Employee old, Payment actual) async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM Payment');
    for (int i = 0; i < list.length; i++) {
      if (list[i]["firstname"] == old.firstName &&
          list[i]["age"] == old.age &&
          list[i]["adress"] == old.adress &&
          list[i]["sex"] == old.sex) {
        await dbClient.update('Payment', actual.toMap(),
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
