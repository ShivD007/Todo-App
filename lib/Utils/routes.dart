import 'package:flutter/material.dart';
import 'package:notepad/Screens/myHomePage.dart';

class RoutesGenerator {
  // ignore: missing_return
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/home":
        return MaterialPageRoute(builder: (context) => MyHomePage());
    }
  }
}
