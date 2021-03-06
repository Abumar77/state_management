import '../../actions/index.dart';
import '../../models/appState.dart';
import '../../reducers/selectors.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../presentation/cart_footer.dart';

class CartFooterContainer extends StatelessWidget {
  const CartFooterContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (BuildContext context, vm) {
        return CartFooterControl(
          total: vm.total,
          itemCount: vm.itemCount,
          onCheckout: vm.onCheckout,
          checkoutPending: vm.checkoutPending,
          failed: vm.failed,
          error: vm.error,
        );
      },
    );
  }
}

class _ViewModel {
  final double total;
  final int itemCount;
  final VoidCallback onCheckout;
  final bool checkoutPending;
  final bool failed;
  final dynamic error;

  _ViewModel(
      {required this.total,
      required this.itemCount,
      required this.checkoutPending,
      required this.failed,
      @required this.error,
      required this.onCheckout});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
        total: getCartTotal(store.state),
        itemCount: getCartItemCount(store.state),
        checkoutPending: store.state.cartStatus.checkoutPending,
        failed: store.state.cartStatus.failed,
        error: store.state.cartStatus.error,
        onCheckout: () => store.dispatch(Checkout()));
  }
}
