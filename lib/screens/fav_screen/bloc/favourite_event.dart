part of 'favourite_bloc.dart';

sealed class FavouriteEvent extends Equatable {
  const FavouriteEvent();

  @override
  List<Object> get props => [];
}

class AddToFavEvent extends FavouriteEvent {
  int id;
  AddToFavEvent({required this.id});
}

class RemoveFavEvent extends FavouriteEvent {
  int id;
  RemoveFavEvent({required this.id});
}
