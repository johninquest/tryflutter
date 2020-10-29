import 'package:flutter/material.dart';
// import 'styles.dart';
import '../pages/page2.dart';
import '../pages/auto_timing_page.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text('Menu',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white))),
          ListTile(
            leading: Icon(Icons.east),
            title: Text('Go to page 2'),
            onTap: () => {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => SecondPage())),
              print('Navigated to page 2')
            },
          ),
          ListTile(
            leading: Icon(Icons.timer),
            title: Text('Automatic timing'),
            onTap: () => {
              print('Tapped automatic timing button!'),
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => AutoTimingPage()))
            },
          ),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('Manual timing'),
            onTap: () => {print('Tapped manual timing button!')},
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('Info'),
            onTap: () => {print('Tapped info button!')},
          ),
        ],
      ),
    );
  }
}