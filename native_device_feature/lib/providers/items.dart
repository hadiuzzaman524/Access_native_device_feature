import 'package:flutter/material.dart';
import 'package:native_device_feature/models/place.dart';
import '../models/place.dart';

class ItemProvider with ChangeNotifier{

 List<Place> _items=[];

 List<Place> get allItem{
   return [..._items];
 }

}