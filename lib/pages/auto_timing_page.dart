import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'styles.dart';
import '../db/hive.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class AutoTimingPage extends StatefulWidget {
  @override
  _AutoTimingPageState createState() => _AutoTimingPageState();
}

class _AutoTimingPageState extends State<AutoTimingPage> {
  @override
  Widget build(BuildContext context) {
    HiveDbOperations().initializeHiveDB();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Auto Timing'),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 50),
            child: Text(
              'Clock Your Time',
              style: MyPageTitleStyle,
            ),
          ),
          Row(
            mainAxisAlignment:
                MainAxisAlignment.center, //Center Row contents horizontally,
            children: [
              MyActionButton('COME', 'arrivedWorkAt'),
              MyActionButton('GO', 'leftWorkAt')
            ],
          ),
          Row(
            mainAxisAlignment:
                MainAxisAlignment.center, //Center Row contents horizontally,
            children: [
              MyActionButton('BEGIN', 'startedWorkAt'),
              MyActionButton('END', 'endedWorkAt')
            ],
          ),
          Row(
            mainAxisAlignment:
                MainAxisAlignment.center, //Center Row contents horizontally,
            children: [
              MyActionButton('BS', 'startedBreakAt'),
              MyActionButton('BE', 'endedBreakAt')
            ],
          ),
        ],
      ),
    );
  }
}

class MyActionButton extends StatelessWidget {
  final String _buttonName;
  final String _eventName;
  // final String _eventDateTime;
  MyActionButton(this._buttonName, this._eventName);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 60, bottom: 20, left: 30, right: 30),
      // color: Colors.blue,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0), color: Colors.blue),
      child: FlatButton(
          color: Colors.blue,
          child: Text(
            _buttonName,
            style: MyDefaultButtonStyle,
          ),
          onPressed: () => onAlertButtonsPressed(context)),
    );
  }

  eventDateTime(DateTime ts) {
    DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
    String tsFormatted = formatter.format(ts);
    return tsFormatted;
  }

  onAlertButtonsPressed(context) {
    Alert(
      context: context,
      type: AlertType.info,
      title: _buttonName,
      desc: '$_eventName => ${eventDateTime(new DateTime.now())}',
      buttons: [
        DialogButton(
          child: Text(
            "CANCEL",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          onPressed: () => Navigator.pop(context),
          color: Colors.grey,
        ),
        DialogButton(
          child: Text(
            "SAVE",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          onPressed: () => {
            HiveDbOperations()
                .saveDataToHive(_eventName, eventDateTime(new DateTime.now())),
            Navigator.pop(context),
            HiveDbOperations().getDataFromHive(_eventName),
          },
          color: Colors.blue,
        )
      ],
    ).show();
  }
}
