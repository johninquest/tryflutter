import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'styles.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void initiateMyHiveDB() async {
  final appDocDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocDir.path);
  await Hive.openBox('myBox');
}

class AutoTimingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    initiateMyHiveDB();
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
              MyActionButton('B1', 'arrivedWorkAt'),
              MyActionButton('B2', 'leftWorkAt')
            ],
          ),
          Row(
            mainAxisAlignment:
                MainAxisAlignment.center, //Center Row contents horizontally,
            children: [
              MyActionButton('B3', 'startedWorkAt'),
              MyActionButton('B4', 'endedWorkAt')
            ],
          ),
          Row(
            mainAxisAlignment:
                MainAxisAlignment.center, //Center Row contents horizontally,
            children: [
              MyActionButton('B5', 'startedBreakAt'),
              MyActionButton('B6', 'endedBreakAt')
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
          print('$_actionName => ${actionTimestamp(new DateTime.now())}'),
          Hive.box('myBox')
              .put(_actionName, actionTimestamp(new DateTime.now())),
          print(
              'Data in my hive store is => ${Hive.box('myBox').get(_actionName)}'),
          Hive.box('myBox').close()
        },
      ),
    );
  }

  actionTimestamp(DateTime ts) {
    DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
    String tsFormatted = formatter.format(ts);
    return tsFormatted;
  }
}
