import 'package:bloc/bloc.dart';

import '../../Data/item_model.dart';
import 'basket_event.dart';
import 'basket_state.dart';

class BasketBloc extends Bloc<BasketEvent, BasketState> {
  List<ItemBloc> cartProducts = [];
  BasketBloc() : super(BasketInitial()) {
    on<BasketProductAdd>((event, emit) async {
      emit(BasketLoadInProcess());
      try {
        cartProducts.add(event.item);
        emit(BasketLoadSuccess(cart: cartProducts));
      } catch (e) {
        throw Exception('Something wrong');
      }
    });
    on<BasketProductExtract>((event, emit) async {
      emit(BasketLoadInProcess());
      try {
        cartProducts.remove(event.item);
        emit(BasketLoadSuccess(cart: cartProducts));
      } catch (e) {
        throw Exception('Something wrong');
      }
    });
    on<BasketProductClear>((event, emit) async {
      emit(BasketLoadInProcess());
      try {
        cartProducts = [];
        emit(BasketInitial());
      } catch (e) {
        throw Exception('Something wrong');
      }
    });
  }
}
