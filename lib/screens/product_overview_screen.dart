import 'package:flutter/material.dart';
import 'package:untitled/widgets/product_items.dart';

import '../widgets/gridview.dart';

class ProductOverviewScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shop'),
      ),
      body: GridViewWidget(),
    );
  }
}
