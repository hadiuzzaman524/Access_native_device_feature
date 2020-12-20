import 'package:flutter/material.dart';
import 'package:native_device_feature/models/place.dart';
import '../models/place.dart';
import 'dart:io';
import '../database/db_helper.dart';

class ItemProvider with ChangeNotifier {
  List<Place> _items = [];

  Future<void> addItem(String title, File imageFile) async{
    final newItem = Place(
      id: DateTime.now().toString(),
      title: title,
      file: imageFile,
      location: null,
    );
    _items.add(newItem);
    notifyListeners();
   await DBHelper.insert('user_places',{
      'id':newItem.id,
      'title':newItem.title,
      'image':newItem.file.path,
    });

  }

  List<Place> get allItem {
    return [..._items];
  }

  Future<void> fetchAndSetData() async {
    final dataList = await DBHelper.getData('user_places');
    _items = dataList
        .map(
          (item) => Place(
            id: item['id'],
            title: item['title'],
            file: File(item['image']),
            location: null,
          ),
        )
        .toList();
    notifyListeners();
  }
}
