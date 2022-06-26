import 'package:flutter/material.dart';
import 'package:state_management_skillbox12/flutter_redux/ui/containers/products_container.dart';

import 'containers/cart_button_container.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
        actions: const <Widget>[CartButtonContainer()],
      ),
      body: const ProductsContainer(),
    );
  }
}
