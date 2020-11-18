import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
// import 'dart.io';
// import 'dart:async';
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';

urlLauncher(String targetUrl) async {
  if (await canLaunch(targetUrl)) {
    await launch(targetUrl);
  } else {
    print('Could not launch $targetUrl');
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
              // print(snapshot.data.body);
              Map resData = jsonDecode(snapshot.data.body);
              // print(resData['ip']);
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

class HttpRequestHandler {
  httpGet(String reqUrl) async {
    var getRequest = await http.get(reqUrl);
    return getRequest;
  }

  httpPost(String reqUrl, Map reqHeaders, Map reqPayload) async {
    var postRequest =
        await http.post(reqUrl, headers: reqHeaders, body: reqPayload);
    return postRequest;
  }

  parseHttpResponse(dynamic httpResponseData) {
    var parsedData = jsonDecode(httpResponseData);
    return parsedData;
  }
}