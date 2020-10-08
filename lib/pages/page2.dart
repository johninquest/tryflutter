import 'package:flutter/material.dart';
import 'styles.dart';
import '../services/tools.dart';
// import '../services/web.dart';
// import 'package:http/http.dart' as http;
// import 'dart:async';
// import 'dart:convert';
// import 'package:hive/hive.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    //  DateTime dt = new DateTime.now();
    //  String timeString = "${dt.hour}:${dt.minute}:${dt.second}";
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Page 2',
            style: MyAppBarStyle,
          ),
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.all(20.0),
              child: Center(
                  child: Text(
                'Welcome to Page 2',
                style: MyTextStyle,
              )),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.0),
              child: Text(
                'Time: ' + liveClock(),
                style: MyTextStyle,
              ),
            ),
            Container(
              margin: EdgeInsets.all(20.0),
              child: Icon(Icons.favorite, color: Colors.red, size: 30.0),
            ),
            // Container(child: Text(saveToHive()),)
          ],
        ));
  }
}

class MyPubIp extends StatelessWidget {
  final String _ipString;
  MyPubIp(this._ipString);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        _ipString,
        style: MyTextStyle,
      ),
    );
  }
}

class MyButton2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      // color: Colors.blue,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0), color: Colors.blue),
      child: FlatButton(
          onPressed: saveToHive(),
          child: Text(
            'SAVE TO HIVE',
            style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          )),
    );
  }

 /*  _saveToHive() async {
    var db = await Hive.openBox('myDB');
    await db.put('office', 'Bruchsal');
    var currentOffice = await db.get('office');
    debugPrint(currentOffice);
  } */
}
