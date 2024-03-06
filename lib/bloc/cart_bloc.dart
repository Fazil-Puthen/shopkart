import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopcart/model/productmodel.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<Addtocart>(addtocarthandler);
    on<Removefromcart>(removefromcart);
    on<Cartinit>(cartinitaialze);
  }
  final List<Productmodel> cartlist=[];

  FutureOr<void> addtocarthandler(Addtocart event, Emitter<CartState> emit)async {
  cartlist.add(event.product);
  // final Sharedpre=await SharedPreferences.getInstance();
  // print('the cartlist $cartlist');
  // String arraystring=jsonEncode(cartlist);
  // print('the json $arraystring');
  // Sharedpre.setString('cart', arraystring);
  }

  FutureOr<void> removefromcart(Removefromcart event, Emitter<CartState> emit) async{   
  cartlist.remove(event.product);
  // final Sharedpre=await SharedPreferences.getInstance();
  // String arraystring=jsonEncode(cartlist);
  // Sharedpre.setString('cart', arraystring);
   
  }

  FutureOr<void> cartinitaialze(Cartinit event, Emitter<CartState> emit)async {
  //  final Sharedpre=await SharedPreferences.getInstance();
  //  String list=Sharedpre.getString('cart')??'empty';

  //  if(list.isNotEmpty){
  //  final cartlist2=jsonDecode(list);
   
    int totalprice=0;
    final length=cartlist.length;
    print('the length $length');
    if(length>0){
    for(int i=0;i<length;i++){
     totalprice+=int.parse(cartlist[i].price);
    }
    emit(Cartfetch(cartlist: cartlist,total: totalprice));}
    else{
      emit(Emptycart());
    }
  }
}
