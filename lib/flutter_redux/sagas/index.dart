import 'package:redux_saga/redux_saga.dart';

import '../actions/index.dart';
import '../models/cart.dart';
import '../models/products.dart';
import '../reducers/selectors.dart';
import '../services/index.dart';

rootSaga() sync* {
  yield All({
    #t1: Fork(getAllProducts),
    #t2: Fork(watchGetProducts),
    #t3: Fork(trigGetProducts),
    #t4: Fork(watchCheckout)
  });
}

getAllProducts({action}) sync* {
  var products = Result<Products>();
  yield Call(getProductsAPI, result: products);
  yield Put(ReceiveProducts(products.value!));
}

watchGetProducts() sync* {
  yield TakeEvery(getAllProducts, pattern: GetAllProducts);
}

trigGetProducts() sync* {
  while (true) {
    yield Delay(const Duration(seconds: 10));
    yield Put(GetAllProducts());
  }
}

watchCheckout() sync* {
  while (true) {
    yield Take(pattern: Checkout);
    yield Call(checkout);
  }
}

checkout() sync* {
  yield Try(() sync* {
    var cart = Result<Cart>();
    yield Select(selector: getCart, result: cart);
    yield Call(buyProductsAPI, args: [cart.value]);
    yield Put(CheckoutSuccess(cart.value!));
  }, Catch: (e, s) sync* {
    yield Put(CheckoutFailure(e));
  });
}
