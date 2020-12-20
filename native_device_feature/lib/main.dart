import 'package:flutter/material.dart';
import 'package:native_device_feature/providers/items.dart';
import 'package:provider/provider.dart';
import './screens/add_location_screen.dart';
import './screens/home_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ItemProvider(),
        ),
      ],
      child: MyApp(),
    ),
  );
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
