import 'package:flutter/material.dart';
import 'add_location_screen.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/HomeScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Places"),
        actions: [
          FlatButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, AddLocaionScreen.routeName);
              },
              icon: Icon(Icons.add),
              label: Text("add")),
        ],
      ),
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
