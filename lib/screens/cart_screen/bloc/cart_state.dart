part of 'cart_bloc.dart';

class CartState extends Equatable {
  List<Product> cartItems = [];
  int total;
  int subTotal;

  CartState({
    required this.cartItems,
    required this.total,
    required this.subTotal,
  });

  @override
  List<Object?> get props => [cartItems, total, subTotal];

  CartState copyWith({
    required List<Product> cartItems,
    required int subTotal,
    required int total,
  }) {
    return CartState(cartItems: cartItems, subTotal: subTotal, total: total);
  }
}
