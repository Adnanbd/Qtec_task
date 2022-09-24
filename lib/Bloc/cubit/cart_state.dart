part of 'cart_cubit.dart';

abstract class CartState {
  List<CartItem> cartItem;
  int totalProduct; 
  CartState(this.cartItem,this.totalProduct);
}

class CartInitial extends CartState {
  List<CartItem> cartItem;
  @override
  int totalProduct;
  CartInitial(this.cartItem,this.totalProduct) : super(cartItem,totalProduct);
}

class CartAdd extends CartState {
  List<CartItem> cartItem;
  int totalProduct;
  CartAdd(this.cartItem,this.totalProduct) : super(cartItem,totalProduct);
}
