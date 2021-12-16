import 'package:flutter/material.dart';
import 'package:state_management_skillbox12/Provider/Data/Model.dart';

class BasketController with ChangeNotifier {
  Basket basket = Basket(products: []);

  double total = 0;

  Basket availableProducts = Basket(products: [
    Item(0, 'Coca cola', 1, quantity: 41),
    Item(1, 'Pulpy', 2, quantity: 20),
    Item(2, 'Alpen Gold', 2, quantity: 100),
    Item(3, 'Sniskers', 7, quantity: 100),
    Item(4, 'Mars', 1, quantity: 10),
    Item(5, 'Whiskas', 2, quantity: 108),
    Item(6, 'Milka', 1, quantity: 20),
  ]);

  void addToBasket(Item item) {
    total = total + item.price;

    availableProducts.products[item.id].quantity--;

    basket.products.add(item);

    notifyListeners();
  }

  void removeFromBasket(Item item, int index) {
    basket.products.removeAt(index);
    total = total - item.price;
    notifyListeners();
  }
}
