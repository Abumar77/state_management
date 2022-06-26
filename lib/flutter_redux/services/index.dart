// ignore_for_file: constant_identifier_names

import 'package:state_management_skillbox12/flutter_redux/services/products.dart';

import '../models/cart.dart';
import '../models/products.dart';

const APITimeout = Duration(seconds: 1);
const MaxCheckout = 2;

Future<Products> getProductsAPI() async {
  return Future<Products>.delayed(
      APITimeout, () => Products.fromJson(productsData));
}

Future<Cart> buyProductsAPI(Cart cart) async {
  return Future<Cart>.delayed(APITimeout, () {
    if (cart.quantityById.keys.length <= MaxCheckout) {
      return cart;
    } else {
      throw Exception(
          'You can buy $MaxCheckout items at maximum in a checkout');
    }
  });
}
