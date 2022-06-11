import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_skillbox12/cubit%20bloc/business%20logic/basket_cubit.dart';
import 'package:state_management_skillbox12/cubit%20bloc/ui/basket_page.dart';
import 'package:state_management_skillbox12/cubit%20bloc/ui/my_home_page.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (BuildContext context) => BasketCubit()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePageCubit(),
        // '/basket_page': (context) => const BasketPageCubit(),
      },
    );
  }
}
