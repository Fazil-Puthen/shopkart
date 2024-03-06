import 'package:flutter/material.dart';
import 'package:shopcart/bloc/home/home_bloc.dart';
import 'package:shopcart/presentation/cart/cart.dart';
import 'package:shopcart/presentation/home/homescreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3),(){
      Navigator.pushReplacement(context,MaterialPageRoute(builder: (ctx)=>HomeScreen()));
    });
  }
  @override
  Widget build(BuildContext context) {
    final screenheight=MediaQuery.of(context).size.height;
    final screenwidth=MediaQuery.of(context).size.width;
    return  Scaffold(
      body: Container(
       width: screenwidth,
       height: screenheight,
       child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(child: Image.asset('asset/ShopKart_transparent.png')),
            const SizedBox(height: 10,),
            const CircularProgressIndicator()          
          ],
        ),
       ),
      ),
    );
  }
}