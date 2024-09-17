import 'package:flutter/foundation.dart';

class ItemModel with ChangeNotifier {
  List<String> _items = [];

  List<String> get items => _items;

  void addItem(String item) {
    _items.add(item);
    notifyListeners(); // Ba kase tau semua listener kalo data so ta ubah
  }

  void removeItem(int index) {
    _items.removeAt(index);
    notifyListeners();
  }

  void updateItem(int index, String newItem) {
    _items[index] = newItem;
    notifyListeners();
  }
}
