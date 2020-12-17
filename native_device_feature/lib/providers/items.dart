import 'package:flutter/material.dart';
import 'package:native_device_feature/models/place.dart';
import '../models/place.dart';
import 'dart:io';

class ItemProvider with ChangeNotifier {
  List<Place> _items = [];

  void addItem(String title, File imageFile) {
    final newItem = Place(
      id: DateTime.now().toString(),
      title: title,
      file: imageFile,
      location: null,
    );
    _items.add(newItem);
    notifyListeners();
  }

  List<Place> get allItem {
    return [..._items];
  }
}
