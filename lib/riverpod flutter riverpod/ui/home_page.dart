import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management_skillbox12/riverpod flutter riverpod/Business%20Logic/controller.dart';

class MyHomePage extends ConsumerWidget {
  const MyHomePage({Key? key}) : super(key: key);

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
            itemCount: state.availableProducts.products.length,
            itemBuilder: (
              BuildContext context,
              int index,
            ) {
              return ListTile(
                leading:
                    Text('${state.availableProducts.products[index].price} \$'),
                title: Text(state.availableProducts.products[index].name),
                subtitle: Text(
                    '${state.availableProducts.products[index].quantity} items left'),
                trailing: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blue,
                    primary: Colors.white,
                  ),
                  onPressed: () {
                    ref
                        .read(basketProvider)
                        .addToBasket(state.availableProducts.products[index]);
                  },
                  child: const Text('Add to Cart'),
                ),
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Increment',
        onPressed: () {
          Navigator.pushNamed(context, '/basket_page');
        },
        child: const Icon(Icons.shopping_cart),
      ),
    );
  }
}
