import 'package:flutter/material.dart';
import 'styles.dart';
// import 'package:hive/hive.dart';
// import 'package:path_provider/path_provider.dart' as path_provider;

class ManualTimingPage extends StatefulWidget {
  @override
  _ManualTimingPageState createState() => _ManualTimingPageState();
}

class _ManualTimingPageState extends State<ManualTimingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Manual Timing'),
      ),
      body: Center(child: Container(child: Text('Manual Timing Page', style: MyTextStyle,),),)
    );
  }
}
