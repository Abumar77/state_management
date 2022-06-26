import 'package:flutter/material.dart';
import 'package:state_management_skillbox12/flutter_redux/ui/containers/cart_container.dart';
import 'package:state_management_skillbox12/flutter_redux/ui/containers/cart_footer_container.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: const CartContainer(),
      bottomNavigationBar: const CartFooterContainer(),
    );
  }
}
