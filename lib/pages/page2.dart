import 'package:flutter/material.dart';
import 'styles.dart';
import '../services/tools.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  // final String _dummyText;
  // SecondPage(this._dummyText);
  Future<IpDataModel> publicIpData;

  @override
  Widget build(BuildContext context) {
    //  DateTime dt = new DateTime.now();
    //  String timeString = "${dt.hour}:${dt.minute}:${dt.second}";
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Page 2',
            style: MyAppBarStyle,
          ),
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.all(20.0),
              child: Center(
                  child: Text(
                'Welcome to Page 2',
                style: MyTextStyle,
              )),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.0),
              child: Text(
                'Time: ' + liveClock(),
                style: MyTextStyle,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.0),
              child: Icon(Icons.favorite, color: Colors.red, size: 30.0),
            ),
            Container(
              margin: EdgeInsets.only(top: 50),
              child: FutureBuilder<IpDataModel>(
                  future: publicIpData,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                        return Text(snapshot.data.ip);
                    } else if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                    }
                    return CircularProgressIndicator();
                  }),
            ),
          ],
        ));        
  }
}


Future<IpDataModel> getIpAddress() async {
  final reqUrl = 'https://api.ipify.org?format=json';
  final myResponse = await http.get(reqUrl);
  if (myResponse.statusCode == 200) {
    // debugPrint(myResponse.body.toString());
    return IpDataModel.fromJson(json.decode(myResponse.body));
  } else {
    // debugPrint('Failed to get IP address!');
    throw Exception('Failed to get IP address!');
  }
}

class IpDataModel {
  final String ip;
  IpDataModel({this.ip});
  factory IpDataModel.fromJson(Map<String, dynamic> json) {
    return IpDataModel(ip: json['ip']);
  }
}


