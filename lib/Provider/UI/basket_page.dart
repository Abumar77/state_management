import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_skillbox12/Provider/Business%20Logic/controller.dart';

class BasketPage extends StatelessWidget {
  const BasketPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basket Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Consumer<BasketController>(
          builder: (context, state, child) => ListView.builder(
              itemCount: state.basket.products.length,
              itemBuilder: (
                BuildContext context,
                int index,
              ) {
                return ListTile(
                  leading: Text('${state.basket.products[index].price} \$'),
                  title: Text(state.basket.products[index].name),
                  subtitle: Text('1 items you choose'),
                  trailing: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.blue,
                      primary: Colors.white,
                    ),
                    onPressed: () {
                      context.read<BasketController>().removeFromBasket(
                          state.basket.products[index], index);
                    },
                    child: const Text('Remove Item'),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
