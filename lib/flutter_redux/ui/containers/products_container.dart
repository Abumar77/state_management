import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:state_management_skillbox12/flutter_redux/actions/index.dart';
import 'package:state_management_skillbox12/flutter_redux/models/appState.dart';
import 'package:state_management_skillbox12/flutter_redux/models/products.dart';
import 'package:state_management_skillbox12/flutter_redux/ui/presentation/products.dart';

class ProductsContainer extends StatelessWidget {
  const ProductsContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (BuildContext context, vm) {
        return ProductsControl(
          products: vm.products,
          onAddToCart: vm.onAddToCart,
        );
      },
    );
  }
}

class _ViewModel {
  final Products products;
  final Function(int) onAddToCart;

  _ViewModel({required this.products, required this.onAddToCart});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
        products: store.state.products,
        onAddToCart: (productId) => store.dispatch(AddToCart(productId)));
  }
}
