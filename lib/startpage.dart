import 'package:flutter/material.dart';
import './styles.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Center(
          child: Text(
            'App',
            style: MyAppBarStyle
          ),
        )),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MyText(Colors.yellow, 'Riga'),
            MyText(Colors.green, 'Tallinn'),
            MyText(Colors.red, 'Vilnius'),
            MyTime(),
            MyButton('PUSH ME')
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
      color: _bgColor,
      child: Text(
        _myMessage,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  final String _buttonName;
  MyButton(this._buttonName);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 50),
      //  color: Colors.blue,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0), color: Colors.blue),
      child: FlatButton(
          onPressed: null,
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
      margin: EdgeInsets.only(top: 50),
      child: Text(
        dateFormatted,
        style: MyTimeStyle,
        textAlign: TextAlign.center,
      ),
    );
  }
}
