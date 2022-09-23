part of 'cart_cubit.dart';

@immutable
abstract class CartState {
  List<CartItem> cartItem;
  CartState(this.cartItem);
}

class CartInitial extends CartState {
  List<CartItem> cartItem ;
  CartInitial(this.cartItem) : super(cartItem);
}

class CartAdd extends CartState {
  List<CartItem> cartItem;
  CartAdd(this.cartItem):super(cartItem);
}
