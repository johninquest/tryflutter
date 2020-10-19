// import 'package:flutter/material.dart';
// import 'dart:async';
// import 'package:intl/intl.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

liveClock() {
  var dt = new DateTime.now();
  var dayNow = dt.day;
  var monthNow = dt.month;
  var yearNow = dt.year;
  var hourNow = dt.hour;
  var minuteNow = dt.minute;
  var secondNow = dt.second;
  return 'Date: $dayNow.$monthNow.$yearNow \nTime: $hourNow:$minuteNow:$secondNow';
}

// Specs for interaction with HiveDB
class MyHiveDB {
  void initializeDatabasePath() async {
    final appDocDir = await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDocDir.path);
  }

  void initializeHiveBox() async {
    await Hive.openBox('timedata');
  }

  getDataFromBox() {}
  saveDataToBox() {}
  deleteDataInBox() {}
}
