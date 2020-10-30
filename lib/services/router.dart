import 'package:flutter/material.dart';

class PageRouter {
  void navigateToPage(Widget widgetName, BuildContext widgetContext) {
    String wName = widgetName.toString();
    // contextName = widgetContext.toString();
    print('NavigatingTo => $wName');
    Navigator.of(widgetContext)
        .push(MaterialPageRoute(builder: (context) => widgetName));
  }
}
