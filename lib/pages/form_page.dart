import 'package:flutter/material.dart';
import 'styles.dart';

class FormPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Form Page'),
      ),
      body: Padding(padding: EdgeInsets.all(30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center, 
        children: [
          Text('Insert data', style: MyTextStyle,),
        TextField(
          decoration: InputDecoration(hintText: 'Name'),
        ),
        TextField(
          decoration: InputDecoration(hintText: 'Age'),
        ),
        Text(''),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FlatButton(
              color: Colors.grey,
              onPressed: () => print('Cancel button pressed!'), 
              child: Text('CANCEL', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)),
            FlatButton(
              color: Colors.blue, 
              onPressed: () => print('Save button pressed!'), 
              child: Text('SAVE', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
          ],
        )
      ]),) 
    );
  }
}

class MyFlatButton extends StatelessWidget {
  final Function _buttonAction;
  final _buttonColor;
  final String _buttonName;
  MyFlatButton(this._buttonAction, this._buttonColor, this._buttonName);
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: _buttonColor,
      onPressed: _buttonAction,
      child: Text(_buttonName),
    );
  }
}
