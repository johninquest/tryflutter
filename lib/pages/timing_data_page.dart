import 'package:flutter/material.dart';
import 'styles.dart';
// import 'package:hive/hive.dart';
// import 'package:path_provider/path_provider.dart' as path_provider;

class TimingDataPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true, 
        title: Text('Timing Data'),
      ),
      body: Center(child: Text('Timing Data Page', style: MyTextStyle,),),
    );
  }
}
