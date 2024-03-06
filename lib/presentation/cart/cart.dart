import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopcart/bloc/cart_bloc.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(100),
            child: Container(
              height: 70,
              child: Center(
                child: Column(
                  children: [Container(
                    width: 50,
                    height: 50,
                    child: Image.asset('asset/ShopKart_transparent.png')),
                  const Text('Cart',style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500),)],
                  
                )
              ),
            )),
        body: Column(
          children: [
            Expanded(
              child: SizedBox(
                child: BlocBuilder<CartBloc, CartState>(
                  builder: (context, state) {
                    if (state is Cartfetch) {
                      final datalist = state.cartlist;
                      return ListView.builder(
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.all(5),
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(width: 0.1)),
                                width: screenwidth,
                                height: 100,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    ClipRect(
                                      child: Image.asset(
                                          datalist[index].image[index]),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(datalist[index].name,style: TextStyle(fontSize: 14,fontWeight:FontWeight.w600),),
                                        Text('price: ₹ ${datalist[index].price}',
                                        style: TextStyle(fontSize: 12,color: Colors.red),)
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        InkWell(onTap: () {
                                          context.read<CartBloc>().add(Removefromcart(product:datalist[index]));
                                          context.read<CartBloc>().add(Cartinit());

                                        },
                                          child: Text(
                                            'Remove',
                                            style: TextStyle(fontSize: 10),
                                          ),
                                        ),
                                        Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                          size: 20,
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                          itemCount: datalist.length);
                    }
                    return const Center(
                      child: Text('No products in Cart',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                    );
                  },
                ),
              ),
            ),
            Container(
              height: 50,
              width: screenwidth,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BlocBuilder<CartBloc, CartState>(
                    builder: (context, state) {
                      if(state is Cartfetch){
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Total price: ',
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.bold),
                          ),
                          Text(state.total.toString(),style:
                          const TextStyle(fontSize: 13,fontWeight: FontWeight.bold),)
                        ],
                      );}
                      return const  SizedBox();
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
