import 'package:flutter/material.dart';
import 'styles.dart';

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
                'Time: ' + timeString,
                style: MyTextStyle,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.0),
              child: Icon(Icons.favorite, color: Colors.red, size: 30.0),
            )
          ],
        ));
  }
}