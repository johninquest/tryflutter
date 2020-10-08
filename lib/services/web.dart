import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
// import 'dart.io';
import 'dart:async';
import 'dart:convert';

// dynamic publicIpAddress;
// const String reqUrl = 'https://api.ipify.org?format=json';

Future<PublicIpObject> getIpAddress() async {
  final reqUrl = 'https://api.ipify.org?format=json';
  final myResponse = await http.get(reqUrl);
  if (myResponse.statusCode == 200) {
    // debugPrint(myResponse.body.toString());
    return PublicIpObject.fromJson(json.decode(myResponse.body));
  } else {
    // debugPrint('Failed to get IP address!');
    throw Exception('Failed to get IP address!');
  }
}

class PublicIpObject {
  final String ip;
  PublicIpObject({this.ip});
  factory PublicIpObject.fromJson(Map<String, dynamic> json) {
    return PublicIpObject(ip: json['ip']);
  }
}

getMyPubIp() async {
  const String url = 'https://api.ipify.org?format=json';
  var response = await http.get(url);
  if (response.body != null) {
    debugPrint('${response.body}');
    return '${response.body}';
  } else {
    debugPrint('Got no response');
    return 'No response returned';
  }
}
