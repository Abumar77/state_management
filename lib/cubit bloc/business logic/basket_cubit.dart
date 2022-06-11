import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:state_management_skillbox12/bloc/Business%20Logic/cart/basket_state.dart';

import '../data/model.dart';

class BasketCubit extends Cubit<dynamic> {
  dynamic basket = {};
  dynamic catalog = {};
  dynamic totalSum = 0;

  BasketCubit() : super(0);

  addProducts(ItemCubit item) {
    if (basket.containsKey(item.id)) {
      emit(basket[item.id]?.quantity++);
      emit(totalSum = totalSum + basket[item.id]?.price);
    } else {
      emit(basket[item.id] = item);
      emit(totalSum = totalSum + basket[item.id]?.price);
    }
    print(basket[item.id]);
    print(totalSum);
    emit(catalog[item.id]?.quantity--);
  }

  extractProduct(ItemCubit item) {
    if (basket[item.id]!.quantity >= 0) {
      emit(basket[item.id]?.quantity--);
      emit(totalSum = totalSum - basket[item.id]?.price);
    } else {
      emit(basket.remove(item.id));
      emit(totalSum = totalSum - basket[item.id]?.price);
    }

    print(basket[item.id]);
    print(totalSum);
    emit(catalog[item.id]?.quantity++);
  }

  setCatalog(Map<int?, ItemCubit> Initialcatalog) {
    emit(catalog = Initialcatalog);
  }
}
