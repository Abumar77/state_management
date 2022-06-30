// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_value_mobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ItemValueMOBX on _ItemValueMOBX, Store {
  late final _$descriptionAtom =
      Atom(name: '_ItemValueMOBX.description', context: context);

  @override
  String get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  late final _$doneAtom = Atom(name: '_ItemValueMOBX.done', context: context);

  @override
  bool get done {
    _$doneAtom.reportRead();
    return super.done;
  }

  @override
  set done(bool value) {
    _$doneAtom.reportWrite(value, super.done, () {
      super.done = value;
    });
  }

  late final _$idAtom = Atom(name: '_ItemValueMOBX.id', context: context);

  @override
  int? get id {
    _$idAtom.reportRead();
    return super.id;
  }

  @override
  set id(int? value) {
    _$idAtom.reportWrite(value, super.id, () {
      super.id = value;
    });
  }

  late final _$nameAtom = Atom(name: '_ItemValueMOBX.name', context: context);

  @override
  String? get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String? value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$priceAtom = Atom(name: '_ItemValueMOBX.price', context: context);

  @override
  int get price {
    _$priceAtom.reportRead();
    return super.price;
  }

  @override
  set price(int value) {
    _$priceAtom.reportWrite(value, super.price, () {
      super.price = value;
    });
  }

  late final _$quantityAtom =
      Atom(name: '_ItemValueMOBX.quantity', context: context);

  @override
  int get quantity {
    _$quantityAtom.reportRead();
    return super.quantity;
  }

  @override
  set quantity(int value) {
    _$quantityAtom.reportWrite(value, super.quantity, () {
      super.quantity = value;
    });
  }

  late final _$showInBasketAtom =
      Atom(name: '_ItemValueMOBX.showInBasket', context: context);

  @override
  bool? get showInBasket {
    _$showInBasketAtom.reportRead();
    return super.showInBasket;
  }

  @override
  set showInBasket(bool? value) {
    _$showInBasketAtom.reportWrite(value, super.showInBasket, () {
      super.showInBasket = value;
    });
  }

  @override
  String toString() {
    return '''
description: ${description},
done: ${done},
id: ${id},
name: ${name},
price: ${price},
quantity: ${quantity},
showInBasket: ${showInBasket}
    ''';
  }
}
