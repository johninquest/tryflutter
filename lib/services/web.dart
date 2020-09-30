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
    return PublicIpObject.fromJson(json.decode(myResponse.body));
  } else {
    throw Exception('Failed to get IP Address');
  }
}

class PublicIpObject {
  final String ip;
  PublicIpObject({this.ip});
  factory PublicIpObject.fromJson(Map<String, dynamic> json) {
    return PublicIpObject(ip: json['ip']);
  }
}
