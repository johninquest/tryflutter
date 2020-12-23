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
    String sql = 'SELECT * FROM $tableName';
    final Database db = await initializeDB();
    // var fResponse = await db.query(table)
    var qResponse = await db.rawQuery(sql);
    if (qResponse != null) {
      return qResponse;
    }
  }

  Future addEvent(Map rowData) async {
    String sql = 'INSERT INTO $tableName(eventName, eventTime) VALUES()';
    final Database db = await initializeDB();
    var qReponse = await db.rawInsert(sql);
    if (qReponse != null) {
      return qReponse;
    } else {
      print('Database query failed!');
    }
  }

  Future updateEvent(int rowId, Map rowData) async {
    String sql = 'UPDATE $tableName SET abc = xyz';
    final Database db = await initializeDB();
    var qResult = await db.rawUpdate(sql);
    if (qResult != null) {
      return qResult;
    } else {
      print('Database query failed!');
    }
  }

  deleteEvent(int rowId) async {
    String sql = 'DELETE FROM $tableName WHERE id = $rowId';
    final Database db = await initializeDB();
    var qResult = await db.rawDelete(sql);
    if (qResult != null) {
      return qResult;
    } else {
      print('Database query failed!');
    }
  }

  deleteTable(String tableName) {}

  // Helper sqflite methods

  Future<List<EventModel>> getAllRows() async {
    final Database db = await initializeDB();
    final List<Map<String, dynamic>> eventList = await db.query(tableName);
    return List.generate(eventList.length, (index) {
      return EventModel(
          eventId: eventList[index]['eventId'],
          eventName: eventList[index]['eventName'],
          eventTime: eventList[index]['eventTime']);
    });
  }

  Future<void> insertEvent(EventModel event) async {
    final Database db = await initializeDB();
    await db.insert(tableName, event.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
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
