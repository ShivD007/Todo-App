import 'package:flutter/material.dart';
import 'package:notepad/Providers/todoProvider.dart';
import 'package:notepad/Screens/myHomePage.dart';
import 'package:notepad/Utils/routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodoProvider(),
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          initialRoute: "/home",
          onGenerateRoute: RoutesGenerator.generateRoute),
    );
  }
}
