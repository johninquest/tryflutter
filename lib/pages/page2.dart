import 'package:flutter/material.dart';
import 'styles.dart';
import '../services/tools.dart';
//import '../services/web.dart';
// import 'package:http/http.dart' as http;
// import 'dart:async';
// import 'dart:convert';
import 'dart:async';
// import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';

const String dbPath = '../db/';

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
                liveClock(),
                style: MyTextStyle,
              ),
            ),
            Container(
              margin: EdgeInsets.all(20.0),
              child: Icon(Icons.favorite, color: Colors.red, size: 30.0),
            ),
            UrlButton('Go to URL', 'https://heise.de'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
              // crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
              children: [
                MyActionButton('B1'),
                MyActionButton('B2') 
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
              children: [
                MyActionButton('B3'),
                MyActionButton('B4') 
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
              children: [
                MyActionButton('B5'),
                MyActionButton('B6') 
              ],
            )

            // Container
          ],
        ));
  }
}

class UrlButton extends StatelessWidget {
  final String _buttonName;
  final String _targetUrl;
  UrlButton(this._buttonName, this._targetUrl);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      // color: Colors.blue,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0), color: Colors.blue),
      child: FlatButton(
        color: Colors.blue,
        child: Text(_buttonName, style: MyDefaultButtonStyle,),
        onPressed: () => _myUrlLauncher(_targetUrl),
      ),
    );
  }

  _myUrlLauncher(String url) async {
  // final String url = 'https://heise.de';
  if (await canLaunch(url)) {
        await launch(url);
    }else {
    throw 'Could not launch $url';
    }
  }

}

class MyActionButton extends StatelessWidget {
  final String _buttonName;
  MyActionButton(this._buttonName);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      // color: Colors.blue,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0), color: Colors.blue),
      child: FlatButton(
        color: Colors.blue,
        child: Text(_buttonName, style: MyDefaultButtonStyle,),
        onPressed: () => {},
      ),
    );
  }
}
