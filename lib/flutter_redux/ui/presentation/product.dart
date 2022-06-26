import 'package:flutter/material.dart';

class ProductControl extends StatelessWidget {
  const ProductControl({
    Key? key,
    required this.price,
    required this.inventory,
    required this.title,
    required this.onAddToCart,
  }) : super(key: key);

  final double price;
  final int inventory;
  final String title;
  final VoidCallback onAddToCart;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(5),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title),
                Text('Price : \$$price'),
                inventory == 0
                    ? const Text('Sold out',
                        style: TextStyle(color: Colors.red))
                    : Text('Stock : $inventory'),
              ],
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextButton(
                    child: Column(
                      children: const [
                        Icon(Icons.add_shopping_cart),
                        Text(
                          'Add',
                          style: TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                    onPressed: inventory == 0 ? null : onAddToCart,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
