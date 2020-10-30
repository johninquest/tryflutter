import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'styles.dart';
import '../db/hive.dart';

class AutoTimingPage extends StatelessWidget {
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
              MyActionButton('ARRIVED', 'arrivedWorkAt'),
              MyActionButton('DEPARTED', 'leftWorkAt')
            ],
          ),
          Row(
            mainAxisAlignment:
                MainAxisAlignment.center, //Center Row contents horizontally,
            children: [
              MyActionButton('WORK \nSTARTED', 'startedWorkAt'),
              MyActionButton('WORK \nENDED', 'endedWorkAt')
            ],
          ),
          Row(
            mainAxisAlignment:
                MainAxisAlignment.center, //Center Row contents horizontally,
            children: [
              MyActionButton('BREAK \nSTARTED', 'startedBreakAt'),
              MyActionButton('BREAK \nENDED', 'endedBreakAt')
            ],
          ),
        ],
      ),
    );
  }
}

class MyActionButton extends StatelessWidget {
  final String _buttonName;
  final String _actionName;
  // final String _actionTimestamp;
  MyActionButton(this._buttonName, this._actionName);

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
        onPressed: () => {
          HiveDbOperations().saveDataToHive(_actionName, actionTimestamp(new DateTime.now())),
          HiveDbOperations().getDataFromHive(_actionName)},
      ),
    );
  }

  actionTimestamp(DateTime ts) {
    DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
    String tsFormatted = formatter.format(ts);
    return tsFormatted;
  }
}