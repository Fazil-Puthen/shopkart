import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopcart/bloc/cart_bloc.dart';
import 'package:shopcart/model/productmodel.dart';

class cartbutton extends StatefulWidget {
  const cartbutton({
    super.key,
    required this.product,
  });

  final Productmodel product;

  @override
  State<cartbutton> createState() => _cartbuttonState();
}

class _cartbuttonState extends State<cartbutton> {
  bool isadded= false;
  @override
  Widget build(BuildContext context) {
    return InkWell
    (onTap: () {
      setState(() {
        isadded=!isadded;
      });
       isadded?context.read<CartBloc>().add(Addtocart(product: widget.product)):
      context.read<CartBloc>().add(Removefromcart(product:widget.product));
    },
      child:isadded?Text('Added to cart',style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),):
      Text('Add to cart',style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),));
  }
}