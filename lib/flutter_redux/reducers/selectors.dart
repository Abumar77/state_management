import 'package:state_management_skillbox12/flutter_redux/models/appState.dart';

import '../models/cart.dart';

double getCartTotal(AppState state) => state.cart.quantityById.keys.fold(
    0,
    (sum, productId) =>
        sum +
        state.cart.quantityById[productId]! *
            state.products.items.singleWhere((p) => p.id == productId).price);

getCartItemCount(AppState state) => state.cart.quantityById.values
    .fold(0, (int sum, int quantity) => sum + quantity);

Cart getCart(AppState state) => state.cart;
