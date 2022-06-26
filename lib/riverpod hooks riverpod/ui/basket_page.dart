import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:state_management_skillbox12/riverpod hooks riverpod/Business%20Logic/controller.dart';

class BasketPage extends ConsumerWidget {
  const BasketPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(basketProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('RiverpodShop'),
        actions: [
          OutlinedButton(
            style: OutlinedButton.styleFrom(
                backgroundColor: Colors.white, primary: Colors.black),
            onPressed: () {},
            child: Text('Total ${state.total}\$'),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(1.0),
        child: ListView.builder(
            itemCount: state.userBasket.products.length,
            itemBuilder: (
              BuildContext context,
              int index,
            ) {
              return state.userBasket.products[index].showInBasket
                  ? ListTile(
                      leading:
                          Text('${state.userBasket.products[index].price} \$'),
                      title: Text(state.userBasket.products[index].name),
                      subtitle: Text(
                          '${state.userBasket.products[index].quantity} items you choose'),
                      trailing: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.blue,
                          primary: Colors.white,
                        ),
                        onPressed: () {
                          ref.read(basketProvider).removeFromBasket(
                              state.userBasket.products[index], index);
                        },
                        child: const Text('Remove Item'),
                      ),
                    )
                  : const SizedBox();
            }),
      ),
    );
  }
}
