import 'package:flutter/material.dart';
import 'package:state_management_skillbox12/flutter_redux/ui/presentation/product.dart';

import '../../models/products.dart';

class ProductsControl extends StatelessWidget {
  final Products products;
  final Function(int) onAddToCart;

  const ProductsControl(
      {Key? key, required this.products, required this.onAddToCart})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return products.items.isEmpty
        ? const Center(child: CircularProgressIndicator())
        : ListView.builder(
            itemCount: products.items.length,
            itemBuilder: (BuildContext context, int index) {
              return ProductControl(
                price: products.items[index].price,
                inventory: products.items[index].inventory,
                title: products.items[index].title,
                onAddToCart: () => onAddToCart(products.items[index].id),
              );
            },
          );
  }
}
