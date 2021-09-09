import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart_model.dart';
import '../widgets/cart_item.dart' as ci;
import '../providers/order_model.dart';

class CartScreen extends StatelessWidget {
  static String routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: TextStyle(fontSize: 20),
                  ),
                  Chip(
                    label: Text(
                      "\$ " + cart.total.toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  FlatButton(
                    onPressed: () {
                      Provider.of<Order>(context,listen: false)
                          .addOrder(cart.item.values.toList(), cart.total);
                      //cart.clear();
                    },
                    child: Text(
                      'ORDER NOW',
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cart.itemCount,
              itemBuilder: (context, index) {
                return ci.CartItem(
                  productId: cart.item.keys.toList()[index],
                  quantity: cart.item.values.toList()[index].quantity,
                  price: cart.item.values.toList()[index].price,
                  title: cart.item.values.toList()[index].title,
                  id: cart.item.values.toList()[index].id,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
