import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:qtec_task/Models/cart_item.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial([]));

  addProduct(String slug) {
    List<CartItem> cartItemList = state.cartItem;
    int amount = 0;
    cartItemList.forEach((element) {
      if (element.slug == slug) {
        amount = element.amount;
        cartItemList.remove(CartItem(amount: amount, slug: slug));
      }
    });

    cartItemList.add(CartItem(amount: amount + 1, slug: slug));
    emit(CartAdd(cartItemList));
  }

  removeProduct(String slug) {
    List<CartItem> cartItemList = state.cartItem;
    int amount = 1;
    cartItemList.forEach((element) {
      if (element.slug == slug) {
        amount = element.amount;
        cartItemList.remove(CartItem(amount: amount, slug: slug));
      }
    });

    cartItemList.add(CartItem(amount: amount - 1, slug: slug));
    emit(CartAdd(cartItemList));
  }

  int getAmount(String slug) {
    List<CartItem> cartItemList = state.cartItem;
    int aa = 0;
    cartItemList.forEach((element) {
      if (element.slug == slug) {
        aa = element.amount;
      }
    });

    return aa;
  }

  
}
