import 'package:flutter/material.dart';

class TDrawerController extends ChangeNotifier{
  String _selectedCategory= 'Home';

  String get selectedCategory => _selectedCategory;
  
  void selectCategory(String category){
    _selectedCategory=category;
    notifyListeners();
  }
}