class Item {
  int id;
  String name;
  int price;
  int quantity;
  bool showInBasket = false;

  Item(
    this.id,
    this.name,
    this.price, {
    this.quantity = 1,
    this.showInBasket = false,
  });
}

class Basket {
  List<Item> products;

  Basket({required this.products});
}
