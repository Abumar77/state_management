import 'package:bloc/bloc.dart';
import '../../data/item_model.dart';
import 'basket_event.dart';
import 'basket_state.dart';

class BasketBloc extends Bloc<BasketEvent, BasketState> {
  BasketBloc()
      : super(BasketState(
            itemsAdded: 0,
            availableProducts: [
              ItemBlocValueBloc(0, 'Coca cola', 1, quantity: 41),
              ItemBlocValueBloc(1, 'Pulpy', 2, quantity: 20),
              ItemBlocValueBloc(2, 'Alpen Gold', 2, quantity: 100),
              ItemBlocValueBloc(3, 'Sniskers', 7, quantity: 100),
              ItemBlocValueBloc(4, 'Mars', 1, quantity: 10),
              ItemBlocValueBloc(5, 'Whiskas', 2, quantity: 108),
              ItemBlocValueBloc(6, 'Milka', 1, quantity: 20),
            ],
            userBasket: [
              ItemBlocValueBloc(0, 'Coca cola', 1, quantity: 0),
              ItemBlocValueBloc(1, 'Pulpy', 2, quantity: 0),
              ItemBlocValueBloc(2, 'Alpen Gold', 2, quantity: 0),
              ItemBlocValueBloc(3, 'Sniskers', 7, quantity: 0),
              ItemBlocValueBloc(4, 'Mars', 1, quantity: 0),
              ItemBlocValueBloc(5, 'Whiskas', 2, quantity: 0),
              ItemBlocValueBloc(6, 'Milka', 1, quantity: 0),
            ],
            totalSum: 0)) {
    on<BasketProductAdd>(_productAdd);
    on<BasketProductExtract>(_extractAdd);
    on<CatalogDeclare>(_declare);
  }

  void _productAdd(BasketProductAdd event, Emitter<BasketState> emit) {
    state.totalSum = state.totalSum + event.item.price.toInt();
    emit(state.copyWith(totalSum: state.totalSum));

    for (int i = 0; i < state.userBasket.length; i++) {
      if (event.item.id == state.userBasket[i].id) {
        emit(state.copyWith(itemsAdded: state.itemsAdded + 1));
        state.userBasket[i].quantity++;
        emit(state.copyWith(userBasket: state.userBasket));

        state.availableProducts[i].quantity--;
        emit(state.copyWith(availableProducts: state.availableProducts));

        state.userBasket[i].showInBasket = true;
        emit(state.copyWith(
          userBasket: state.userBasket,
        ));
      }
    }
  }

  void _extractAdd(BasketProductExtract event, Emitter<BasketState> emit) {
    state.totalSum = state.totalSum - event.item.price;
    emit(state.copyWith(totalSum: state.totalSum));

    for (int i = 0; i < state.userBasket.length; i++) {
      if (event.item.id == state.userBasket[i].id) {
        emit(state.copyWith(itemsAdded: state.itemsAdded - 1));
        state.userBasket[i].quantity--;
        emit(state.copyWith(userBasket: state.userBasket));

        state.availableProducts[i].quantity++;
        emit(state.copyWith(availableProducts: state.availableProducts));

        if (state.userBasket[i].quantity == 0) {
          state.userBasket[i].showInBasket = false;
          emit(state.copyWith(userBasket: state.userBasket));
        }
        emit(state.copyWith(
          userBasket: state.userBasket,
          availableProducts: state.availableProducts,
        ));
      }
    }
  }

  void _declare(CatalogDeclare event, Emitter<BasketState> emit) {
    List<ItemBlocValueBloc> availableProductss = [
      ItemBlocValueBloc(0, 'Coca cola', 1, quantity: 41),
      ItemBlocValueBloc(1, 'Pulpy', 2, quantity: 20),
      ItemBlocValueBloc(2, 'Alpen Gold', 2, quantity: 100),
      ItemBlocValueBloc(3, 'Sniskers', 7, quantity: 100),
      ItemBlocValueBloc(4, 'Mars', 1, quantity: 10),
      ItemBlocValueBloc(5, 'Whiskas', 2, quantity: 108),
      ItemBlocValueBloc(6, 'Milka', 1, quantity: 20),
    ];
    emit(state.copyWith(availableProducts: availableProductss));
    List<ItemBlocValueBloc>? userBasket = [
      ItemBlocValueBloc(0, 'Coca cola', 1, quantity: 0),
      ItemBlocValueBloc(1, 'Pulpy', 2, quantity: 0),
      ItemBlocValueBloc(2, 'Alpen Gold', 2, quantity: 0),
      ItemBlocValueBloc(3, 'Sniskers', 7, quantity: 0),
      ItemBlocValueBloc(4, 'Mars', 1, quantity: 0),
      ItemBlocValueBloc(5, 'Whiskas', 2, quantity: 0),
      ItemBlocValueBloc(6, 'Milka', 1, quantity: 0),
    ];
    emit(state.copyWith(userBasket: userBasket));
    state.itemsAdded = 0;
    emit(state.copyWith(itemsAdded: state.itemsAdded));
    state.totalSum = 0;
    emit(state.copyWith(itemsAdded: state.totalSum));
  }
}
