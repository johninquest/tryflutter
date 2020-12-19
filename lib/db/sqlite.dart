import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:io';
import 'dart:async';
import './data_models.dart';

class SqliteDbOperations {
  static String dbName = 'data.db';
  // static int dbVersion = 1;
  static String tableName = 'eventTable';

  Future<Database> initializeDB() async {
    Directory directory = await getApplicationDocumentsDirectory();
    var dbPath = join(directory.path, dbName);
    var dbOpened = await openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) async {
        String sql =
            '''CREATE TABLE IF NOT EXISTS $tableName (id INTEGER PRIMARY KEY AUTOINCREMENT, eventName TEXT, eventTime TEXT)''';
        await db.execute(sql);
      },
    );
    return dbOpened;
  }

  Future getAllEvents() async {
    String sql = 'SELECT * FROM $tableName';
    var db = await initializeDB();
    var qResponse = await db.rawQuery(sql);
    if (qResponse != null) {
      return qResponse;
    }
  }

  Future addEvent(Map rowData) async {
    String sql = 'INSERT INTO $tableName(eventName, eventTime) VALUES()';
    var db = await initializeDB();
    var qReponse = await db.rawInsert(sql);
    if (qReponse != null) {
      return qReponse;
    } else {
      print('Database query failed!');
    }
  }

  Future updateEvent(int rowId, Map rowData) async {
    String sql = 'UPDATE $tableName SET abc = xyz';
    var db = await initializeDB();
    var qResult = await db.rawUpdate(sql);
    if (qResult != null) {
      return qResult;
    } else {
      print('Database query failed!');
    }
  }

  deleteEvent(int rowId) async {
    String sql = 'DELETE FROM $tableName WHERE id = $rowId';
    var db = await initializeDB();
    var qResult = await db.rawDelete(sql);
    if (qResult != null) {
      return qResult;
    }else {
      print('Database query failed!');
    }
  }

  deleteTable(String tableName) {}
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
