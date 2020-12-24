import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:io';
import 'dart:async';
import './data_models.dart';

class SqliteDbHelper {
  final String dbName = 'appdata.db';
  // int dbVersion = 1;
  static String tableName = 'eventTable';

  Future<Database> initializeDB() async {
    Directory directory = await getApplicationDocumentsDirectory();
    var dbPath = join(directory.path, dbName);
    var dbOpened = await openDatabase(dbPath, onCreate: (db, version) async {
      String sql =
          'CREATE TABLE IF NOT EXISTS $tableName (id INTEGER PRIMARY KEY AUTOINCREMENT, eventName TEXT, eventTime TEXT)';
      await db.execute(sql);
    }, version: 1);
    return dbOpened;
  }

  // Raw sql methods
  Future getAllEvents() async {
    final Database db = await initializeDB();
    if (db != null) {
      String sql = 'SELECT * FROM $tableName';
      return await db.rawQuery(sql);
      // print(await db.rawQuery(sql));
      // Response type => Future<List<Map<String, dynamic>>>
    } else {
      print('SQL SELECT query returned an error!');
    }
  }

  Future getOneEvent(int rowId) async {
    final Database db = await initializeDB();
    // var qResult = await db.rawQuery(sql);
    if (db != null) {
      String sql = 'SELECT * FROM $tableName WHERE eventId = $rowId';
      await db.rawQuery(sql);
      print(await db.rawQuery(sql));
    } else {
      print('SQL SELECT query returned an error!');
    }
  }

  Future<void> addEvent(String eName, String eTime) async {
    final Database db = await initializeDB();
    // var qResult = await db.rawInsert(sql);
    if (db != null) {
      String sql =
          'INSERT INTO $tableName(eventName, eventTime) VALUES("$eName", "$eTime")';
      await db.rawInsert(sql);
    } else {
      print('SQL INSERT query returned an error!');
    }
  }

  Future<void> updateEvent(int rowId, String eTime) async {
    final Database db = await initializeDB();
    // var qResult = await db.rawUpdate(sql);
    if (db != null) {
      String sql =
          'UPDATE $tableName SET eventTime = "$eTime" WHERE id = $rowId';
      await db.rawUpdate(sql);
    } else {
      print('SQL UPDATE query returned an error');
    }
  }

  Future deleteEvent(int rowId) async {
    String sql = 'DELETE FROM $tableName WHERE id = $rowId';
    final Database db = await initializeDB();
    var qResult = await db.rawDelete(sql);
    if (qResult != null) {
      return qResult;
    } else {
      print('SQL DELETE query returned an error');
    }
  }

  deleteTable(String tableName) {}

  // Helper sqflite methods
  Future<List<EventModel>> getAllRows() async {
    final Database db = await initializeDB();
    final List<Map<String, dynamic>> eventList = await db.query(tableName);
    return List.generate(eventList.length, (index) {
      return EventModel(
          id: eventList[index]['id'],
          eventName: eventList[index]['eventName'],
          eventTime: eventList[index]['eventTime']);
    });
  }

  Future<void> addRow(EventModel event) async {
    final Database db = await initializeDB();
    await db.insert(tableName, event.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> updateRow(EventModel event) async {
    final Database db = await initializeDB();
    await db.update(tableName, event.toMap(),
        where: 'id = ?', whereArgs: [event.id]);
  }
}

class SqfliteModel {}

/* SQL Queries
String sqlCreateTable =
    '''CREATE TABLE IF NOT EXISTS $tableName (id INTEGER PRIMARY KEY AUTOINCREMENT, eventName TEXT, eventTime TEXT)''';

String sqlAddRowToTable =
    '''INSERT INTO $tableName(actionName, actionTimestamp) VALUES()''';

String sqlUpdateRowInTable = '''UPDATE $tableName SET abc = xyz''';

String sqlDeleteRowInTable = '''DELETE FROM $tableName WHERE id = xyz''';

*/

class EventDatabaseHelper {}
