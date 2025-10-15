import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/constants/text_config.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:equatable/equatable.dart';

part 'favourite_event.dart';
part 'favourite_state.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  FavouriteBloc() : super(FavouriteState(favouriteList: [])) {
    on<AddToFavEvent>(_makeFav);
  }

  void _makeFav(AddToFavEvent event, Emitter<FavouriteState> emit) {
    final currentList = List<Product>.from(state.favouriteList);

    final product = cartItems[event.id];

    if (currentList.contains(product)) {
      currentList.remove(product);
    } else {
      currentList.add(product);
    }

    emit(state.copyWith(favouriteList: currentList));
  }
}
