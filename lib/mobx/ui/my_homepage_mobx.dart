import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import '../data/basket_mobx_base.dart';
import 'package:state_management_skillbox12/mobx/logic/item_value_mobx.dart';

class MyHomePageMobx extends StatelessWidget {
  MyHomePageMobx({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<BasketMobxStore>(context);

    return Observer(builder: (context) {
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
                      child: Text(
                        '${store.itemsAdded}',
                        style: const TextStyle(
                            fontSize: 11, fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
              onPressed: () => Navigator.pushNamed(context, '/basket_page')),
        ),
        body: Padding(
          padding: const EdgeInsets.all(1.0),
          child: ListView.builder(
              itemCount: store.availableProducts.length,
              itemBuilder: (
                BuildContext context,
                int index,
              ) {
                ItemValueMOBX product = store.availableProducts[index];
                return ListTile(
                  leading: Text('${product.price} \$'),
                  title: Text(product.name.toString()),
                  subtitle: Text('${product.quantity} items left'),
                  trailing: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.blue,
                      primary: Colors.white,
                    ),
                    onPressed: () {
                      store.productAdd(product);
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
    });
  }
}
