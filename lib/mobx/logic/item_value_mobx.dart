class ItemValueMOBX {
  final int? id;
  final String? name;
  int price;
  int quantity;
  bool? showInBasket = false;

  ItemValueMOBX(
    this.id,
    this.name,
    this.price, {
    required this.quantity,
    this.showInBasket = false,
  });
}
