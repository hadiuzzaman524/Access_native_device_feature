import 'package:flutter/material.dart';
import 'package:native_device_feature/providers/items.dart';
import 'package:provider/provider.dart';
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
      body: FutureBuilder(
        future:
            Provider.of<ItemProvider>(context, listen: false).fetchAndSetData(),
        builder: (context, snapShoot) =>
        snapShoot.connectionState == ConnectionState.waiting
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Consumer<ItemProvider>(
                    child: Center(
                      child: Text("No item added"),
                    ),
                    builder: (ctx, obj, ch) {
                      return obj.allItem.length < 1
                          ? ch
                          : ListView.builder(
                              itemBuilder: (ctx, index) {
                                return ListTile(
                                  title: Text(obj.allItem[index].title),
                                  leading: CircleAvatar(
                                    backgroundImage:
                                        FileImage(obj.allItem[index].file),
                                  ),
                                  contentPadding: EdgeInsets.all(8.0),
                                );
                              },
                              itemCount: obj.allItem.length,
                            );
                    },
                  ),
      ),
    );
  }
}
