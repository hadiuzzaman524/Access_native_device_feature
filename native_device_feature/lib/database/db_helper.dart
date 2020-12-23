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

class LocationHelper{
  final google_api='AIzaSyBg9yn5JtQgKRFbg6FCTy4ewbF24kRuAYI';

  static String getMapImage(double latitude,double longitude){
    return 'https://maps.googleapis.com/maps/api/staticmap?center=Brooklyn+Bridge,New+York,NY&zoom=13&size=600x300&maptype=roadmap &markers=color:blue%7Clabel:S%7C40.702147,-74.015794&markers=color:green%7Clabel:G%7C40.711614,-74.012318 &markers=color:red%7Clabel:C%7C40.718217,-73.998284 &key=AIzaSyBnsQ660Pctzvuu0tLrJTTfOYMPzjMMexA';
  }
}