import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/constants/text_config.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

//cart bloc
class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc()
    : super(
        CartState(
          cartItems: cartItems,
          total: _calculateInitialTotal(cartItems) + 40,
          subTotal: _calculateInitialTotal(cartItems),
        ),
      ) {
    on<IncrementEvent>(_increment);
    on<DecrementEvent>(_decrementEvent);
  }

  void _increment(IncrementEvent event, Emitter<CartState> emit) {
    state.cartItems[event.index].quantity += 1;

    double subTotal = calculateTotal(state.cartItems);

    emit(
      state.copyWith(
        cartItems: cartItems,
        subTotal: subTotal.toInt(),
        total: (subTotal + 40).toInt(),
      ),
    );
  }

  void _decrementEvent(DecrementEvent event, Emitter<CartState> emit) {
    double subTotal = 0;
    if (state.cartItems[event.index].quantity > 1) {
      state.cartItems[event.index].quantity -= 1;
      subTotal = calculateTotal(state.cartItems);

      emit(
        state.copyWith(
          cartItems: cartItems,
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
