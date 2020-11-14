import 'package:flutter/material.dart';
import 'styles.dart';
import '../db/hive.dart';

class TimingDataPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // HiveDbOperations().initializeHiveDB();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Timing Data'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: Text(
            'Timing Data Page',
            style: MyTextStyle,
          )),
          Text(''),
          ShowHiveData()
        ],
      ),
    );
  }
}

class ShowHiveData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: HiveDbOperations().getDataFromHive('startedWorkAt'),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          print(snapshot.data);
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
