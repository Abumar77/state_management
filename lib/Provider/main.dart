import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_skillbox12/Provider/Business%20Logic/controller.dart';
import 'package:state_management_skillbox12/Provider/UI/basket_page.dart';

import 'UI/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BasketController>(
      create: (_) => BasketController(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => MyHomePage(),
          '/basket_page': (context) => BasketPage(),
        },
      ),
    );
  }
}
