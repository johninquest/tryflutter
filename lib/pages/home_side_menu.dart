import 'package:flutter/material.dart';
// import 'styles.dart';
import '../pages/page2.dart';
import '../pages/auto_timing_page.dart';
import '../pages/manual_timing_page.dart';
import '../pages/timing_data_page.dart';
import '../services/router.dart';

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
            leading: Icon(Icons.timer),
            title: Text('Automatic timing'),
            onTap: () => {
              PageRouter().navigateToPage(AutoTimingPage(), context),
              print('Navigated to automatic timing page'),
            },
          ),
          ListTile(
              leading: Icon(Icons.edit),
              title: Text('Manual timing'),
              onTap: () => {
                    PageRouter().navigateToPage(ManualTimingPage(), context),
                    print('Navigated to manual timing page'),
                  }),
          ListTile(
              leading: Icon(Icons.list),
              title: Text('Timing data'),
              onTap: () => {
                    PageRouter().navigateToPage(TimingDataPage(), context),
                    print('Navigated to timing data page'),
                  }),   
          ListTile(
            leading: Icon(Icons.east),
            title: Text('Go to page 2'),
            onTap: () => {
              PageRouter().navigateToPage(SecondPage(), context),
              print('Navigated to page 2')
            },
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
