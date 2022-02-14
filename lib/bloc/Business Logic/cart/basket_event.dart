import 'package:equatable/equatable.dart';
import '../../Data/item_model.dart';

abstract class BasketEvent extends Equatable {}

class BasketProductAdd extends BasketEvent {
  ItemBloc item;

  BasketProductAdd({required this.item});
  @override
  List<Object?> get props => [item];
}

class BasketProductExtract extends BasketEvent {
  ItemBloc item;

  BasketProductExtract({required this.item});
  @override
  List<Object?> get props => [item];
}

class BasketProductClear extends BasketEvent {
  @override
  List<Object?> get props => [];
}
