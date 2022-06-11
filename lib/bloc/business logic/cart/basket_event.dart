import 'package:equatable/equatable.dart';
import '../../data/item_model.dart';

abstract class BasketEvent extends Equatable {
  const BasketEvent();
}

class BasketProductAdd extends BasketEvent {
  final ItemBlocValueBloc item;

  const BasketProductAdd({required this.item});
  @override
  List<Object?> get props => [item];
}

class CatalogDeclare extends BasketEvent {
  @override
  List<Object?> get props => [];
}

class BasketProductExtract extends BasketEvent {
  final ItemBlocValueBloc item;

  const BasketProductExtract({required this.item});
  @override
  List<Object?> get props => [item];
}
