import 'package:http/http.dart';
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';

urlLauncher(String targetUrl) async {
  if (await canLaunch(targetUrl)) {
    await launch(targetUrl);
  } else {
    print('Could not launch $targetUrl');
  }
}

class HttpRequestHandler {
  httpGet(String reqUrl) async {
    Response reqResponse = await get(reqUrl);
    if (reqResponse.statusCode == 200) {
      // print(reqResponse.statusCode);
      return reqResponse;
    } else {
      print(reqResponse.statusCode);
      return null;
    }
  }

  httpPost(String reqUrl, Map reqHeaders, Map reqPayload) async {
    var postRequest = await post(reqUrl, headers: reqHeaders, body: reqPayload);
    return postRequest;
  }
}