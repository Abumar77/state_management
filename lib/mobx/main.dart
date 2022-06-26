import 'package:flutter/material.dart';
import 'package:state_management_skillbox12/mobx/ui/basket_page.dart';
import 'package:state_management_skillbox12/mobx/ui/home_page.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePageMobx(),
        '/basket_page': (context) => BasketPageMobx(),
      },
    );
  }
}
