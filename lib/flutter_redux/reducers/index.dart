import 'package:state_management_skillbox12/flutter_redux/models/appState.dart';
import 'package:state_management_skillbox12/flutter_redux/reducers/products_reducer.dart';

import 'cartStatus_reducer.dart';
import 'cart_reducer.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    products: productsReducer(state.products, action),
    cart: cartReducer(state.cart, action),
    cartStatus: cartStatusReducer(state.cartStatus, action),
  );
}
