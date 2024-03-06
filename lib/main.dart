
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopcart/bloc/cart_bloc.dart';
import 'package:shopcart/bloc/home/home_bloc.dart';
import 'package:shopcart/presentation/splash/splash.dart';

  void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeBloc()..add(Homeintialize()),
        ),
        BlocProvider(
          create: (context) => CartBloc(),
        ),
      ],
      child: const  MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}

