import 'package:flutter/material.dart';
import 'styles.dart';

class AutoTimingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Auto Timing'),),
      body: Column(children: [
        Row(
              mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
              // crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
              children: [
                MyActionButton('ARRIVED'),
                MyActionButton('DEPARTED') 
              ],
            ),
      ],

      ),
      
    );
  }
}

class MyActionButton extends StatelessWidget {
  final String _buttonName;
  MyActionButton(this._buttonName);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      // color: Colors.blue,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0), color: Colors.blue),
      child: FlatButton(
        color: Colors.blue,
        child: Text(_buttonName, style: MyDefaultButtonStyle,),
        onPressed: () => {},
      ),
    );
  }
}
