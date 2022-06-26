import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:state_management_skillbox12/flutter_redux/models/appState.dart';

import '../presentation/cart_button.dart';

class CartButtonContainer extends StatelessWidget {
  const CartButtonContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (BuildContext context, vm) {
        return CartButton(
          itemCount: vm.itemCount,
        );
      },
    );
  }
}

class _ViewModel {
  final int itemCount;

  _ViewModel({required this.itemCount});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
        itemCount:
            store.state.cart.quantityById.values.fold(0, (v, e) => v + e));
  }
}
