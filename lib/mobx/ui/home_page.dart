import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../data/logic.dart';

class MyHomePageMobx extends StatelessWidget {
  MyHomePageMobx({Key? key}) : super(key: key);

  final BasketMobxStore store = BasketMobxStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MOBX shop'),
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
                    child: Observer(builder: (_) {
                      return Text(
                        '${store.itemsAdded}',
                        style: const TextStyle(
                            fontSize: 11, fontWeight: FontWeight.bold),
                      );
                    }),
                  ),
                )
              ],
            ),
            onPressed: () => Navigator.pushNamed(context, '/basket_page')),
      ),
      body: Observer(builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(1.0),
          child: ListView.builder(
              itemCount: store.availableProducts!.length,
              itemBuilder: (
                BuildContext context,
                int index,
              ) {
                return Observer(builder: (_) {
                  return ListTile(
                    leading:
                        Text('${store.availableProducts?[index].price} \$'),
                    title: Text(
                        "${store.availableProducts?[index].name.toString()}"),
                    subtitle: Builder(builder: (context) {
                      return Text(
                          '${store.availableProducts?[index].quantity} items left');
                    }),
                    trailing: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.blue,
                        primary: Colors.white,
                      ),
                      onPressed: () {
                        store.productAdd(store.availableProducts![index]);
                      },
                      child: const Text('Add to Cart'),
                    ),
                  );
                });
              }),
        );
      }),
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
