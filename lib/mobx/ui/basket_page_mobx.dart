import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:state_management_skillbox12/mobx/logic/item_value_mobx.dart';

import '../data/basket_mobx_base.dart';

class BasketPageMobx extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<BasketMobxStore>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Basket Page'),
        actions: [
          IconButton(
              icon: const Icon(CupertinoIcons.trash),
              onPressed: () {
                store.declare();
                Navigator.pop(context);
              })
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Observer(builder: (_) {
              return Padding(
                padding: const EdgeInsets.all(1.0),
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: store.userBasket.length,
                    itemBuilder: (
                      BuildContext context,
                      int index,
                    ) {
                      ItemValueMOBX product = store.userBasket[index];
                      return product.showInBasket == true
                          ? ListTile(
                              leading: Text('${product.price} \$'),
                              title: Text(product.name.toString()),
                              subtitle: Observer(builder: (_) {
                                return Text(
                                    '${product.quantity} items you choose');
                              }),
                              trailing: TextButton(
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  primary: Colors.white,
                                ),
                                onPressed: () {
                                  store.extractAdd(product);
                                },
                                child: const Text('Remove Item'),
                              ),
                            )
                          : Container();
                    }),
              );
            }),
            Observer(builder: (_) {
              return Center(
                child: Text("Total price ${store.totalSum}\$"),
              );
            })
          ],
        ),
      ),
    );
  }
}
