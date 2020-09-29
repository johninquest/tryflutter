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
          child: Text('HomePage', style: MyAppBarStyle),
        )),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MyText(Colors.yellow, ' Hello Barbara! '),
            MyTime(),
            MyButton('Go to Page 2'),
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

class SecondPage extends StatelessWidget {
  // final String _dummyText;
  // SecondPage(this._dummyText);
  @override
  Widget build(BuildContext context) {
    DateTime dt = new DateTime.now();
    String timeString = "${dt.hour}:${dt.minute}:${dt.second}";
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
              margin: EdgeInsets.all(20),
              child: Center(
                  child: Text(
                'Welcome to Page 2',
                style: MyTextStyle,
              )),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(
                'Time: ' + timeString,
                style: MyTextStyle,
              ),
            )
          ],
        ));
  }
}
