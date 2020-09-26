import 'package:flutter/material.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    DateTime dt = new DateTime.now();
    String dateFormatted = "${dt.day}.${dt.month}.${dt.year}";
    String timeFormatted = "${dt.hour}:${dt.minute}:${dt.second}";
    return Scaffold(
        appBar: AppBar(
            title: Center(
          child: Text(
            'App',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        )),
        body: Center(
          child: Container(
              margin: EdgeInsets.all(100),
              child: Column(
                children: [
                  Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.only(bottom: 5),
                      color: Colors.black,
                      child: Text(
                        'Hallo welt!',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )),
                  Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(bottom: 5),
                    color: Colors.red,
                    child: Text(
                      'D: ' + dateFormatted,
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    color: Colors.yellow,
                    child: Text(
                      'T: ' + timeFormatted,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 50),
                    //  color: Colors.blue,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Colors.blue,
                    ),
                    child: FlatButton(
                      onPressed: null,
                      child: Text(
                        'PRESS ME',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  )
                ],
              )),
        ));
  }
}
