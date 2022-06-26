import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:state_management_skillbox12/mobx/logic/model.dart';

import '../data/logic.dart';

class BasketPageMobx extends StatelessWidget {
  BasketPageMobx({Key? key}) : super(key: key);

  final BasketMobxStore store = BasketMobxStore();

  @override
  Widget build(BuildContext context) {
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
                    itemCount: store.userBasket?.length,
                    itemBuilder: (
                      BuildContext context,
                      int index,
                    ) {
                      ItemValueMOBX product = store.userBasket![index];
                      return product.showInBasket == true
                          ? Observer(builder: (_) {
                              return ListTile(
                                leading: Text(
                                    '${store.userBasket![index].price} \$'),
                                title: Text(
                                    store.userBasket![index].name.toString()),
                                subtitle: Text(
                                    '${store.userBasket![index].quantity} items you choose'),
                                trailing: TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                    primary: Colors.white,
                                  ),
                                  onPressed: () {
                                    store.extractAdd(
                                        store.availableProducts![index]);
                                  },
                                  child: const Text('Remove Item'),
                                ),
                              );
                            })
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
