import 'package:mobx/mobx.dart';
import 'package:state_management_skillbox12/mobx/logic/item_value_mobx.dart';

import '../logic/values.dart';

part 'basket_mobx_base.g.dart';

class BasketMobxStore = BasketMobxBase with _$BasketMobxStore;

abstract class BasketMobxBase with Store {
  @observable
  ObservableList<ItemValueMOBX> userBasket = userBasketInitial;

  @observable
  ObservableList<ItemValueMOBX> availableProducts = availableProductsInitial;

  @observable
  int totalSum = 0;

  @observable
  int itemsAdded = 0;

  @action
  void productAdd(ItemValueMOBX item) {
    totalSum = totalSum + item.price;

    for (int i = 0; i < userBasket.length; i++) {
      if (item.id == userBasket[i].id) {
        itemsAdded++;
        userBasket[i].quantity++;
        print(userBasket[i].quantity);
        availableProducts[i].quantity--;
        print(availableProducts[i].quantity);
        userBasket[i].showInBasket = true;
      }
    }
  }

  @action
  void extractAdd(ItemValueMOBX item) {
    totalSum = totalSum - item.price;

    for (int i = 0; i < userBasket.length; i++) {
      if (item.id == userBasket[i].id) {
        itemsAdded--;
        userBasket[i].quantity--;

        availableProducts[i].quantity++;
        if (availableProducts[i].quantity == 0) {
          userBasket[i].showInBasket = false;
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
