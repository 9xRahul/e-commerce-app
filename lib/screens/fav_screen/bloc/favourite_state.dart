part of 'favourite_bloc.dart';

// ignore: must_be_immutable
class FavouriteState extends Equatable {
  List<Product> favouriteList = [];
  FavouriteState({required this.favouriteList});

  @override
  List<Object> get props => [favouriteList];

  FavouriteState copyWith({required List<Product> favouriteList}) {
    return FavouriteState(favouriteList: favouriteList);
  }
}
