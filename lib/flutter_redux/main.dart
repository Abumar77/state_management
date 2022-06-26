import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:state_management_skillbox12/flutter_redux/ui/cart.dart';
import 'package:state_management_skillbox12/flutter_redux/ui/home.dart';
import 'package:state_management_skillbox12/flutter_redux/reducers/index.dart';
import 'package:state_management_skillbox12/flutter_redux/sagas/index.dart';

import 'models/appState.dart';

import 'package:redux_saga/redux_saga.dart';

void main() {
  runApp(
    MyApp(
      store: configureStore(),
    ),
  );
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;

  const MyApp({Key? key, required this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
        store: store,
        child: MaterialApp(
          title: 'Redux Shopping Cart',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          debugShowCheckedModeBanner: false,
          routes: {
            '/': (context) => const HomePage(),
            '/cart': (context) => const CartPage(),
          },
        ));
  }
}

Store<AppState> configureStore() {
  SagaMiddleware sagaMiddleware = createSagaMiddleware();

  final store = Store<AppState>(
    appReducer,
    initialState: AppState.initial(),
    middleware: [
      applyMiddleware(sagaMiddleware),
    ],
  );

  sagaMiddleware.setStore(store);

  sagaMiddleware.run(rootSaga);

  return store;
}
