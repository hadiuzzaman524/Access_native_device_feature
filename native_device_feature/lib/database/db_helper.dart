import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class DBHelper {


  static Future<sql.Database> database() async {
    final dbPath = await sql.getDatabasesPath();
    // return database path or simply return folder which database can store
    // then path.join return exact database if database exist then return existing database otherwise create new one using onCreate
    return await sql.openDatabase(path.join(dbPath, 'places.db'),
        onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE user_places(id TEXT PRIMARY KEY,title TEXT,image TEXT)');
    }, version: 1);
  }

  static Future<void> insert(String table, Map<String, Object> data) async {
    final sqlDB= await DBHelper.database();

    await sqlDB.insert(table, data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);

  }

  static Future<List<Map<String,dynamic>>> getData(String table) async{
    final sqlDB= await DBHelper.database();
    return sqlDB.query(table);
}



}
