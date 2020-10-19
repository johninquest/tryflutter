var tableName;
String createTable =
    'CREATE TABLE $tableName (id INT, actionName TEXT, actionTimestamp TEXT)';

String addRowToTable =
    'INSERT INTO $tableName(actionName, actionTimestamp) VALUES()';

String updateRowInTable = 'UPDATE $tableName SET abc = xyz';

String deleteRowInTable = 'DELETE FROM $tableName WHERE id = xyz';
