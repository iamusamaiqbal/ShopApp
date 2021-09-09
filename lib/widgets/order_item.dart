import 'dart:math';
import 'package:flutter/material.dart';

import '../providers/order_model.dart' as order;

class OrderItem extends StatefulWidget {
  final order.OrderItem item;

  OrderItem({@required this.item});

  @override
  _OrderItemState createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  bool _expand = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            title: Text('\$${widget.item.amount}'),
            subtitle: Text('${widget.item.dateTime}'),
            trailing: IconButton(
              icon: (_expand == false)
                  ? Icon(Icons.expand_more)
                  : Icon(Icons.expand_less),
              onPressed: () {
                setState(() {
                  (_expand == false) ? _expand = true : _expand = false;
                });
              },
            ),
          ),
          if (_expand == true)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
              height: min(widget.item.products.length * 20.0 + 100, 180),
              child: ListView(
                children: widget.item.products
                    .map((e) => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              '${e.title}',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '${e.quantity}x \$${e.price}',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.grey),
                            ),
                          ],
                        ))
                    .toList(),
              ),
            )
        ],
      ),
    );
  }
}
