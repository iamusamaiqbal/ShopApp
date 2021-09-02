import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/product_items.dart';
import '../providers/product_provider.dart';

class GridViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductProvider>(context);
    final _list = productData.itemList;

    return GridView.builder(
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
      itemCount: _list.length,
      itemBuilder: (BuildContext context, int index) => ChangeNotifierProvider(
        create: (BuildContext context) => _list[index],
        child: ProductItems(),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
