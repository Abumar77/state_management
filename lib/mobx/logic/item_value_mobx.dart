import 'package:mobx/mobx.dart';

part 'item_value_mobx.g.dart';

class ItemValueMOBX = _ItemValueMOBX with _$ItemValueMOBX;

abstract class _ItemValueMOBX with Store {
  _ItemValueMOBX(
    this.id,
    this.name,
    this.price, {
    required this.quantity,
    this.showInBasket,
  });

  @observable
  String description = '';

  @observable
  bool done = false;

  @observable
  int? id;

  @observable
  String? name;

  @observable
  int price;

  @observable
  int quantity;

  @observable
  bool? showInBasket = false;
}
