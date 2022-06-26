import 'package:mobx/mobx.dart';
import 'package:state_management_skillbox12/mobx/logic/model.dart';

import '../logic/values.dart';

part 'logic.g.dart';

class BasketMobxStore = BasketMobxBase with _$BasketMobxStore;

abstract class BasketMobxBase with Store {
  @observable
  List<ItemValueMOBX>? userBasket = userBasketInitial;

  @observable
  List<ItemValueMOBX>? availableProducts = availableProductsInitial;

  @observable
  int totalSum = 0;

  @observable
  int itemsAdded = 0;

  @action
  void productAdd(ItemValueMOBX item) {
    totalSum = totalSum + item.price;
    print(totalSum);

    for (int i = 0; i < userBasket!.length; i++) {
      if (item.id == userBasket?[i].id) {
        itemsAdded++;
        userBasket?[i].quantity++;

        availableProducts?[i].quantity--;
        userBasket?[i].showInBasket = true;
      }
    }
  }

  @action
  void extractAdd(ItemValueMOBX item) {
    totalSum = totalSum - item.price;

    for (int i = 0; i < userBasket!.length; i++) {
      if (item.id == userBasket?[i].id) {
        itemsAdded--;
        userBasket?[i].quantity--;

        availableProducts?[i].quantity++;
        if (availableProducts?[i].quantity == 0) {
          userBasket?[i].showInBasket = false;
        }
      }
    }
  }

  @action
  void declare() {
    totalSum = 0;
    itemsAdded = 0;
    userBasket = userBasketInitial;
    availableProducts = availableProductsInitial;
  }
}
