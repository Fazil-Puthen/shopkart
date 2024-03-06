part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

class Cartinit extends CartEvent{}

class Addtocart extends CartEvent{
  final Productmodel product;
  Addtocart({
    required this.product
  });
}

class Removefromcart extends CartEvent{
    final Productmodel product;
  Removefromcart({
    required this.product
  });
}