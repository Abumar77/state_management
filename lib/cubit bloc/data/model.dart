class ItemCubit {
  int id;
  String name;
  int? price;
  int quantity = 1;
  bool showInBasket = false;

  ItemCubit(
    this.id,
    this.name,
    this.price, {
    this.quantity = 1,
    this.showInBasket = false,
  });
}
