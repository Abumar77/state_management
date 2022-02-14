import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_skillbox12/Provider/Business%20Logic/controller.dart';

import '../Business Logic/cart/basket_bloc.dart';
import '../Business Logic/cart/basket_event.dart';
import '../Business Logic/cart/basket_state.dart';
import '../Data/item_model.dart';

class BasketPage extends StatelessWidget {
  const BasketPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => BasketBloc(),
        child: Scaffold(
            appBar: AppBar(
              title: const Text('Basket Page'),
              actions: [
                BlocProvider.of<BasketBloc>(context).cartProducts.isNotEmpty
                    ? IconButton(
                        icon: const Icon(CupertinoIcons.trash),
                        onPressed: () => BlocProvider.of<BasketBloc>(context)
                            .add(BasketProductClear()),
                      )
                    : Container()
              ],
            ),
            body: SafeArea(
              child: BlocBuilder<BasketBloc, BasketState>(
                builder: (context, state) {
                  return Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: ListView.builder(
                        itemCount: BlocProvider.of<BasketBloc>(context)
                            .cartProducts
                            .length,
                        itemBuilder: (
                          BuildContext context,
                          int index,
                        ) {
                          ItemBloc product =
                              BlocProvider.of<BasketBloc>(context)
                                  .cartProducts[index];
                          return ListTile(
                            leading: Text('${product.price} \$'),
                            title: Text(product.name.toString()),
                            subtitle:
                                Text('${product.quantity} items you choose'),
                            trailing: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.blue,
                                primary: Colors.white,
                              ),
                              onPressed: () {
                                context
                                    .read<BasketBloc>()
                                    .add(BasketProductExtract(item: product));
                              },
                              child: const Text('Remove Item'),
                            ),
                          );
                        }),
                  );
                },
              ),
            )));
  }
}
