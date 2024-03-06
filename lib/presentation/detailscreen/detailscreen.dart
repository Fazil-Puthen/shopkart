import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopcart/bloc/cart_bloc.dart';
import 'package:shopcart/model/constatns.dart';
import 'package:shopcart/model/productmodel.dart';
import 'package:shopcart/presentation/cart/cart.dart';
import 'package:shopcart/presentation/detailscreen/componenets/addtocartbutton.dart';

class DetailScreen extends StatelessWidget {
  final Productmodel product;
DetailScreen({super.key,
required this.product});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar:  PreferredSize(preferredSize:const Size.fromHeight(40),
         child: Padding(
           padding: const EdgeInsets.symmetric(horizontal: 20),
           child: SizedBox(height: 100,
           child:   Center(
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(product.name,style:TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                 InkWell(
                  onTap: () {
                    context.read<CartBloc>().add(Cartinit());
                    Navigator.push(context,MaterialPageRoute(builder: (ctx)=>CartScreen()));
                  },
                  child:const  Icon(Icons.shopping_cart,color: Colors.deepOrange,))
              ],
            ),
           ),),
         )),
         body: Padding(
           padding: const EdgeInsets.symmetric(horizontal: 10),
           child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CarouselSlider(
                 items:product.image.map((e) => Container(
                  width: MediaQuery.of(context).size.width,
                  height: 500,
                  child: Image.asset(e),
                 )).toList() ,
                 options: CarouselOptions(
                  aspectRatio: 1.7/2,
                  autoPlayCurve: Curves.easeIn
                 )),
                 wbox,
                 Text(product.name,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                 box,
                 Text('U.S polo', style:TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                 wbox,
                 Text(product.description,style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal),),
                 wbox,
                 Text('Price: ${product.price}',style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),)
              ],
            ),
           ),
         ),
         bottomNavigationBar: BottomAppBar(
        color: Colors.yellow,
        elevation: 100,
        surfaceTintColor: Colors.blue,
        shape: CircularNotchedRectangle(),
         height: 50,
         child: Center(
              child: cartbutton(product: product),
        
         ),),
      ),
    );
  }
}

