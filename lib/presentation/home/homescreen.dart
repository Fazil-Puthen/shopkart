import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopcart/bloc/cart_bloc.dart';
import 'package:shopcart/bloc/home/home_bloc.dart';
import 'package:shopcart/model/productlist.dart';
import 'package:shopcart/presentation/cart/cart.dart';
import 'package:shopcart/presentation/home/components/productbox.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
             SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
               sliver: SliverAppBar(
                leading: const Icon(Icons.menu,color: Colors.deepOrange,),
                actions: [InkWell
                (onTap: () {
                     context.read<CartBloc>().add(Cartinit());
                      Navigator.push(context,MaterialPageRoute(builder: (ctx)=>CartScreen()));
                },
                  child: const Icon(Icons.shopping_cart,color: Colors.deepOrange,))],
                backgroundColor: Colors.white,
                title:  Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Container(width: 100,
                  height: 100,
                    child:Image.asset('asset/ShopKart_transparent.png'),),
                ),
                floating: true,
                // flexibleSpace: Text('flexblespace'),
                centerTitle: true,
                expandedHeight: 40,
                collapsedHeight: 80,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10))),
                           ),
             ),
            SliverPadding(
              padding: const EdgeInsets.all(10),
              sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(childCount: 1,
                      (BuildContext context, index) {
                return SizedBox(
                  width: screenwidth,
                  height: 100,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50)
                        ),
                        child: Image.asset(brandlist[index]),
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                      width: 10,
                    ),
                    itemCount: brandlist.length,
                  ),
                );
              })),
            ),
           
            SliverPadding(
                      padding: EdgeInsets.all(10),
                      sliver: SliverGrid(
                          delegate: SliverChildBuilderDelegate(
                              (BuildContext context, int index) {
                            return BlocBuilder<HomeBloc, HomeState>(
                              builder: (context, state) {
                                if(state is HomeLoading){
                                  return CircularProgressIndicator();
                                }
                                if(state is HomeSucces){
                                  final product=state.prolist;
                                return productbox(product: product[index]);}
                                return SizedBox();
                              },
                            );
                          }, childCount: 4),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 4,
                            mainAxisSpacing: 4,
                            childAspectRatio: 1.0,
                            mainAxisExtent: 350,
                          )),
                    ),        
            
          ],
        ),
      ),
    );
  }
}
