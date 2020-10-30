
class SqliteDbOperations {

  createDB(String dbName) {}

  createTable(String tableName, Object tableColumns) {}

  addRowToTable(String tableName, Object rowData) {}

  updateRowInTable(int rowId, Object rowData) {}

  deleteRowInTable(int rowId) {}

  deleteTable(String tableName) {}
}


String tableName;
String createTable = 'CREATE TABLE $tableName (id INT, actionName TEXT, actionTimestamp TEXT)';

String addRowToTable = '''INSERT INTO $tableName(actionName, actionTimestamp) VALUES()''';

String updateRowInTable = 'UPDATE $tableName SET abc = xyz';

String deleteRowInTable = 'DELETE FROM $tableName WHERE id = xyz';
