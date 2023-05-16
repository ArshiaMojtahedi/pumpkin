import 'package:pumpkin/Data/model/cartItem.dart';
import 'package:pumpkin/Data/model/product.dart';

class LoginRequest {
  String email, password, name;

  LoginRequest(this.email, this.password, {String? name}) : name = name ?? '';
}

class AddToCartRequest {
  CartItem cartItem;

  AddToCartRequest(this.cartItem);
}
