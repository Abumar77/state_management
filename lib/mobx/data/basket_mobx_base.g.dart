// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basket_mobx_base.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BasketMobxStore on BasketMobxBase, Store {
  late final _$userBasketAtom =
      Atom(name: 'BasketMobxBase.userBasket', context: context);

  @override
  ObservableList<ItemValueMOBX> get userBasket {
    _$userBasketAtom.reportRead();
    return super.userBasket;
  }

  @override
  set userBasket(ObservableList<ItemValueMOBX> value) {
    _$userBasketAtom.reportWrite(value, super.userBasket, () {
      super.userBasket = value;
    });
  }

  late final _$availableProductsAtom =
      Atom(name: 'BasketMobxBase.availableProducts', context: context);

  @override
  ObservableList<ItemValueMOBX> get availableProducts {
    _$availableProductsAtom.reportRead();
    return super.availableProducts;
  }

  @override
  set availableProducts(ObservableList<ItemValueMOBX> value) {
    _$availableProductsAtom.reportWrite(value, super.availableProducts, () {
      super.availableProducts = value;
    });
  }

  late final _$totalSumAtom =
      Atom(name: 'BasketMobxBase.totalSum', context: context);

  @override
  int get totalSum {
    _$totalSumAtom.reportRead();
    return super.totalSum;
  }

  @override
  set totalSum(int value) {
    _$totalSumAtom.reportWrite(value, super.totalSum, () {
      super.totalSum = value;
    });
  }

  late final _$itemsAddedAtom =
      Atom(name: 'BasketMobxBase.itemsAdded', context: context);

  @override
  int get itemsAdded {
    _$itemsAddedAtom.reportRead();
    return super.itemsAdded;
  }

  @override
  set itemsAdded(int value) {
    _$itemsAddedAtom.reportWrite(value, super.itemsAdded, () {
      super.itemsAdded = value;
    });
  }

  late final _$BasketMobxBaseActionController =
      ActionController(name: 'BasketMobxBase', context: context);

  @override
  void productAdd(ItemValueMOBX item) {
    final _$actionInfo = _$BasketMobxBaseActionController.startAction(
        name: 'BasketMobxBase.productAdd');
    try {
      return super.productAdd(item);
    } finally {
      _$BasketMobxBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void extractAdd(ItemValueMOBX item) {
    final _$actionInfo = _$BasketMobxBaseActionController.startAction(
        name: 'BasketMobxBase.extractAdd');
    try {
      return super.extractAdd(item);
    } finally {
      _$BasketMobxBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void declare() {
    final _$actionInfo = _$BasketMobxBaseActionController.startAction(
        name: 'BasketMobxBase.declare');
    try {
      return super.declare();
    } finally {
      _$BasketMobxBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
userBasket: ${userBasket},
availableProducts: ${availableProducts},
totalSum: ${totalSum},
itemsAdded: ${itemsAdded}
    ''';
  }
}
