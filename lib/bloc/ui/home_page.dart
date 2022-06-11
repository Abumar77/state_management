import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:state_management_skillbox12/bloc/business logic/cart/basket_event.dart';
import '../business logic/cart/basket_bloc.dart';
import '../business logic/cart/basket_state.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BasketBloc, BasketState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Bloc shop'),
            leading: IconButton(
                icon: Stack(
                  children: [
                    const Align(
                      child: Icon(CupertinoIcons.shopping_cart),
                      alignment: Alignment.centerLeft,
                    ),
                    Align(
                        alignment: Alignment.topRight,
                        child: CircleAvatar(
                            backgroundColor: Colors.red,
                            radius: 10,
                            child: Text(
                              '${state.itemsAdded}',
                              style: const TextStyle(
                                  fontSize: 11, fontWeight: FontWeight.bold),
                            )))
                  ],
                ),
                onPressed: () => Navigator.pushNamed(context, '/basket_page')),
          ),
          body: Padding(
            padding: const EdgeInsets.all(1.0),
            child: ListView.builder(
                itemCount: state.availableProducts.length,
                itemBuilder: (
                  BuildContext context,
                  int index,
                ) {
                  return ListTile(
                    leading: Text('${state.availableProducts[index].price} \$'),
                    title: Text(state.availableProducts[index].name.toString()),
                    subtitle: Text(
                        '${state.availableProducts[index].quantity} items left'),
                    trailing: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.blue,
                        primary: Colors.white,
                      ),
                      onPressed: () {
                        // with extensions
                        context.read<BasketBloc>().add(
                              BasketProductAdd(
                                  item: state.availableProducts[index]),
                            );
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
      },
    );
  }
}
