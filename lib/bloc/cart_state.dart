part of 'cart_bloc.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

class Cartfetch extends CartState{
  final List<Productmodel> cartlist;
  int? total;
  Cartfetch({
    required this.cartlist,
    this.total,
  });
}

class Emptycart extends CartState{}


