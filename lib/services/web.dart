import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
// import 'dart.io';
// import 'dart:async';
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';

myUrlLauncher() async {
  const String url = 'https://flutter.dev';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class MyPublicIPAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
          future: fetchUrl(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
             print(snapshot.data.body);
              Map resData = jsonDecode(snapshot.data.body);
             print(resData['ip']);
              return Container(
                margin: EdgeInsets.all(40.0),
                child: Text('My Public IP: ${resData['ip']}',
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)));
            } else {
              return CircularProgressIndicator();
            }
          }),
    );
  }

  fetchUrl() async {
    String ipUrl = 'https://api.ipify.org?format=json';
    return await http.get(ipUrl);
  }
}
