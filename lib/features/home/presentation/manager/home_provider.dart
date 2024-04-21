import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier {
  int index = 0;
  changeIndex(int value) {
    index = value;
    notifyListeners();
  }
}