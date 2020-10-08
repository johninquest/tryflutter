// import 'package:flutter/material.dart';
// import 'dart:async';
// import 'package:intl/intl.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

const String dbPath = '../db/';

liveClock() {
  var dt = new DateTime.now();
  return dt.toString();
}

saveToHive() async {
  await Hive.initFlutter(dbPath);
  var db = await Hive.openBox('myDB');
  await db.put('office', 'Bruchsal');
  var currentOffice = await db.get('office');
  print(currentOffice);
  return currentOffice;
}
