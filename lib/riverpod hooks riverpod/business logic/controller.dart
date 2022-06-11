import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_management_skillbox12/riverpod hooks riverpod/data/model.dart';

final basketProvider = ChangeNotifierProvider((ref) => BasketController());

class BasketController extends ChangeNotifier {
  Basket userBasket = Basket(products: [
    Item(0, 'Coca cola', 1, quantity: 0),
    Item(1, 'Pulpy', 2, quantity: 0),
    Item(2, 'Alpen Gold', 2, quantity: 0),
    Item(3, 'Sniskers', 7, quantity: 0),
    Item(4, 'Mars', 1, quantity: 0),
    Item(5, 'Whiskas', 2, quantity: 0),
    Item(6, 'Milka', 1, quantity: 0),
  ]);

  double total = 0;

  Basket availableProducts = Basket(
    products: [
      Item(0, 'Coca cola', 1, quantity: 41),
      Item(1, 'Pulpy', 2, quantity: 20),
      Item(2, 'Alpen Gold', 2, quantity: 100),
      Item(3, 'Sniskers', 7, quantity: 100),
      Item(4, 'Mars', 1, quantity: 10),
      Item(5, 'Whiskas', 2, quantity: 108),
      Item(6, 'Milka', 1, quantity: 20),
      Item(0, 'Coca cola', 1, quantity: 41),
      Item(1, 'Pulpy', 2, quantity: 20),
      Item(2, 'Alpen Gold', 2, quantity: 100),
      Item(3, 'Sniskers', 7, quantity: 100),
      Item(4, 'Mars', 1, quantity: 10),
      Item(5, 'Whiskas', 2, quantity: 108),
      Item(6, 'Milka', 1, quantity: 20),
      Item(0, 'Coca cola', 1, quantity: 41),
      Item(1, 'Pulpy', 2, quantity: 20),
      Item(2, 'Alpen Gold', 2, quantity: 100),
      Item(3, 'Sniskers', 7, quantity: 100),
      Item(4, 'Mars', 1, quantity: 10),
      Item(5, 'Whiskas', 2, quantity: 108),
      Item(6, 'Milka', 1, quantity: 20),
      Item(0, 'Coca cola', 1, quantity: 41),
      Item(1, 'Pulpy', 2, quantity: 20),
      Item(2, 'Alpen Gold', 2, quantity: 100),
      Item(3, 'Sniskers', 7, quantity: 100),
      Item(4, 'Mars', 1, quantity: 10),
      Item(5, 'Whiskas', 2, quantity: 108),
      Item(6, 'Milka', 1, quantity: 20),
    ],
  );

  void addToBasket(Item item) {
    total = total + item.price;

    for (var i = 0; i < userBasket.products.length; i++) {
      if (item.id == userBasket.products[i].id) {
        userBasket.products[i].quantity++;
        userBasket.products[i].showInBasket = true;
      }
    }
    availableProducts.products[item.id].quantity--;

    notifyListeners();
  }

  void removeFromBasket(Item item, int index) {
    for (var i = 0; i < userBasket.products.length; i++) {
      if (item.id == userBasket.products[i].id) {
        userBasket.products[i].quantity--;
        if (userBasket.products[i].quantity == 0) {
          userBasket.products[i].showInBasket = false;
        }
      }
    }
    total = total - item.price;
    notifyListeners();
  }
}
