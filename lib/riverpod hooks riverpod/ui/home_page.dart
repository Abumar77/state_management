import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:state_management_skillbox12/riverpod hooks riverpod/Business%20Logic/controller.dart';
import 'package:state_management_skillbox12/riverpod hooks riverpod/Business%20Logic/scroll_controller.dart';

class MyHomePage extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(basketProvider);
    final hideFabAnimController = useAnimationController(
        duration: kThemeAnimationDuration, initialValue: 1);
    final scrollController =
        useScrollControllerForAnimation(hideFabAnimController);
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
            controller: scrollController,
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
      floatingActionButton: FadeTransition(
        opacity: hideFabAnimController,
        child: ScaleTransition(
          scale: hideFabAnimController,
          child: FloatingActionButton(
            backgroundColor: Colors.red,
            tooltip: 'Increment',
            onPressed: () {
              Navigator.pushNamed(context, '/basket_page');
            },
            child: const Icon(Icons.shopping_cart),
          ),
        ),
      ),
    );
  }
}
