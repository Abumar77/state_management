import 'package:state_management_skillbox12/mobx/logic/model.dart';

List<ItemValueMOBX> availableProductsInitial = [
  ItemValueMOBX(0, 'Coca cola', 1, quantity: 41),
  ItemValueMOBX(1, 'Pulpy', 2, quantity: 20),
  ItemValueMOBX(2, 'Alpen Gold', 2, quantity: 100),
  ItemValueMOBX(3, 'Sniskers', 7, quantity: 100),
  ItemValueMOBX(4, 'Mars', 1, quantity: 10),
  ItemValueMOBX(5, 'Whiskas', 2, quantity: 108),
  ItemValueMOBX(6, 'Milka', 1, quantity: 20),
];

List<ItemValueMOBX>? userBasketInitial = [
  ItemValueMOBX(0, 'Coca cola', 1, quantity: 0),
  ItemValueMOBX(1, 'Pulpy', 2, quantity: 0),
  ItemValueMOBX(2, 'Alpen Gold', 2, quantity: 0),
  ItemValueMOBX(3, 'Sniskers', 7, quantity: 0),
  ItemValueMOBX(4, 'Mars', 1, quantity: 0),
  ItemValueMOBX(5, 'Whiskas', 2, quantity: 0),
  ItemValueMOBX(6, 'Milka', 1, quantity: 0),
];
