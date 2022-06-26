import 'package:flutter/material.dart';

class CartFooterControl extends StatelessWidget {
  final double total;
  final int itemCount;
  final VoidCallback onCheckout;
  final bool checkoutPending;
  final bool failed;
  final dynamic error;

  const CartFooterControl(
      {Key? key,
      required this.total,
      required this.itemCount,
      required this.onCheckout,
      required this.checkoutPending,
      required this.failed,
      this.error})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          checkoutPending ? const LinearProgressIndicator() : Container(),
          checkoutPending
              ? const Text(
                  'Please wait while checking out your cart',
                  style: TextStyle(color: Colors.red),
                )
              : Container(),
          failed
              ? Row(
                  children: [
                    const Icon(
                      Icons.error_outline,
                      color: Colors.red,
                    ),
                    Expanded(
                      child: Text(
                        'Checkout failed : $error',
                        style: const TextStyle(color: Colors.red),
                        overflow: TextOverflow.clip,
                      ),
                    ),
                  ],
                )
              : Container(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Your Cart',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text(itemCount == 0
                      ? 'Please add some products to cart.'
                      : '$itemCount items in the cart'),
                  Text('Total : \$$total'),
                ],
              ),
              TextButton(
                child: Column(
                  children: [
                    Row(
                      children: const [
                        Icon(Icons.shopping_cart),
                        Icon(Icons.check),
                      ],
                    ),
                    const Text('Checkout'),
                  ],
                ),
                onPressed:
                    itemCount == 0 || checkoutPending ? null : onCheckout,
              )
            ],
          ),
        ],
      ),
    );
  }
}
