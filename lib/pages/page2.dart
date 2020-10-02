import 'package:flutter/material.dart';
import 'package:tryflutter/services/web.dart';
import 'styles.dart';
import '../services/tools.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  // final String _dummyText;
  // SecondPage(this._dummyText);
  Future<PublicIpObject> publicIpData;

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
              child: FutureBuilder<PublicIpObject>(
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
