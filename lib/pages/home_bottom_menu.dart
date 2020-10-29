import 'package:flutter/material.dart';
// import 'styles.dart';
import '../pages/auto_timing_page.dart';
import '../pages/manual_timing_page.dart';
import '../pages/timing_data_page.dart';


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
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => AutoTimingPage()));
    } else if (myIndex == 1) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => ManualTimingPage()));
    } else if(myIndex == 2) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => TimingDataPage()));
    }else {
      print('!!! No where to go !!!');
    }
  }
}
