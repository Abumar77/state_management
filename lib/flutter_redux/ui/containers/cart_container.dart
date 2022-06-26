import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:state_management_skillbox12/flutter_redux/actions/index.dart';
import 'package:state_management_skillbox12/flutter_redux/models/appState.dart';
import 'package:state_management_skillbox12/flutter_redux/models/product.dart';
import 'package:state_management_skillbox12/flutter_redux/ui/presentation/cart.dart';

class CartContainer extends StatelessWidget {
  const CartContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (BuildContext context, vm) {
        return CartControl(
          cartProductsByQuantity: vm.cartProductsByQuantity,
          onRemoveFromCart: vm.onRemoveFromCart,
          checkoutPending: vm.checkoutPending,
        );
      },
    );
  }
}

class _ViewModel {
  final Map<Product, int> cartProductsByQuantity;
  final Function(int) onRemoveFromCart;
  final bool checkoutPending;

  _ViewModel(
      {required this.cartProductsByQuantity,
      required this.onRemoveFromCart,
      required this.checkoutPending});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      cartProductsByQuantity: store.state.cart.quantityById.map<Product, int>(
          (key, value) => MapEntry<Product, int>(
              store.state.products.items.firstWhere((p) => p.id == key),
              value)),
      onRemoveFromCart: (productId) =>
          store.dispatch(RemoveFromCart(productId)),
      checkoutPending: store.state.cartStatus.checkoutPending,
    );
  }
}
