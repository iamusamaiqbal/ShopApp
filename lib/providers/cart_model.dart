import 'package:flutter/material.dart';

class CartItem {
  final String id;
  int quantity = 0;
  double price = 0;
  final String title;

  CartItem({this.title, this.id, this.price, this.quantity});
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get item {
    return {..._items};
  }

  int get itemCount {
    return _items == null ? 0 : _items.length;
  }

  double get total {
    double total = 0.0;

    _items.forEach((key, value) {
      total += value.quantity * value.price;
    });

    return total;
  }

  void deleteItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void addToCart({String productId, double price, String title}) {
    if (_items.containsKey(productId)) {
      _items.update(
          productId,
              (item) =>
              CartItem(
                  id: item.id,
                  title: item.title,
                  price: item.price,
                  quantity: item.quantity + 1));
      print(_items[productId].title);
    } else {
      _items.putIfAbsent(
          productId,
              () =>
              CartItem(
                  id: DateTime.now().toString(),
                  price: price,
                  quantity: 1,
                  title: title));
    }
    notifyListeners();
  }

  void removeSingleItemCart({String productId}) {
    if (!_items.containsKey(productId)) {
      return;
    }
    else if (_items[productId].quantity > 1) {
      _items.update(productId, (value) =>
          CartItem(title: value.title,
              id: value.id,
              price: value.price,
              quantity: value.quantity - 1));
    }
    else{
      _items.remove(productId);
    }
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}
