import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/order_model.dart' show Order;
import '../widgets/order_item.dart';

class OrderScreen extends StatelessWidget {
  static const routeName = '/order';

  @override
  Widget build(BuildContext context) {
    final orderProvider = Provider.of<Order>(context);
    var orderList = orderProvider.orders;
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Orders"),
      ),
      body: ListView.builder(
        itemCount: orderList.length,
        itemBuilder: (context, index) {
        return OrderItem(item: orderList[index],);
      },),
    );
  }
}
