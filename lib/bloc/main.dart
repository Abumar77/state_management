import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_skillbox12/bloc/Business%20Logic/cart/basket_bloc.dart';
import 'package:state_management_skillbox12/bloc/Business%20Logic/catalog/catalog_cubit.dart';

import 'UI/basket_page.dart';
import 'UI/home_page.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => BasketBloc(),
      ),
      BlocProvider(
        create: (context) => CatalogCubit(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(),
        '/basket_page': (context) => BasketPage(),
      },
    );
  }
}
