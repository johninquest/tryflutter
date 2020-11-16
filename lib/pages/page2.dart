import 'dart:convert';

import 'package:flutter/material.dart';
import 'styles.dart';
import '../services/tools.dart';
import '../services/web.dart';
import 'package:url_launcher/url_launcher.dart';
//import '../services/web.dart';
// import 'package:http/http.dart' as http;
// import 'dart:async';
// import 'dart:convert';
// import 'dart:async';
// import 'dart:convert';

const String dbPath = '../db/';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    //  DateTime dt = new DateTime.now();
    //  String timeString = "${dt.hour}:${dt.minute}:${dt.second}";
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Page 2',
            style: MyAppBarStyle,
          ),
        ),
        body: Column(
          children: <Widget>[
            Flexible(child: ShowNews())
            /* Container(
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
                liveClock(),
                style: MyTextStyle,
              ),
            ),
            Container(
              margin: EdgeInsets.all(20.0),
              child: Icon(Icons.favorite, color: Colors.red, size: 30.0),
            ),
            UrlButton('Go to Website', 'https://www.ax-ao.de'),
            Text(''),
            ShowNews()
            // Container */
          ],
        ));
  }
}

class UrlButton extends StatelessWidget {
  final String _buttonName;
  final String _targetUrl;
  UrlButton(this._buttonName, this._targetUrl);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      // color: Colors.blue,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0), color: Colors.blue),
      child: FlatButton(
        color: Colors.blue,
        child: Text(
          _buttonName,
          style: MyDefaultButtonStyle,
        ),
        onPressed: () => _myUrlLauncher(_targetUrl),
      ),
    );
  }

  _myUrlLauncher(String url) async {
    // final String url = 'https://heise.de';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class ShowNews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String testUrl =
        'https://newsapi.org/v2/top-headlines?apiKey=bc80aee5a6654843bd745e416bccc24d&country=de';
    return FutureBuilder(
      future: HttpRequests().httpGet(testUrl),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            print('Response contains data!');
            var rawResponse = snapshot.data.body;
            var responseDecoded = jsonDecode(rawResponse);
            List newsData = responseDecoded['articles'];
            // int newsLength = responseDecoded['totalResults'];
            print(responseDecoded['totalResults']);
            //print(newsData[0]['author']);
            // return Text(newsLength.toString());
            return ListView.builder(
              itemCount: newsData.length,
              itemBuilder: (context, index) {
                var newsSource = newsData[index]['source']['name'];
                var newTitle = newsData[index]['title'];
                var newAuthor = newsData[index]['author'];
                var newDetails = newsData[index]['description'];
                return Text(
                    '$newsSource \n$newTitle \n$newAuthor \n$newDetails');
              },
            );
          }
          if (snapshot.hasError) {
            print('Error occured!');
            return Text('Error occured!');
          }
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          print('Request still in progesss!');
          return CircularProgressIndicator();
        }
        if (snapshot.connectionState == ConnectionState.none) {
          print('No connection in progress!');
          return Text('No connection in progress!');
        }
      },
    );
  }
}

/*
class MyText extends StatelessWidget {
  final Color _bgColor;
  final String _myMessage;
  MyText(this._bgColor, this._myMessage);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(20),
        color: _bgColor,
        child: Center(
          child: Text(
            _myMessage,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
        ));
  }
}
*/
