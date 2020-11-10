import 'package:flutter/material.dart';
import 'styles.dart';
import '../services/tools.dart';
import 'package:url_launcher/url_launcher.dart';
//import '../services/web.dart';
// import 'package:http/http.dart' as http;
// import 'dart:async';
// import 'dart:convert';
// import 'dart:async';
// import 'dart:convert';

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
          centerTitle: true,
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
            UrlButton('Go to Website', 'https://www.ax-ao.de'),
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
        child: Text(
          _buttonName,
          style: MyDefaultButtonStyle,
        ),
        onPressed: () => _myUrlLauncher(_targetUrl),
      ),
    );
  }

  _myUrlLauncher(String url) async {
    // final String url = 'https://heise.de';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

/*
class MyText extends StatelessWidget {
  final Color _bgColor;
  final String _myMessage;
  MyText(this._bgColor, this._myMessage);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(20),
        color: _bgColor,
        child: Center(
          child: Text(
            _myMessage,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
        ));
  }
}
*/
