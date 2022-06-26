import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_skillbox12/cubit%20bloc/business%20logic/basket_cubit.dart';

class MyHomePageCubit extends StatefulWidget {
  const MyHomePageCubit({Key? key}) : super(key: key);

  @override
  State<MyHomePageCubit> createState() => _MyHomePageCubitState();
}

class _MyHomePageCubitState extends State<MyHomePageCubit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProvideShop'),
        actions: [
          OutlinedButton(
            style: OutlinedButton.styleFrom(
                backgroundColor: Colors.white, primary: Colors.black),
            onPressed: () {},
            child: BlocBuilder<BasketCubit, dynamic>(
              builder: (context, state) {
                return Text('Total ${state.total}\$');
              },
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(1.0),
        child: BlocBuilder<BasketCubit, dynamic>(
          builder: (context, state) => ListView.builder(
              itemCount: state.catalog.length,
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
                          .read<BasketCubit>()
                          .addProducts(state.availableProducts.products[index]);
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
