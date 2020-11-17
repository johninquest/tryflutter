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
            margin: EdgeInsets.fromLTRB(5.0, 50.0, 5.0, 10.0),
            padding: EdgeInsets.all(10.0),
            child: Text(
              'Clock Your Time',
              style: MyPageTitleStyle,
            ),
          ),
          Row(
            mainAxisAlignment:
                MainAxisAlignment.center, //Center Row contents horizontally,
            children: [
              MyActionButton('ARRIVAL', 'arrivedWorkAt'),
              MyActionButton('DEPARTURE', 'leftWorkAt')
            ],
          ),
          Row(
            mainAxisAlignment:
                MainAxisAlignment.center, //Center Row contents horizontally,
            children: [
              MyActionButton('WORK STARTED', 'startedWorkAt'),
              MyActionButton('WORK ENDED', 'endedWorkAt')
            ],
          ),
          Row(
            mainAxisAlignment:
                MainAxisAlignment.center, //Center Row contents horizontally,
            children: [
              MyActionButton('BREAK STARTED', 'startedBreakAt'),
              MyActionButton('BREAK ENDED', 'endedBreakAt')
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
      margin: EdgeInsets.all(20.0),
      // color: Colors.blue,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0), color: Colors.blue),
      child: FlatButton(
          color: Colors.blue,
          padding: EdgeInsets.all(20.0),
          //hoverColor: Colors.grey[300],
          shape: CircleBorder(),
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
      // type: AlertType.info,
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
