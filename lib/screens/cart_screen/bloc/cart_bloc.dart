import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/constants/text_config.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

//cart bloc
class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartState(cartProducts: [], total: 0, subTotal: 0)) {
    on<IncrementEvent>(_increment);
    on<DecrementEvent>(_decrementEvent);
    on<DeleteCartItemEvent>(_deleteCartItem);
    on<AddtoCartEvent>(_addToCartEvent);
  }

  void _addToCartEvent(AddtoCartEvent event, Emitter<CartState> emit) {
    if (!state.cartProducts.contains(cartItems[event.index])) {
      state.cartProducts.add(cartItems[event.index]);
      List<Product> tempList = state.cartProducts;
      emit(
        state.copyWith(
          cartProducts: tempList,
          subTotal: _calculateInitialTotal(state.cartProducts),
          total: _calculateInitialTotal(state.cartProducts) + 40,
        ),
      );
    }
  }

  void _deleteCartItem(DeleteCartItemEvent event, Emitter<CartState> emit) {
    print(state.cartProducts);

    List<Product> newCart = [];

    for (var item in state.cartProducts) {
      if (item.id != event.index) {
        newCart.add(item);
      }
    }

    double subTotal = calculateTotal(newCart);

    emit(
      state.copyWith(
        cartProducts: newCart,
        subTotal: subTotal.toInt(),
        total: subTotal.toInt() + 40,
      ),
    );
  }

  void _increment(IncrementEvent event, Emitter<CartState> emit) {
    state.cartProducts[event.index].quantity += 1;

    double subTotal = calculateTotal(state.cartProducts);

    emit(
      state.copyWith(
        cartProducts: state.cartProducts,
        subTotal: subTotal.toInt(),
        total: (subTotal + 40).toInt(),
      ),
    );
  }

  void _decrementEvent(DecrementEvent event, Emitter<CartState> emit) {
    double subTotal = 0;
    if (state.cartProducts[event.index].quantity > 1) {
      state.cartProducts[event.index].quantity -= 1;
      subTotal = calculateTotal(state.cartProducts);

      emit(
        state.copyWith(
          cartProducts: state.cartProducts,
          subTotal: subTotal.toInt(),
          total: (subTotal + 40).toInt(),
        ),
      );
    }
  }

  double calculateTotal(List<Product> items) {
    double total = 0;
    for (var item in items) {
      total += item.price * item.quantity;
    }
    return total;
  }

  static int _calculateInitialTotal(List<Product> items) {
    double total = 0;
    for (var item in items) {
      total += item.price * item.quantity;
    }
    return total.toInt();
  }
}
