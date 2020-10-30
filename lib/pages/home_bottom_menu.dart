import 'package:flutter/material.dart';
// import 'styles.dart';
import '../pages/auto_timing_page.dart';
import '../pages/manual_timing_page.dart';
import '../pages/timing_data_page.dart';
import '../services/router.dart';

class MyBottomMenu extends StatefulWidget {
  @override
  _MyBottomMenuState createState() => _MyBottomMenuState();
}

class _MyBottomMenuState extends State<MyBottomMenu> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.blue,
      iconSize: 30,
      // selectedLabelStyle: TextStyle(color: Colors.white),
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.timer,
            color: Colors.white,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.edit, color: Colors.white),
          label: '',
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.list, color: Colors.white), label: '')
      ],
      onTap: (index) => {print(index), afterTap(index)},
    );
  }

  void afterTap(int myIndex) {
    if (myIndex == 0) {
      PageRouter().navigateToPage(AutoTimingPage(), context);
    } else if (myIndex == 1) {
      PageRouter().navigateToPage(ManualTimingPage(), context);
    } else if (myIndex == 2) {
      PageRouter().navigateToPage(TimingDataPage(), context);
    } else {
      print('!!! No where to go !!!');
    }
  }
}
