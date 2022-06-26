import 'package:flutter/material.dart';

class CartItemControl extends StatelessWidget {
  const CartItemControl({
    Key? key,
    required this.price,
    required this.quantity,
    required this.title,
    required this.onRemoveFromCart,
    required this.image,
  }) : super(key: key);

  final double price;
  final int quantity;
  final String title;
  final VoidCallback? onRemoveFromCart;
  final int image;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(5),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(IconData(image, fontFamily: 'MaterialIcons'), size: 70),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title),
                Text('Price : \$$price'),
                Text('Quantity : $quantity'),
              ],
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextButton(
                    child: Column(
                      children: const [
                        Icon(Icons.remove_shopping_cart),
                        Text(
                          'Remove',
                          style: TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                    onPressed: onRemoveFromCart,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
