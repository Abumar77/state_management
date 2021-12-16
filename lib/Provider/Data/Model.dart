class Item {
  int id;
  String name;
  double price;
  int quantity;

  Item(this.id, this.name, this.price, {this.quantity = 1});
}

class Basket {
  List<Item> products;

  Basket({required this.products});
}
