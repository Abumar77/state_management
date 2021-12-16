import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/src/provider.dart';
import 'package:state_management_skillbox12/Provider/Business%20Logic/controller.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ProvideShop'),
        actions: [
          OutlinedButton(
            style: OutlinedButton.styleFrom(
                backgroundColor: Colors.white, primary: Colors.black),
            onPressed: () {},
            child: Consumer<BasketController>(
              builder: (context, state, child) =>
                  Text('Total ${state.total}\$'),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Consumer<BasketController>(
          builder: (context, state, child) => ListView.builder(
              itemCount: state.availableProducts.products.length,
              itemBuilder: (
                BuildContext context,
                int index,
              ) {
                return ListTile(
                  leading: Text(
                      '${state.availableProducts.products[index].price} \$'),
                  title: Text(state.availableProducts.products[index].name),
                  subtitle: Text(
                      '${state.availableProducts.products[index].quantity} items left'),
                  trailing: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.blue,
                      primary: Colors.white,
                    ),
                    onPressed: () {
                      context
                          .read<BasketController>()
                          .addToBasket(state.availableProducts.products[index]);
                    },
                    child: const Text('Add to Cart'),
                  ),
                );
              }),
        ),
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
