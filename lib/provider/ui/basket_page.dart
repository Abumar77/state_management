import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_skillbox12/provider/business logic/controller.dart';

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
              itemCount: state.userBasket.products.length,
              itemBuilder: (
                BuildContext context,
                int index,
              ) {
                return state.userBasket.products[index].showInBasket
                    ? ListTile(
                        leading: Text(
                            '${state.userBasket.products[index].price} \$'),
                        title: Text(state.userBasket.products[index].name),
                        subtitle: Text(
                            '${state.userBasket.products[index].quantity} items you choose'),
                        trailing: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.blue,
                            primary: Colors.white,
                          ),
                          onPressed: () {
                            context.read<BasketController>().removeFromBasket(
                                state.userBasket.products[index], index);
                          },
                          child: const Text('Remove Item'),
                        ),
                      )
                    : const SizedBox();
              }),
        ),
      ),
    );
  }
}
