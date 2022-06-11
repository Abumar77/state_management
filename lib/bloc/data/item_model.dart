class ItemBlocValueBloc {
  final int? id;
  final String? name;
  int price;
  int quantity;
  bool? showInBasket = false;

  ItemBlocValueBloc(
    this.id,
    this.name,
    this.price, {
    required this.quantity,
    this.showInBasket = false,
  });
}
