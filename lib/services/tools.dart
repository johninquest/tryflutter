// import 'package:flutter/material.dart';
// import 'dart:async';
// import 'package:intl/intl.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

const String dbPath = '../db/';

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

saveToHive() async {
  await Hive.initFlutter(dbPath);
  var db = await Hive.openBox('myDB');
  await db.put('office', 'Bruchsal');
  var currentOffice = await db.get('office');
  print(currentOffice);
  return currentOffice;
}
