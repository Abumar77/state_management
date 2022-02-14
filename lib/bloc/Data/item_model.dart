import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class ItemBloc extends Equatable {
  int? id;
  String? name;
  double? price;
  int? quantity;
  bool? showInBasket = false;

  ItemBloc({
    this.id,
    this.name,
    this.price,
    this.quantity = 1,
    this.showInBasket = false,
  });

  @override
  List<Object?> get props => [id, name, quantity, price, showInBasket];
}
