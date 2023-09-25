// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:myapp/Model/shop.dart';
import 'package:myapp/Pages/cart_page.dart';
import 'package:myapp/Pages/intro_page.dart';
import 'package:myapp/Pages/menu_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Shop(),
      child: MyApp(),
    ),
  );

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroPage(),
      routes: {
        '/intropage':(context) => const IntroPage(),
        '/menupage':(context) => const MenuPage(),
        '/cartpage':(context) => const CartPage(),
      },
    ); 
  }
}