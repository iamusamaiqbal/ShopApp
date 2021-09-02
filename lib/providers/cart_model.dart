import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final int quantity;
  final double price;
  final String title;

  CartItem({this.title, this.id, this.price, this.quantity});
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get item {
    return {..._items};
  }

  int get itemCount{
    return _items == null ? 0 : _items.length ;
  }

  void addToCart({String productId, double price, String title}) {
    if (_items.containsKey(productId)) {
      _items.update(
          productId,
          (item) => CartItem(
              id: item.id,
              title: item.title,
              price: item.price,
              quantity: item.quantity + 1));
      print(_items[productId].quantity);
    } else {
      _items.putIfAbsent(
          productId,
          () => CartItem(
              id: DateTime.now().toString(), price: price, quantity: 1));
    }
    notifyListeners();
  }
}
