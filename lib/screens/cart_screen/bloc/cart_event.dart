part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

class IncrementEvent extends CartEvent {
  final int index;
  IncrementEvent({required this.index});
  List<Object?> get props => [index];
}

class DecrementEvent extends CartEvent {
  final int index;
  DecrementEvent({required this.index});
}
