import 'package:ecommerce_app/home/cartScreen.dart';
import 'package:ecommerce_app/home/checkoutScreen.dart';
import 'package:ecommerce_app/home/detailPage.dart';
import 'package:ecommerce_app/home/practicePage.dart';
import 'package:flutter/material.dart';
import 'home/splashScreen.dart';
import 'home/homePage.dart';
void main()
{
   runApp(EcommerceApp(),);
}

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context) => splashScreen(),
        '/homePage':(context) => HomeScreen(),
        '/detailPage':(context) => detailScreen(),
        '/cartPage':(context) =>cartScreen(),
        '/checkout':(context) => checkout(),
      },
    );
  }
}
