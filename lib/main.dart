import 'package:flower_shop/data/category_data.dart';
import 'package:flower_shop/utils/colors.dart';
import 'package:flower_shop/view/home/home_screen.dart';
import 'package:flower_shop/view/home/widgets/CategoryPage.dart';
import 'package:flutter/material.dart';
import 'package:flower_shop/view/home/widgets/FavoritesCategoryPage.dart';
import 'package:flower_shop/view/home/widgets/FlowersCategoryPage.dart';
import 'package:flower_shop/view/home/widgets/BasketCategoryPage.dart';
import 'package:flower_shop/view/home/widgets/Signin.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: kbgClr,
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
      routes: {
        '/category': (context) => CategoryPage(), // Replace `TreningCategoryPage` with the actual widget representing the "Trening" category page
        '/flowers': (context) => FlowersCategoryPage(),
        '/favorites': (context) => FavoritesCategoryPage(),
        '/basket': (context) => BasketCategoryPage(),
        '/SignOut' : (context) =>Signin()},
    );
  }
}

