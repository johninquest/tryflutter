import 'package:flutter/material.dart';
import 'styles.dart';
import '../db/hive.dart';
import '../db/sqlite.dart';

class TimingDataPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // HiveDbOperations().initializeHiveDB();
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Timing Data Page'),
        ),
        body: Center(
            child: Column(
          children: [
            Text(''),
            Text(
              'Timing Data',
              style: MyTextStyle,
            ),
            Text(''),
            Expanded(child: ShowSqliteData())
            // ShowSqliteData()
          ],
        )));
  }
}

class ShowHiveData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: HiveDbOperations().getDataFromHive('arrivedWorkAt'),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          // print(snapshot.data);
          return Text(
            snapshot.data,
            style: TextStyle(fontSize: 20, color: Colors.blue),
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}

class ShowSqliteData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: SqliteDbHelper().getAllRows(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          print('Future returns data!');
          print(snapshot.data);
          var sqlData = snapshot.data;
          return ListView.builder(
              // padding: EdgeInsets.all(10.0),
              itemCount: sqlData.length,
              itemBuilder: (context, index) {
                var eId = sqlData[index].id;
                var eName = sqlData[index].eventName;
                var eTime = sqlData[index].eventTime;
                return Card(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(eId.toString()),
                    Text(formatEventName(eName)),
                    Text(eTime)
                  ],
                ));
              });
        }
        if (snapshot.hasError) {
          print('Future returns error!');
          return Container(
            child: Text('Query returned error!'),
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}

formatEventName(String name) {
  if (name == 'arrivedWorkAt') {
    return 'ARRIVED';
  }
  if (name == 'leftWorkAt') {
    return 'DEPARTED';
  }
  if (name == 'startedWorkAt') {
    return 'STARTED WORK';
  }
  if (name == 'endedWorkAt') {
    return 'ENDED WORK';
  }
  if (name == 'startedBreakAt') {
    return 'STARTED BREAK';
  }
  if (name == 'endedBreakAt') {
    return 'ENDED BREAK';
  }
}

formatEventTime(String time) {
  return time;
}
