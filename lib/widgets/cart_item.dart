import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart_model.dart';

class CartItem extends StatelessWidget {
  final String id;
  final String productId;
  final String title;
  final int quantity;
  final double price;

  CartItem({this.productId, this.quantity, this.price, this.title, this.id});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      direction: DismissDirection.endToStart,
      onDismissed: (dir) {
        Provider.of<Cart>(context, listen: false).deleteItem(productId);
      },
      background: Container(
        margin: const EdgeInsets.all(8),
        color: Colors.red,
        child: Icon(
          Icons.delete,
          color: Colors.white70,
          size: 40,
        ),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
      ),
      confirmDismiss: (c) {
        return showDialog(
            context: context,
            builder: (context){
              return AlertDialog(
                title: Text('Are you sure?'),
                content: Text('Do you want to remove this item from cart?'),
                actions: [
                  FlatButton(onPressed: (){
                    Navigator.of(context).pop(false);
                  }, child: Text('No')),
                  FlatButton(onPressed: (){
                    Navigator.of(context).pop(true);
                  }, child: Text('Yes'))
                ],
              );
            });
      },
      child: Card(
        margin: const EdgeInsets.all(8),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 15),
          child: ListTile(
            leading: CircleAvatar(
              child: FittedBox(
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Text('\$ $price'),
                ),
              ),
            ),
            title: Text(title),
            trailing: Text("$quantity x"),
            subtitle: Text('Total : \$${(price * quantity)}'),
          ),
        ),
      ),
    );
  }
}
