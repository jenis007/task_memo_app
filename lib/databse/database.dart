import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LocalDataBase {
  static Database? database;

  static createDb() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'product.db');

    database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('CREATE TABLE Data (id INTEGER, value TEXT)');
    });
  }

  /// FOR PRODUCT
  insertEncryptData(Map<String, dynamic> data) async {
    await database!.insert('Data', data);
  }

  fetchEncryptData() async {
    return await database!.query('Data');
  }
}
