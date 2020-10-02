import 'package:flutter/material.dart';
import 'styles.dart';
import '../pages/page2.dart';
import 'dart:async';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Center(
          child: Text('HomePage', style: MyAppBarStyle),
        )),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MyText(Colors.yellow, ' Hello Barbara! '),
            MyTime(),
            MyButton('Go to Page 2'),
            LiveTime()
          ],
        ));
  }
}

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

class MyButton extends StatelessWidget {
  final String _buttonName;
  MyButton(this._buttonName);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      // color: Colors.blue,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0), color: Colors.blue),
      child: FlatButton(
          onPressed: () => {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => SecondPage()))
              },
          child: Text(
            _buttonName,
            style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          )),
    );
  }
}

class MyTime extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DateTime dt = new DateTime.now();
    String dateFormatted = "${dt.day}.${dt.month}.${dt.year}";
    // String timeFormatted = "${dt.hour}:${dt.minute}:${dt.second}";
    // String displayDateTime = dateFormatted + 'T' + timeFormatted;
    return Container(
      margin: EdgeInsets.all(20),
      child: Text(
        'Date: ' + dateFormatted,
        style: MyTimeStyle,
        textAlign: TextAlign.center,
      ),
    );
  }
}

class LiveTime extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DateTime ts = new DateTime.now();
    flipTime() {
      Timer.periodic(
          Duration(seconds: 1), (Timer t) => {ts = new DateTime.now()});
      debugPrint(ts.toString());
    }

    return Container(
        margin: EdgeInsets.all(20),
        child: RaisedButton(
          onPressed: flipTime(),
          child: Text('PUSH'),
        ));
  }
  // void flipTime() {}
}
