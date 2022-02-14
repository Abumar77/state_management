import '../../Data/item_model.dart';

abstract class CatalogState {}

class CatalogInitial extends CatalogState {
  final List<ItemBloc> availableProducts = [
    ItemBloc(id: 0, name: 'Coca cola', price: 1, quantity: 41),
    ItemBloc(id: 1, name: 'Pulpy', price: 2, quantity: 20),
    ItemBloc(id: 2, name: 'Alpen Gold', price: 2, quantity: 100),
    ItemBloc(id: 3, name: 'Sniskers', price: 7, quantity: 100),
    ItemBloc(id: 4, name: 'Mars', price: 1, quantity: 10),
    ItemBloc(id: 5, name: 'Whiskas', price: 2, quantity: 108),
    ItemBloc(id: 6, name: 'Milka', price: 1, quantity: 20),
    ItemBloc(id: 0, name: 'Coca cola', price: 1, quantity: 41),
  ];
}
