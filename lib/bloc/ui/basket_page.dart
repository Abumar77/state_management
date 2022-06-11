import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_skillbox12/bloc/data/item_model.dart';

import '../business logic/cart/basket_event.dart';
import '../business logic/cart/basket_bloc.dart';
import '../business logic/cart/basket_state.dart';

class BasketPage extends StatelessWidget {
  const BasketPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BasketBloc, BasketState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Basket Page'),
            actions: [
              IconButton(
                  icon: const Icon(CupertinoIcons.trash),
                  onPressed: () {
                    context.read<BasketBloc>().add(
                          CatalogDeclare(),
                        );
                    Navigator.pop(context);
                  })
            ],
          ),
          body: SafeArea(
            child: BlocBuilder<BasketBloc, BasketState>(
              builder: (context, state) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: state.userBasket.length,
                          itemBuilder: (
                            BuildContext context,
                            int index,
                          ) {
                            ItemBlocValueBloc product = state.userBasket[index];

                            return product.showInBasket == true
                                ? ListTile(
                                    leading: Text('${product.price} \$'),
                                    title: Text(product.name.toString()),
                                    subtitle: Text(
                                        '${product.quantity} items you choose'),
                                    trailing: TextButton(
                                      style: TextButton.styleFrom(
                                        backgroundColor: Colors.blue,
                                        primary: Colors.white,
                                      ),
                                      onPressed: () {
                                        context.read<BasketBloc>().add(
                                            BasketProductExtract(
                                                item: product));
                                      },
                                      child: const Text('Remove Item'),
                                    ),
                                  )
                                : Container();
                          }),
                    ),
                    Center(
                      child: Text("Total price ${state.totalSum}\$"),
                    )
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
