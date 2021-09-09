import 'package:flutter/material.dart';

import 'cart_model.dart';

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;

  OrderItem(
      {@required this.dateTime,
      @required this.id,
      @required this.amount,
      @required this.products});
}

class Order with ChangeNotifier {
  List<OrderItem> _orderList = [];

  List<OrderItem> get orders {
    return [..._orderList];
  }

  void addOrder(List<CartItem> cartItems, double total) {
    _orderList.insert(
        0,
        OrderItem(
            dateTime: DateTime.now(),
            id: DateTime.now().toString(),
            amount: total,
            products: cartItems));
    notifyListeners();
  }
}
