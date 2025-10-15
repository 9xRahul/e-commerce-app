part of 'cart_bloc.dart';

class CartState extends Equatable {
  List<Product> cartProducts = [];
  int total;
  int subTotal;

  CartState({
    required this.cartProducts,
    required this.total,
    required this.subTotal,
  });

  @override
  List<Object?> get props => [cartProducts, total, subTotal];

  CartState copyWith({
    required List<Product> cartProducts,
    required int subTotal,
    required int total,
  }) {
    return CartState(cartProducts: cartProducts, subTotal: subTotal, total: total);
  }
}
