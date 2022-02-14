import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:state_management_skillbox12/Provider/Business%20Logic/controller.dart';
import 'package:state_management_skillbox12/bloc/Business%20Logic/cart/basket_event.dart';
import 'package:state_management_skillbox12/bloc/Business%20Logic/catalog/catalog_cubit.dart';

import '../Business Logic/cart/basket_bloc.dart';
import '../Business Logic/cart/basket_state.dart';
import '../Data/item_model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

//price: val.price+(element.price - (element.price*element.off)))).price.toStringAsFixed(2)
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BasketBloc(),
      child: Scaffold(
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
                        radius: 10,
                        child: BlocBuilder<BasketBloc, BasketState>(
                            builder: (context, state) => Text(
                                  '${BlocProvider.of<BasketBloc>(context).cartProducts.length}',
                                  style: const TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold),
                                )),
                        backgroundColor: Colors.red,
                      ))
                ],
              ),
              onPressed: () => Navigator.pushNamed(context, '/basket_page')),
        ),
        body: Padding(
          padding: const EdgeInsets.all(1.0),
          child: BlocBuilder<CatalogCubit, List<ItemBloc>>(
            builder: (context, state) {
              return ListView.builder(
                  itemCount: context.read<CatalogCubit>().state.length,
                  itemBuilder: (
                    BuildContext context,
                    int index,
                  ) {
                    return ListTile(
                      leading: Text('${state[index].price} \$'),
                      title: Text(state[index].name.toString()),
                      subtitle: Text('${state[index].quantity} items left'),
                      trailing: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.blue,
                          primary: Colors.white,
                        ),
                        onPressed: () {
                          BlocProvider.of<BasketBloc>(context).add(
                            BasketProductAdd(item: state[index]),
                          );
                        },
                        child: const Text('Add to Cart'),
                      ),
                    );
                  });
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          tooltip: 'Increment',
          onPressed: () {
            Navigator.pushNamed(context, '/basket_page');
          },
          child: const Icon(Icons.shopping_cart),
        ),
      ),
    );
  }
}
