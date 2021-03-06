import 'package:flutter/material.dart';
import 'styles.dart';
import '../services/web.dart';

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
              margin: EdgeInsets.all(20.0),
              child: Icon(Icons.favorite, color: Colors.red, size: 30.0),
            ),
            StartUrlButton('Go to Website', 'https://heise.de'),
            Text('')
            // Container */
          ],
        ));
  }
}

class StartUrlButton extends StatelessWidget {
  final String _buttonName;
  final String _targetUrl;
  StartUrlButton(this._buttonName, this._targetUrl);

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
        onPressed: () => urlLauncher(_targetUrl),
      ),
    );
  }
}