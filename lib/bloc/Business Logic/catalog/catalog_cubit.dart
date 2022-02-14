import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:state_management_skillbox12/bloc/Data/item_model.dart';

import 'catalog_state.dart';

class CatalogCubit extends Cubit<List<ItemBloc>> {
  CatalogCubit() : super(CatalogInitial().availableProducts);
}
