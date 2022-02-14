import '../../Data/item_model.dart';

abstract class BasketState {
  const BasketState();
}

class BasketInitial extends BasketState {
  List<ItemBloc>? cartProducts = [];
  BasketInitial({this.cartProducts});
  @override
  List<Object?> get props => [cartProducts];
}

class BasketLoadInProcess extends BasketState {}

class BasketLoadSuccess extends BasketState {
  const BasketLoadSuccess({required this.cart});

  final List<ItemBloc> cart;

  @override
  List<Object> get props => [cart];
}

class BasketLoadFailure extends BasketState {}
