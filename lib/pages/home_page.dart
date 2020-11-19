import 'package:flutter/material.dart';
import 'styles.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'page2.dart';
import '../pages/home_side_menu.dart';
import '../pages/home_bottom_menu.dart';
import '../pages/news_page.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../services/web.dart';
import '../services/router.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavDrawer(),
        appBar: AppBar(
          centerTitle: true,
          title: Text('HomePage', style: MyAppBarStyle),
        ),
        body: Center(
            child: Column(
          children: [
            MyButton('Go to Page 2', SecondPage()),
            MyButton('Go to News Page', NewsPage()),
            AlertButton('PUSH', ''' Don't touch me! '''),
            LiveTime(),
            Text(''),
            MyPublicIp()
          ],
        )),
        bottomNavigationBar: MyBottomMenu());
  }
}

class MyButton extends StatelessWidget {
  final String _buttonName;
  final Widget _targetWidget;
  MyButton(this._buttonName, this._targetWidget);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      // color: Colors.blue,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0), color: Colors.blue),
      child: FlatButton(
          onPressed: () => {
                PageRouter().navigateToPage(_targetWidget, context),
                /*  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SecondPage())), */
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
  final String _buttonName;
  final String _alertMessage;
  AlertButton(this._buttonName, this._alertMessage);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(20),
        child: RaisedButton(
          child: Text(_buttonName),
          onPressed: () => _onBasicAlertPressed(context),
        ));
  }

  _onBasicAlertPressed(context) {
    Alert(
      context: context,
      title: _alertMessage,
      // desc: "I am awesome",
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

class MyPublicIp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String myUrl = 'https://api.ipify.org?format=json1';
    return FutureBuilder(
        future: HttpRequestHandler().httpGet(myUrl),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print('Has data!');
            String responseData = snapshot.data.body;
            return Container(
              height: 100.0,
              width: 200.0,
              child: Card(
                color: Colors.blue, 
                margin: EdgeInsets.all(20.0), 
                child: Column( 
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center, 
                  children: [
                  Text('My Public IP', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15.0)),
                  Text(responseData, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0)),],
              ),
            ));
          }
          if (snapshot.hasError) {
            print('Has error!');
            return Text('Response has error!');
          } else {
            return CircularProgressIndicator();
          }
        });
  }
}
