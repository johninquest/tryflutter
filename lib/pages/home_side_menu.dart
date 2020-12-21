import 'package:flutter/material.dart';
// import 'styles.dart';
import '../pages/page2.dart';
import '../pages/auto_timing_page.dart';
import '../pages/timing_data_page.dart';
import '../pages/news_page.dart';
import '../pages/form_page.dart';
import 'crypto_page.dart';
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
            title: Text('Go to auto timing page'),
            onTap: () => {
              PageRouter().navigateToPage(AutoTimingPage(), context),
            },
          ),
          ListTile(
              leading: Icon(Icons.list),
              title: Text('Go to timing data page'),
              onTap: () => {
                    PageRouter().navigateToPage(TimingDataPage(), context)
                  }),   
          ListTile(
            leading: Icon(Icons.library_books),
            title: Text('Go to news page'),
            onTap: () => {
              PageRouter().navigateToPage(NewsPage(), context),
            },
          ),
          ListTile(
            leading: Icon(Icons.attach_money),
            title: Text('Go to crypto page'),
            onTap: () => {
              PageRouter().navigateToPage(CryptoPage(), context),
            },
          ),
           ListTile(
            leading: Icon(Icons.description),
            title: Text('Go to form page'),
            onTap: () => {
              PageRouter().navigateToPage(FormPage(), context),
            },
          ),         
          ListTile(
            leading: Icon(Icons.east),
            title: Text('Go to page 2'),
            onTap: () => {
              PageRouter().navigateToPage(SecondPage(), context),
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
