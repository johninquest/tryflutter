import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'styles.dart';
import 'page2.dart';
import 'auto_timing_page.dart';
// import 'dart:async';
import 'package:rflutter_alert/rflutter_alert.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
            title: Center(
          child: Text('HomePage', style: MyAppBarStyle),
        )),
        body: Center(
            child: Column(
          /* crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center, */
          children: [
            MyButton('Go to Page 2'), 
            AlertButton(), 
            LiveTime()
            ],
        )));
  }
}

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text('Menu',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white))
            ),
          ListTile(
            leading: Icon(Icons.east),
            title: Text('Go to page 2'),
            onTap: () => {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => SecondPage())),
              print('Navigated to page 2')
            },
          ),
          ListTile(
            leading: Icon(Icons.timer),
            title: Text('Automatic timing'),
            onTap: () => {
              print('Tapped automatic timing button!'),
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => AutoTimingPage()))
              },
          ),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('Manual timing'),
            onTap: () => {print('Tapped manual timing button!')},
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('Info'),
            onTap: () => {print('Tapped the info button!')},
          ),
        ],
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
      margin: EdgeInsets.all(20),
      // color: Colors.blue,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0), color: Colors.blue),
      child: FlatButton(
          onPressed: () => {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SecondPage())),
                print('Navigated to page 2')
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

class AlertButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(20),
        child: RaisedButton(
          child: Text('PUSH'),
          onPressed: () => _onBasicAlertPressed(context),
        ));
  }

  _onBasicAlertPressed(context) {
    Alert(
      context: context,
      title: "My name is Barbara",
      desc: "I am awesome",
    ).show();
  }
}

class LiveTime extends StatefulWidget {
  @override
  _LiveTimeState createState() => _LiveTimeState();
}

class _LiveTimeState extends State<LiveTime> {
  String _timeString;

  @override
  void initState() {
    _timeString = _formatDateTime(DateTime.now());
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        _timeString,
        style: MyTextStyle,
      ),
    );
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);
    setState(() {
      _timeString = formattedDateTime;
    });
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('dd.MM.yyyy hh:mm:ss').format(dateTime);
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
