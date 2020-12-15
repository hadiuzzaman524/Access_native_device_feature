import 'package:flutter/material.dart';
import './screens/add_location_screen.dart';
import './screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        AddLocaionScreen.routeName: (context) => AddLocaionScreen(),
      },
    );
  }
}
