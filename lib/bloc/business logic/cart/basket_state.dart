// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

import '../../data/item_model.dart';

class BasketState extends Equatable {
  BasketState(
      {required this.userBasket,
      required this.totalSum,
      required this.availableProducts,
      required this.itemsAdded});
  List<ItemBlocValueBloc> userBasket = [];

  List<ItemBlocValueBloc> availableProducts = [];

  int totalSum;
  int itemsAdded;

  @override
  List<Object?> get props =>
      [userBasket, availableProducts, totalSum, itemsAdded];

  BasketState copyWith({
    List<ItemBlocValueBloc>? userBasket,
    List<ItemBlocValueBloc>? availableProducts,
    int? totalSum,
    int? itemsAdded,
  }) {
    return BasketState(
      userBasket: userBasket ?? this.userBasket,
      availableProducts: availableProducts ?? this.availableProducts,
      totalSum: totalSum ?? this.totalSum,
      itemsAdded: itemsAdded ?? this.itemsAdded,
    );
  }
}
